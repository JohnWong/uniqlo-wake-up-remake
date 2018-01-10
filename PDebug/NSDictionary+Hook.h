//
//  NSDictionary+Hook.h
//  PDebug
//
//  Created by John Wong on 08/01/2018.
//  Copyright © 2018 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Hook)

- (NSDictionary *)dictionaryForKey:(NSString *)key;
- (int)intForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key;
@end
