
//
//  UIViewController+Hook.m
//  PDebug
//
//  Created by John Wong on 10/01/2018.
//  Copyright © 2018 com. All rights reserved.
//

#import "UIViewController+Hook.h"
#import "CTObjectiveCRuntimeAdditions.h"

@implementation UIViewController (Hook)

+ (void)initialize
{
    if (self == NSClassFromString(@"UWClockCommonViewController")) {
        class_swizzleSelector(self, @selector(updateWeather:), @selector(hook_updateWeather:));
    }
}

- (void)hook_updateWeather:(int)arg1
{
    [self hook_updateWeather:arg1];
}

@end
