//
//  NSObject+AFHTTPClient.h
//  PDebug
//
//  Created by John Wong on 10/01/2018.
//  Copyright © 2018 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AFHTTPClient)

- (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(id operation, id responseObject))success
        failure:(void (^)(id operation, NSError *error))failure;

@end
