
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
    if (self == NSClassFromString(@"UWLocationTopViewController")) {
        class_swizzleSelector(self, @selector(startUpdatingLocation), @selector(hook_startUpdatingLocation));
    }
}

- (void)hook_startUpdatingLocation
{
    [self hook_startUpdatingLocation];
}

@end
