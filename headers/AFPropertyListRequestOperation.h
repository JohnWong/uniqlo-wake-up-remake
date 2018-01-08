/* Generated by RuntimeBrowser
   Image: /var/containers/Bundle/Application/A77617CC-81F8-4D57-BCE6-77E8D969EEA1/UniqloWakeUp.app/UniqloWakeUp
 */

@interface AFPropertyListRequestOperation : AFHTTPRequestOperation {
    NSError * _propertyListError;
    unsigned long long  _propertyListFormat;
    unsigned long long  _propertyListReadOptions;
    id  _responsePropertyList;
}

@property (nonatomic, readwrite, retain) NSError *propertyListError;
@property (nonatomic, readwrite) unsigned long long propertyListFormat;
@property (nonatomic, readwrite) unsigned long long propertyListReadOptions;
@property (nonatomic, readwrite, retain) id responsePropertyList;

+ (id)acceptableContentTypes;
+ (bool)canProcessRequest:(id)arg1;
+ (id)propertyListRequestOperationWithRequest:(id)arg1 success:(id)arg2 failure:(id)arg3;

- (void).cxx_destruct;
- (id)error;
- (id)initWithRequest:(id)arg1;
- (id)propertyListError;
- (unsigned long long)propertyListFormat;
- (unsigned long long)propertyListReadOptions;
- (id)responsePropertyList;
- (void)setCompletionBlockWithSuccess:(id)arg1 failure:(id)arg2;
- (void)setPropertyListError:(id)arg1;
- (void)setPropertyListFormat:(unsigned long long)arg1;
- (void)setPropertyListReadOptions:(unsigned long long)arg1;
- (void)setResponsePropertyList:(id)arg1;

@end
