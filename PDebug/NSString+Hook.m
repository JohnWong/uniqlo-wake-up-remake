//
//  NSString+Hook.m
//  PDebug
//
//  Created by John Wong on 12/01/2018.
//  Copyright © 2018 com. All rights reserved.
//

#import "NSString+Hook.h"

@interface NSArray (Hook)

- (float)floatAt:(NSUInteger)index;

@end

@implementation NSString (Hook)

- (float)floatAt:(NSUInteger)index
{
    NSArray *array = [self componentsSeparatedByString:@","];
    return [array floatAt:index];
}

@end
