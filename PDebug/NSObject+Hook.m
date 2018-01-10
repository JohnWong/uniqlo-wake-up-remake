//
//  NSObject+Hook.m
//  PDebug
//
//  Created by John Wong on 08/01/2018.
//  Copyright © 2018 com. All rights reserved.
//

#import "NSObject+Hook.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "CTBlockDescription.h"
#import "CTObjectiveCRuntimeAdditions.h"

@implementation NSObject (Hook)

+ (void)load
{
    dispatch_after(0, dispatch_get_main_queue(), ^{
        {
            Class cls = NSClassFromString(@"UWAPIClient");
            class_swizzleSelector(cls, @selector(requestInitWithResponse:), @selector(hook_requestInitWithResponse:));
            class_swizzleSelector(cls, @selector(requestLocationWithLat:lon:response:), @selector(hook_requestLocationWithLat:lon:response:));
            class_swizzleSelector(cls, @selector(requestWeatherWithAlarmFlag:location:response:), @selector(hook_requestWeatherWithAlarmFlag:location:response:));
        }
        {
            Class cls = NSClassFromString(@"UWLocationTopViewController");
            Method m1 = class_getInstanceMethod(cls, @selector(locationDidUpdateWithLocation:));
            Method m2 = class_getInstanceMethod(cls, @selector(hook_locationDidUpdateWithLocation:));
            method_exchangeImplementations(m1, m2);
        }
        {
            Class cls = NSClassFromString(@"UWDataManager");
            Method m1 = class_getClassMethod(cls, @selector(locationDisplayNameFromLocation:));
            Method m2 = class_getClassMethod(cls, @selector(hook_locationDisplayNameFromLocation::));
            method_exchangeImplementations(m1, m2);
        }
    });
}

- (void)hook_requestInitWithResponse:(id)response
{
    CTBlockDescription *blockDescription = [[CTBlockDescription alloc] initWithBlock:response];
    
    // getting a method signature for this block
    NSMethodSignature *methodSignature = blockDescription.blockSignature;
    NSLog(@"%@", methodSignature);
    return [self hook_requestInitWithResponse:response];
}

- (void)hook_requestLocationWithLat:(float)lat lon:(float)lon response:(id)response
{
    [self hook_requestLocationWithLat:lat lon:lon response:response];
}

 - (void)hook_requestWeatherWithAlarmFlag:(bool)arg1 location:(id)arg2 response:(id)arg3
{
    [self hook_requestWeatherWithAlarmFlag:arg1 location:arg2 response:arg3];
}

- (void)hook_locationDidUpdateWithLocation:(id)location
{
    [self hook_locationDidUpdateWithLocation:location];
}

+ (NSString *)hook_locationDisplayNameFromLocation:(NSDictionary *)location
{
    NSString *result = [self hook_locationDisplayNameFromLocation:location];
    return result;
}
@end
