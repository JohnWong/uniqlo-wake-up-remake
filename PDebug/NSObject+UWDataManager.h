//
//  NSObject+UWDataManager.h
//  PDebug
//
//  Created by John Wong on 10/01/2018.
//  Copyright © 2018 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (UWDataManager)

- (int)SNSType;
- (id)SNSTypeName;
- (id)SNSTypeNameWithType:(int)arg1;
- (void)addSleepMinutes:(long long)arg1 year:(long long)arg2 month:(long long)arg3 day:(long long)arg4;
- (id)alarmList;
- (struct CGPoint { double x1; double x2; })coordinateWithCountry:(id)arg1 state:(id)arg2 city:(id)arg3;
- (bool)didShowSleepingTimeShort;
- (id)flagObjectForKey:(id)arg1;
- (id)identifier;
- (id)init;
- (id)loadSleepLogsWithYear:(long long)arg1;
- (id)localeID;
- (id)location;
- (id)locationTitlesWithCountry:(id)arg1 state:(id)arg2;
- (bool)needsRequestNews;
- (id)news;
- (int)newsID;
- (id)newsURL;
- (id)reservedAlarm;
- (void)saveSleepLogs:(id)arg1 year:(long long)arg2;
- (void)setAlarmList:(id)arg1;
- (void)setDidShowSleepingTimeShort:(bool)arg1;
- (void)setFlagObject:(id)arg1 forKey:(id)arg2;
- (void)setIdentifier:(id)arg1;
- (void)setLocation:(id)arg1;
- (void)setNews:(id)arg1;
- (void)setReservedAlarm:(id)arg1;
- (void)setSNSType:(int)arg1;
- (void)setShowsHowToUse:(bool)arg1;
- (void)setShowsWelcome:(bool)arg1;
- (void)setSleepStartDay:(id)arg1;
- (void)setSleepStartSunday:(id)arg1;
- (void)setTemperature:(id)arg1;
- (void)setTemperatureUnit:(int)arg1;
- (void)setUseAlwaysShareWakeup:(bool)arg1;
- (void)setVocalType:(int)arg1;
- (void)setWeather:(int)arg1;
- (bool)showsHowToUse;
- (bool)showsWelcome;
- (float)sleepAverageHours;
- (long long)sleepAverageMinutes;
- (int)sleepLogPageCountWithMode:(int)arg1;
- (id)sleepLogsWithMode:(int)arg1 page:(long long)arg2;
- (long long)sleepMinutesWithYear:(long long)arg1 month:(long long)arg2 day:(long long)arg3;
- (id)sleepStartDay;
- (id)sleepStartSunday;
- (void)synchronize;
- (id)temperature;
- (int)temperatureHigh;
- (int)temperatureLow;
- (int)temperatureUnit;
- (id)temperatureUnitName;
- (void)updateSleepStartDayWithLogs:(id)arg1;
- (bool)useAlwaysShareWakeup;
- (int)vocalType;
- (int)weather;

@end
