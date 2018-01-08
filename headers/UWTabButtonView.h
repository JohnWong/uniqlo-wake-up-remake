/* Generated by RuntimeBrowser
   Image: /var/containers/Bundle/Application/A77617CC-81F8-4D57-BCE6-77E8D969EEA1/UniqloWakeUp.app/UniqloWakeUp
 */

@interface UWTabButtonView : UIView {
    SEL  _action;
    int  _selectedIndex;
    id  _target;
}

@property (nonatomic, readwrite) SEL action;
@property (nonatomic, readwrite) int selectedIndex;
@property (nonatomic, readwrite) id target;

- (void).cxx_destruct;
- (SEL)action;
- (void)drawRect:(struct CGRect { struct CGPoint { double x_1_1_1; double x_1_1_2; } x1; struct CGSize { double x_2_1_1; double x_2_1_2; } x2; })arg1;
- (id)initWithFrame:(struct CGRect { struct CGPoint { double x_1_1_1; double x_1_1_2; } x1; struct CGSize { double x_2_1_1; double x_2_1_2; } x2; })arg1;
- (int)selectedIndex;
- (void)setAction:(SEL)arg1;
- (void)setSelectedIndex:(int)arg1;
- (void)setTarget:(id)arg1;
- (id)target;
- (void)touchesBegan:(id)arg1 withEvent:(id)arg2;

@end
