//
//  LSTypeObject.h
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSTypeObject : NSObject

+(NSArray<NSString *> *)supportedTypes;

+(BOOL)isSupportedType:(NSString *)type;

@end
