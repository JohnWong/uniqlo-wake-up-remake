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
    
//    [self registerFonts];
    
    UIFont *font = [UIFont systemFontOfSize:3];
    NSLog(@"%@", font);
    font = [UIFont fontWithName:@"PingFangSC-Thin" size:8];
    NSLog(@"%@", font);
    font = [UIFont fontWithName:@"TTUniqlo-Bold" size:8];
    NSLog(@"%@", font);
    
    
}

+ (void)registerFonts
{
    [@[@"TTUniqlo-Bold", @"TTUniqlo-Light"] enumerateObjectsUsingBlock:^(NSString*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSURL *fontFileUrl = [[NSBundle mainBundle] URLForResource:obj withExtension:@"ttf"];
        [self registerFontWithURL: fontFileUrl];
        UIFont *font = [UIFont fontWithName:obj size:11];
        NSAssert(font, @"UIFont object should not be nil, check if the font file is added to the application bundle and you're using the correct font name.");
    }];
}

+ (void)registerFontWithURL:(NSURL *)url {
    NSAssert([[NSFileManager defaultManager] fileExistsAtPath:[url path]], @"Font file doesn't exist");
    CGDataProviderRef fontDataProvider = CGDataProviderCreateWithURL((__bridge CFURLRef)url);
    CGFontRef newFont = CGFontCreateWithDataProvider(fontDataProvider);
    CGDataProviderRelease(fontDataProvider);
    CTFontManagerRegisterGraphicsFont(newFont, nil);
    CGFontRelease(newFont);
}

@end
