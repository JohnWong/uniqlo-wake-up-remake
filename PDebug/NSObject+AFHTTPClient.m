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
    NSLog(@"%@\n%@", path, parameters);
    if ([path isEqualToString:@"init"]) {
        success(nil, @{
                       @"result": @"success",
                       @"id": @"111222333"
                       });
    } else if ([path isEqualToString:@"location"]) {
        id lat = parameters[@"lat"];
        id lon = parameters[@"lon"];
        NSString *reverseUrl = [NSString stringWithFormat:@"http://api.map.baidu.com/geocoder/v2/?location=%@,%@&output=json&coordtype=wgs84ll&ak=YSxZG9cuy4SgHbGSkFyIvHrS", lat, lon];
        [self hook_getPath:reverseUrl parameters:nil success:^(id op, NSDictionary *result) {
            NSDictionary *address = result[@"result"][@"addressComponent"];
            success(nil, @{
                           @"result": @"success",
                           @"country": address[@"country"] ? : @"",
                           @"city": address[@"city"] ? : @"",
                           @"state": address[@"province"] ? : @"",
                           @"lat": lat,
                           @"lon": lon
                           });
        } failure:failure];
    } else if ([path isEqualToString:@"weather"]) {
        NSString *weatherUrl = [NSString stringWithFormat:@"https://api.seniverse.com/v3/weather/daily.json?key=xn3lhqggtje7uqmp&location=%@:%@&language=zh-Hans&unit=c&start=0&days=1", parameters[@"lat"], parameters[@"lon"]];
        [self hook_getPath:weatherUrl parameters:nil success:^(id operation, NSDictionary *result) {
            NSArray *list = [result[@"results"] firstObject][@"daily"];
            NSDictionary *weather = list.firstObject;
            int high = weather[@"high"] ? [weather[@"high"] intValue] : 0;
            int low = weather[@"low"] ? [weather[@"low"] intValue] : 0;
            int weatherCode = [self.class getCodeFromWeather:[weather[@"code_day"] intValue]];
            success(nil, @{
                           @"result": @"success",
                           @"temperature": @{
                                   @"low": @{
                                           @"c": @(low),
                                           @"f": @(round(low * 1.8 + 32)),
                                           },
                                   @"high": @{
                                           @"c": @(high),
                                           @"f": @(round(high * 1.8 + 32)),
                                           }
                                   },
                           @"conditions": @(weatherCode)
                           });
        } failure:failure];
        
    } else if ([path isEqualToString:@"getnews"]) {
        success(nil, @{
                       @"result": @"success",
                       @"lang": @"cn",
                       @"data": @{
                               @"id": @666,
                               @"url": @"https://impress.sinaapp.com/README.md"
                               }
                       });
    } else {
        [self hook_getPath:path parameters:parameters success:success failure:failure];
    }
}

+ (int)getCodeFromWeather:(int)weather
{
    // 0: sunny
    // 1: partly cloudy
    // 2: cloudy
    // 3: rainy
    // 4: stormy
    // 5: snowy
    // 6: foggy
    // 7: unknown
    switch (weather) {
        case 0:
        case 1:
        case 2:
        case 3:
            return 0;
        case 4:
            return 2;
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
            return 1;
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
            return 3;
        case 16:
        case 17:
        case 18:
            return 4;
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
            return 5;
        case 30:
            return 6;
        default:
            return 7;
    }
}

@end
