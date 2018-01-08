/* Generated by RuntimeBrowser
   Image: /var/containers/Bundle/Application/A77617CC-81F8-4D57-BCE6-77E8D969EEA1/UniqloWakeUp.app/UniqloWakeUp
 */

@interface UWClockCommonViewController : UWCommonViewController {
    UILabel * _locationLabel;
    UWTemperatureLabel * _temperatureLabel;
    UWTimeLabel * _timeLabel;
    UWWeatherView * _weatherView;
}

@property (nonatomic, readwrite, retain) UILabel *locationLabel;
@property (nonatomic, readwrite, retain) UWTemperatureLabel *temperatureLabel;
@property (nonatomic, readwrite, retain) UWTimeLabel *timeLabel;
@property (nonatomic, readwrite, retain) UWWeatherView *weatherView;

+ (void)setSharedRequestWeatherDate:(id)arg1;
+ (id)sharedRequestWeatherDate;

- (void).cxx_destruct;
- (void)colorDidUpdate:(id)arg1;
- (void)locationDidUpdate:(id)arg1;
- (id)locationLabel;
- (void)requestWeatherAPI;
- (void)setLocationLabel:(id)arg1;
- (void)setTemperatureLabel:(id)arg1;
- (void)setTimeLabel:(id)arg1;
- (void)setWeatherView:(id)arg1;
- (void)temperatureDidUpdate:(id)arg1;
- (id)temperatureLabel;
- (void)timeDidUpdate:(id)arg1;
- (id)timeLabel;
- (void)updateWeather:(int)arg1;
- (void)viewDidLoad;
- (void)viewWillAppear:(bool)arg1;
- (void)weatherDidUpdate:(id)arg1;
- (id)weatherView;

@end
