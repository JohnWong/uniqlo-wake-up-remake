/* Generated by RuntimeBrowser
   Image: /var/containers/Bundle/Application/A77617CC-81F8-4D57-BCE6-77E8D969EEA1/UniqloWakeUp.app/UniqloWakeUp
 */

@interface UWCommonViewController : UIViewController {
    UIActivityIndicatorView * _indicatorView;
}

@property (getter=indicatorView, nonatomic, readwrite, retain) UIActivityIndicatorView *indicatorView;

- (void).cxx_destruct;
- (id)addTableView;
- (id)addTableViewWithHeaderHeight:(double)arg1;
- (void)colorDidUpdate:(id)arg1;
- (struct CGRect { struct CGPoint { double x_1_1_1; double x_1_1_2; } x1; struct CGSize { double x_2_1_1; double x_2_1_2; } x2; })contentFrameWithDecrementHeight:(double)arg1;
- (void)didReceiveMemoryWarning;
- (id)indicatorView;
- (id)makeBarButtonItemWithImageName:(id)arg1 action:(SEL)arg2 left:(bool)arg3;
- (id)makeNavigationController;
- (id)makeSpaceBarItemWithWidth:(double)arg1;
- (void)setIndicatorView:(id)arg1;
- (id)setLeftBarButtonItemWithImageName:(id)arg1 action:(SEL)arg2;
- (id)setLeftBarButtonItemWithImageName:(id)arg1 action:(SEL)arg2 animated:(bool)arg3;
- (id)setNavigationTitle:(id)arg1;
- (id)setNavigationTitleImage:(id)arg1;
- (id)setNavigationTitleImageWithName:(id)arg1;
- (id)setRightBarButtonItemWithImageName:(id)arg1 action:(SEL)arg2;
- (id)setRightBarButtonItemWithImageName:(id)arg1 action:(SEL)arg2 animated:(bool)arg3;
- (void)startIndicator;
- (void)startIndicatorWithStyle:(long long)arg1;
- (void)stopIndicator;
- (void)viewDidLoad;
- (void)viewWillAppear:(bool)arg1;
- (void)viewWillDisappear:(bool)arg1;

@end
