//
//  PDebugEntry.m
//  Portal
//
//  Created by Ethan on 15/3/5.
//  Copyright (c) 2015年 com. All rights reserved.
//

#import "PDebugEntry.h"
#import <objc/runtime.h>
#import <dlfcn.h>
#import "fishhook.h"
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "RTBRuntime.h"
#import "RTBRuntimeHeader.h"

static void * (*orig_dlsym)(void *, const char *);

int my_ptrace(int _request, pid_t _pid, caddr_t _addr, int _data)
{
    return 0;
}

void * my_dlsym(void * __handle, const char * __symbol)
{
    if (strcmp(__symbol, "ptrace") == 0) {
        return &my_ptrace;
    }
    
    return orig_dlsym(__handle, __symbol);
}

@implementation PDebugEntry

+(void)load
{
    orig_dlsym = dlsym(RTLD_DEFAULT, "dlsym");
    rebind_symbols((struct rebinding[1]){{"dlsym", my_dlsym}}, 1);
    
    NSLog(@"PDebug injected.");
    
//    [self generateHeaders];
}

+ (void)generateHeaders
{
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *baseFolder = [docPath stringByAppendingPathComponent:@"headers"];
    NSError *err = nil;
    [[NSFileManager defaultManager] removeItemAtPath:baseFolder error:&err];
    [[NSFileManager defaultManager] createDirectoryAtPath:baseFolder withIntermediateDirectories:YES attributes:nil error:&err];
    RTBRuntime *rt = [RTBRuntime sharedInstance];
    [rt emptyCachesAndReadAllRuntimeClasses];
    [rt.allClassStubsByImagePath enumerateKeysAndObjectsUsingBlock:^(NSString *  _Nonnull imagePath, NSArray *  _Nonnull classNames, BOOL * _Nonnull stop) {
        if (![imagePath containsString:[[NSBundle mainBundle] bundlePath]]) {
            return;
        }
        [classNames enumerateObjectsUsingBlock:^(RTBClass * _Nonnull cls, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *className = cls.classObjectName;
            Class klass = NSClassFromString(className);
            NSString *header = [RTBRuntimeHeader headerForClass:klass displayPropertiesDefaultValues:YES];
            if (!header) {
                return;
            }
            NSString *headerPath = [[baseFolder stringByAppendingPathComponent:className] stringByAppendingPathExtension:@"h"];;
            NSError *err = nil;
            [header writeToFile:headerPath atomically:YES encoding:NSUTF8StringEncoding error:&err];
        }];
    }];
    
}

@end
