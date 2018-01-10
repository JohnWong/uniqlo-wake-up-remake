//
//  NSObject+AFHTTPClient.m
//  PDebug
//
//  Created by John Wong on 10/01/2018.
//  Copyright © 2018 com. All rights reserved.
//

#import "NSObject+AFHTTPClient.h"
#import <objc/runtime.h>

@implementation NSObject (AFHTTPClient)

+ (void)load
{
    dispatch_async(dispatch_get_main_queue(), ^{
        Method m1 = class_getInstanceMethod(NSClassFromString(@"AFHTTPClient"), @selector(getPath:parameters:success:failure:));
        Method m2 = class_getInstanceMethod(self, @selector(hook_getPath:parameters:success:failure:));
        method_exchangeImplementations(m1, m2);
    });
}

- (void)hook_getPath:(NSString *)path parameters:(NSDictionary *)parameters success:(void (^)(id, id))success failure:(void (^)(id, NSError *))failure
{
    if ([path isEqualToString:@"init"]) {
        success(nil, @{
                       @"result": @"success",
                       @"id": @"111222333"
                       });
    } else if ([path isEqualToString:@"location"]) {
        success(nil, @{
                       @"result": @"success",
                       @"country": @"CHINA",
                       @"city": @"HANGZHOU",
                       @"state": @"ZHEJIANG",
                       @"lat": @30.22999954,
                       @"lon": @120.1699982
                       });
    } else if ([path isEqualToString:@"weather"]) {
        success(nil, @{
                       @"result": @"success",
                       @"temperature": @{
                               @"low": @{
                                       @"c": @(-3),
                                       @"f": @26
                                       },
                               @"high": @{
                                       @"c": @12,
                                       @"f": @37
                                       }
                               },
                       @"conditions": @(3),
                       @"weather": @(2) // 大雨
                       });
    } else if ([path isEqualToString:@"getnews"]) {
        success(nil, @{
                       @"result": @"success",
                       
                       });
    } else {
        [self hook_getPath:path parameters:parameters success:success failure:failure];
    }
}

@end
