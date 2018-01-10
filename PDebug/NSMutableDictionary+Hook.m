//
//  NSMutableDictionary+Hook.m
//  PDebug
//
//  Created by John Wong on 08/01/2018.
//  Copyright © 2018 com. All rights reserved.
//

#import "NSMutableDictionary+Hook.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (Hook)

+ (void)load
{
    Class cls = NSClassFromString(@"__NSDictionaryM");
    Method m1 = class_getInstanceMethod(cls, @selector(objectForKey:));
    Method m2 = class_getInstanceMethod(cls, @selector(hook_objectForKey:));
    method_exchangeImplementations(m1, m2);
}

- (id)hook_objectForKey:(id)aKey
{
    id result = [self hook_objectForKey:aKey];
    return result;
}

@end
