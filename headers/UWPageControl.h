/* Generated by RuntimeBrowser
   Image: /var/containers/Bundle/Application/A77617CC-81F8-4D57-BCE6-77E8D969EEA1/UniqloWakeUp.app/UniqloWakeUp
 */

@interface UWPageControl : UIControl {
    long long  _currentPage;
    long long  _numberOfPages;
}

@property (nonatomic, readwrite) long long currentPage;
@property (nonatomic, readwrite) long long numberOfPages;

- (long long)currentPage;
- (void)drawRect:(struct CGRect { struct CGPoint { double x_1_1_1; double x_1_1_2; } x1; struct CGSize { double x_2_1_1; double x_2_1_2; } x2; })arg1;
- (id)initWithFrame:(struct CGRect { struct CGPoint { double x_1_1_1; double x_1_1_2; } x1; struct CGSize { double x_2_1_1; double x_2_1_2; } x2; })arg1;
- (long long)numberOfPages;
- (void)setCurrentPage:(long long)arg1;
- (void)setNumberOfPages:(long long)arg1;
- (void)tapHandler:(id)arg1 forEvent:(id)arg2;

@end
