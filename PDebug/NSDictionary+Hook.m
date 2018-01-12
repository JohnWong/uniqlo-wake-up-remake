
//
//  NSDictionary+Hook.m
//  PDebug
//
//  Created by John Wong on 08/01/2018.
//  Copyright © 2018 com. All rights reserved.
//

#import "NSDictionary+Hook.h"
#import <objc/runtime.h>
#import "CTObjectiveCRuntimeAdditions.h"

@implementation NSObject (Hook)

+ (void)load
{
    {
        Method originalMethod = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(objectForKey:));
        Method swizzledMethod = class_getInstanceMethod(self, @selector(hook_objectForKey:));
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    {
        Method originalMethod = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryI"), @selector(objectForKey:));
        Method swizzledMethod = class_getInstanceMethod(self, @selector(hook1_objectForKey:));
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    {
        Method originalMethod = class_getInstanceMethod(NSClassFromString(@"__NSSingleEntryDictionaryI"), @selector(objectForKey:));
        Method swizzledMethod = class_getInstanceMethod(self, @selector(hook2_objectForKey:));
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    {
        Method originalMethod = class_getInstanceMethod(NSClassFromString(@"__NSDictionary0"), @selector(objectForKey:));
        Method swizzledMethod = class_getInstanceMethod(self, @selector(hook3_objectForKey:));
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)printKey:(NSString *)aKey
{
    if ([aKey isKindOfClass:[NSString class]] &&
        ![aKey hasPrefix:@"0"] &&
        ![aKey hasPrefix:@"NS"]) {
        if ([aKey isEqualToString:@"weather"]) {
            
        } else if ([aKey hasSuffix:@"framework"]) {
            return;
        }
//        NSLog(@"%@", aKey);
    }
}

- (id)hook_objectForKey:(id)aKey
{
    id result = [self hook_objectForKey:aKey];
    [self printKey:aKey];
    return result;
}

- (id)hook1_objectForKey:(id)aKey
{
    id result = [self hook1_objectForKey:aKey];
    [self printKey:aKey];
    return result;
}

- (id)hook2_objectForKey:(id)aKey
{
    id result = [self hook2_objectForKey:aKey];
    [self printKey:aKey];
    return result;
}

- (id)hook3_objectForKey:(id)aKey
{
    id result = [self hook3_objectForKey:aKey];
    [self printKey:aKey];
    return result;
}

- (NSDictionary *)hook_dictionaryForKey:(NSString *)key
{
    return [self hook_dictionaryForKey:key];
}

- (int)hook_intForKey:(NSString *)key
{
    return [self hook_intForKey:key];
}

- (NSString *)hook_stringForKey:(NSString *)key
{
    return [self hook_stringForKey:key];
}

- (NSUInteger)length
{
    return 1;
}

@end
