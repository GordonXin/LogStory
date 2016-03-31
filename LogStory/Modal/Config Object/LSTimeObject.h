//
//  LSTimeObject.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSConfigObject.h"


extern NSString * const kLSTimeObject;

extern NSString * const kLSTimeObjectFormatKey;

@interface LSTimeObject : LSConfigObject

@property (nonatomic, readonly, copy)   NSString *format;

@end

