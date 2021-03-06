/* Generated by RuntimeBrowser
   Image: /var/containers/Bundle/Application/A77617CC-81F8-4D57-BCE6-77E8D969EEA1/UniqloWakeUp.app/UniqloWakeUp
 */

@interface AFImageRequestOperation : AFHTTPRequestOperation {
    bool  _automaticallyInflatesResponseImage;
    double  _imageScale;
    UIImage * _responseImage;
}

@property (nonatomic, readwrite) bool automaticallyInflatesResponseImage;
@property (nonatomic, readwrite) double imageScale;
@property (nonatomic, readwrite, retain) UIImage *responseImage;

+ (id)acceptableContentTypes;
+ (bool)canProcessRequest:(id)arg1;
+ (id)imageRequestOperationWithRequest:(id)arg1 imageProcessingBlock:(id)arg2 success:(id)arg3 failure:(id)arg4;
+ (id)imageRequestOperationWithRequest:(id)arg1 success:(id)arg2;

- (void).cxx_destruct;
- (bool)automaticallyInflatesResponseImage;
- (double)imageScale;
- (id)initWithRequest:(id)arg1;
- (id)responseImage;
- (void)setAutomaticallyInflatesResponseImage:(bool)arg1;
- (void)setCompletionBlockWithSuccess:(id)arg1 failure:(id)arg2;
- (void)setImageScale:(double)arg1;
- (void)setResponseImage:(id)arg1;

@end
