//
//  NSObject+Hook.m
//  PDebug
//
//  Created by John Wong on 12/01/2018.
//  Copyright © 2018 com. All rights reserved.
//

#import "NSObject+Hook.h"
#import "CTObjectiveCRuntimeAdditions.h"

@implementation NSObject (Hook)

+ (void)load
{
    dispatch_async(dispatch_get_main_queue(), ^{
        Class cls = NSClassFromString(@"UWGPSManager");
        class_swizzleSelector(cls, @selector(startUpdatingLocation), @selector(hook_startUpdatingLocation));
        class_swizzleSelector(cls, @selector(locationManager:didUpdateLocations:), @selector(hook_locationManager:didUpdateLocations:));
    });
}

- (void)hook_startUpdatingLocation
{
    [self setValue:nil forKey:@"locationManager"];
    [self hook_startUpdatingLocation];
    objc_setAssociatedObject(self, @selector(hook_startUpdatingLocation), @(YES), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hook_locationManager:(id)arg1 didUpdateLocations:(id)arg2
{
    if (objc_getAssociatedObject(self, @selector(hook_startUpdatingLocation))) {
        [self hook_locationManager:arg1 didUpdateLocations:arg2];
        objc_setAssociatedObject(self, @selector(hook_startUpdatingLocation), nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

@end
