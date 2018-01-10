//
//  NSObject+Hook.h
//  PDebug
//
//  Created by John Wong on 08/01/2018.
//  Copyright © 2018 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Hook)

- (void)requestInitWithResponse:(id)arg1;
- (void)requestLocationWithCountry:(id)arg1 state:(id)arg2 city:(id)arg3 response:(id)arg4;
- (void)requestLocationWithLat:(float)arg1 lon:(float)arg2 response:(id)arg3;
- (void)requestNewsWithResponse:(id)arg1;
- (void)requestSNSPostWithTime:(id)arg1 color:(int)arg2 weather:(int)arg3 temp:(int)arg4 lowtemp:(int)arg5 message:(id)arg6 response:(id)arg7;
- (void)requestWeatherWithAlarmFlag:(bool)arg1 location:(id)arg2 response:(id)arg3;
- (void)requestWeatherWithAlarmFlag:(bool)arg1 response:(id)arg2;

@end
