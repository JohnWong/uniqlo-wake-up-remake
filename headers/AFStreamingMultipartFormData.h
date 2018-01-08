/* Generated by RuntimeBrowser
   Image: /var/containers/Bundle/Application/A77617CC-81F8-4D57-BCE6-77E8D969EEA1/UniqloWakeUp.app/UniqloWakeUp
 */

@interface AFStreamingMultipartFormData : NSObject <AFMultipartFormData> {
    AFMultipartBodyStream * _bodyStream;
    NSString * _boundary;
    NSMutableURLRequest * _request;
    unsigned long long  _stringEncoding;
}

@property (nonatomic, readwrite, retain) AFMultipartBodyStream *bodyStream;
@property (nonatomic, readwrite, copy) NSString *boundary;
@property (nonatomic, readwrite, copy) NSMutableURLRequest *request;
@property (nonatomic, readwrite) unsigned long long stringEncoding;

- (void).cxx_destruct;
- (void)appendPartWithFileData:(id)arg1 name:(id)arg2 fileName:(id)arg3 mimeType:(id)arg4;
- (bool)appendPartWithFileURL:(id)arg1 name:(id)arg2 error:(id*)arg3;
- (bool)appendPartWithFileURL:(id)arg1 name:(id)arg2 fileName:(id)arg3 mimeType:(id)arg4 error:(id*)arg5;
- (void)appendPartWithFormData:(id)arg1 name:(id)arg2;
- (void)appendPartWithHeaders:(id)arg1 body:(id)arg2;
- (void)appendPartWithInputStream:(id)arg1 name:(id)arg2 fileName:(id)arg3 length:(unsigned long long)arg4 mimeType:(id)arg5;
- (id)bodyStream;
- (id)boundary;
- (id)initWithURLRequest:(id)arg1 stringEncoding:(unsigned long long)arg2;
- (id)request;
- (id)requestByFinalizingMultipartFormData;
- (void)setBodyStream:(id)arg1;
- (void)setBoundary:(id)arg1;
- (void)setRequest:(id)arg1;
- (void)setStringEncoding:(unsigned long long)arg1;
- (unsigned long long)stringEncoding;
- (void)throttleBandwidthWithPacketSize:(unsigned long long)arg1 delay:(double)arg2;

@end
