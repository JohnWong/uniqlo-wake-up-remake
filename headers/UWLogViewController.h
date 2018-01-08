/* Generated by RuntimeBrowser
   Image: /var/containers/Bundle/Application/A77617CC-81F8-4D57-BCE6-77E8D969EEA1/UniqloWakeUp.app/UniqloWakeUp
 */

@interface UWLogViewController : UWCommonViewController {
    UWLogAverageBar * _averageBar;
    UWLogAverageLabel * _averageLabel;
    UWLogGraphView * _graphView;
    int  _mode;
    UWLogSleepTimeLabel * _sleepTimeLabel;
    UWImageButton * _weekButton;
    UWImageButton * _yearButton;
}

@property (nonatomic, readwrite, retain) UWLogAverageBar *averageBar;
@property (nonatomic, readwrite, retain) UWLogAverageLabel *averageLabel;
@property (nonatomic, readwrite, retain) UWLogGraphView *graphView;
@property (nonatomic, readwrite) int mode;
@property (nonatomic, readwrite, retain) UWLogSleepTimeLabel *sleepTimeLabel;
@property (nonatomic, readwrite, retain) UWImageButton *weekButton;
@property (nonatomic, readwrite, retain) UWImageButton *yearButton;

- (void).cxx_destruct;
- (id)averageBar;
- (id)averageLabel;
- (void)changeButtonHandler:(id)arg1;
- (id)graphView;
- (int)mode;
- (void)setAverageBar:(id)arg1;
- (void)setAverageLabel:(id)arg1;
- (void)setGraphView:(id)arg1;
- (void)setMode:(int)arg1;
- (void)setSleepTimeLabel:(id)arg1;
- (void)setWeekButton:(id)arg1;
- (void)setYearButton:(id)arg1;
- (id)sleepTimeLabel;
- (void)viewDidLoad;
- (void)viewWillAppear:(bool)arg1;
- (id)weekButton;
- (id)yearButton;

@end
