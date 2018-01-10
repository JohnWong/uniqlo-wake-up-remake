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

typedef void(^HookResponse)(id operation, NSDictionary *result);

@implementation NSObject (Hook)

+ (void)load
{
    dispatch_after(0, dispatch_get_main_queue(), ^{
        {
            Class cls = NSClassFromString(@"UWAPIClient");
            class_swizzleSelector(cls, @selector(requestInitWithResponse:), @selector(hook_requestInitWithResponse:));
            class_swizzleSelector(cls, @selector(requestNewsWithResponse:), @selector(hook_requestNewsWithResponse:));
            class_swizzleSelector(cls, @selector(requestLocationWithCountry:state:city:response:), @selector(hook_requestLocationWithCountry:state:city:response:));
            class_swizzleSelector(cls, @selector(requestLocationWithLat:lon:response:), @selector(hook_requestLocationWithLat:lon:response:));
            class_swizzleSelector(cls, @selector(requestWeatherWithAlarmFlag:location:response:), @selector(hook_requestWeatherWithAlarmFlag:location:response:));
            class_swizzleSelector(cls, @selector(requestWeatherWithAlarmFlag:response:), @selector(hook_requestWeatherWithAlarmFlag:response:));
            class_swizzleSelector(cls, @selector(requestSNSPostWithTime:color:weather:temp:lowtemp:message:response:), @selector(hook_requestSNSPostWithTime:color:weather:temp:lowtemp:message:response:));
        }
        {
            Class cls = NSClassFromString(@"UWLocationTopViewController");
            Method m1 = class_getInstanceMethod(cls, @selector(locationDidUpdateWithLocation:));
            Method m2 = class_getInstanceMethod(cls, @selector(hook_locationDidUpdateWithLocation:));
            method_exchangeImplementations(m1, m2);
        }
    });
}

- (void)hook_requestInitWithResponse:(BOOL(^)(id operation, NSDictionary *result))response
{
    [self hook_requestInitWithResponse:response];
}

- (void)hook_requestNewsWithResponse:(BOOL(^)(id operation, NSDictionary *result))response
{
    [self hook_requestNewsWithResponse:response];
}

- (void)hook_requestLocationWithCountry:(id)arg1 state:(id)arg2 city:(id)arg3 response:(id)arg4
{
    [self hook_requestLocationWithCountry:arg1 state:arg2 city:arg3 response:arg4];
}

- (void)hook_requestLocationWithLat:(float)lat lon:(float)lon response:(void(^)(id operation, NSDictionary *result))response
{
    [self hook_requestLocationWithLat:lat lon:lon response:response];
}

 - (void)hook_requestWeatherWithAlarmFlag:(bool)arg1 location:(id)arg2 response:(void(^)(id operation, NSDictionary *result))response
{
    [self hook_requestWeatherWithAlarmFlag:arg1 location:arg2 response:response];
}

- (void)hook_requestWeatherWithAlarmFlag:(bool)arg1 response:(void(^)(id operation, NSDictionary *result))arg2
{
    [self hook_requestWeatherWithAlarmFlag:arg1 response:arg2];
}

- (void)hook_requestSNSPostWithTime:(id)arg1 color:(int)arg2 weather:(int)arg3 temp:(int)arg4 lowtemp:(int)arg5 message:(id)arg6 response:(id)arg7
{
    [self hook_requestSNSPostWithTime:arg1 color:arg2 weather:arg3 temp:arg4 lowtemp:arg5 message:arg6 response:arg7];
}



- (void)hook_locationDidUpdateWithLocation:(id)location
{
    [self hook_locationDidUpdateWithLocation:location];
}

@end
