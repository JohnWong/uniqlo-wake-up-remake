/* Generated by RuntimeBrowser
   Image: /var/containers/Bundle/Application/A77617CC-81F8-4D57-BCE6-77E8D969EEA1/UniqloWakeUp.app/UniqloWakeUp
 */

@interface UWShareViewController : UWCommonViewController <UIWebViewDelegate> {
    NSURL * _URL;
    UIWebView * _webView;
}

@property (nonatomic, readwrite, retain) NSURL *URL;
@property (atomic, readonly, copy) NSString *debugDescription;
@property (atomic, readonly, copy) NSString *description;
@property (atomic, readonly) unsigned long long hash;
@property (atomic, readonly) Class superclass;
@property (nonatomic, readwrite, retain) UIWebView *webView;

- (void).cxx_destruct;
- (id)URL;
- (void)backButtonHandller:(id)arg1;
- (void)closeButtonHandller:(id)arg1;
- (void)setURL:(id)arg1;
- (void)setWebView:(id)arg1;
- (void)viewDidLoad;
- (void)viewWillAppear:(bool)arg1;
- (id)webView;
- (void)webViewDidFinishLoad:(id)arg1;
- (void)webViewDidStartLoad:(id)arg1;

@end
