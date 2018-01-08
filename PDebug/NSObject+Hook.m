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

@implementation NSObject (Hook)

+ (void)load
{
    dispatch_after(0, dispatch_get_main_queue(), ^{
        {
            Class cls = NSClassFromString(@"UWAPIClient");
            Method m1 = class_getInstanceMethod(cls, @selector(requestLocationWithLat:lon:response:));
            Method m2 = class_getInstanceMethod(cls, @selector(hook_requestLocationWithLat:lon:response:));
            method_exchangeImplementations(m1, m2);
        }
        {
            Class cls = NSClassFromString(@"UWSettingsViewController");
            Method m1 = class_getInstanceMethod(cls, @selector(startUpdatingLocation));
            Method m2 = class_getInstanceMethod(cls, @selector(hook_startUpdatingLocation));
            method_exchangeImplementations(m1, m2);
        }
    });
}

- (void)hook_requestLocationWithLat:(float)lat lon:(float)lon response:(id)response
{
    [self hook_requestLocationWithLat:lat lon:lon response:response];
}

- (void)hook_startUpdatingLocation
{
    [self hook_startUpdatingLocation];
}

@end
