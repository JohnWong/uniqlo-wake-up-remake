
//
//  NSDictionary+Hook.m
//  PDebug
//
//  Created by John Wong on 08/01/2018.
//  Copyright © 2018 com. All rights reserved.
//

#import "NSDictionary+Hook.h"
#import <objc/runtime.h>

@implementation NSDictionary (Hook)

+ (void)load
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        Class cls = NSClassFromString(@"__NSDictionaryM");
        Method m1 = class_getInstanceMethod(cls, @selector(objectForKey:));
        Method m2 = class_getInstanceMethod(cls, @selector(hook_objectForKey:));
        method_exchangeImplementations(m1, m2);
        
    });
}

- (id)hook_objectForKey:(id)aKey
{
    id result = [self hook_objectForKey:aKey];
    if ([aKey isKindOfClass:[NSString class]]) {
        NSLog(@"KEY: %@", aKey);
    }
    return result;
}

@end
