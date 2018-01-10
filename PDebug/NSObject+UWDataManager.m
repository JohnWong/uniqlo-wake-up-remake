//
//  NSObject+UWDataManager.m
//  PDebug
//
//  Created by John Wong on 10/01/2018.
//  Copyright © 2018 com. All rights reserved.
//

#import "NSObject+UWDataManager.h"
#import <objc/runtime.h>
#import "CTObjectiveCRuntimeAdditions.h"

@implementation NSObject (UWDataManager)

+ (void)load
{
    dispatch_after(0, dispatch_get_main_queue(), ^{
        
        Class cls = NSClassFromString(@"UWDataManager");
        {
            Method m1 = class_getClassMethod(cls, @selector(locationDisplayNameFromLocation:));
            Method m2 = class_getClassMethod(cls, @selector(hook_locationDisplayNameFromLocation::));
            method_exchangeImplementations(m1, m2);
        }
        {
            Method m1 = class_getInstanceMethod(cls, @selector(setWeather:));
            Method m2 = class_getInstanceMethod(self, @selector(hook_setWeather:));
            method_exchangeImplementations(m1, m2);
        }
        {
            Method m1 = class_getInstanceMethod(cls, @selector(setTemperature:));
            Method m2 = class_getInstanceMethod(self, @selector(hook_setTemperature:));
            method_exchangeImplementations(m1, m2);
        }
    });
}

+ (NSString *)hook_locationDisplayNameFromLocation:(NSDictionary *)location
{
    NSString *result = [self hook_locationDisplayNameFromLocation:location];
    return result;
}

- (void)hook_setWeather:(int)arg1
{
    [self hook_setWeather:arg1];
}

- (void)hook_setTemperature:(id)arg1
{
    [self hook_setTemperature:arg1];
}

@end
