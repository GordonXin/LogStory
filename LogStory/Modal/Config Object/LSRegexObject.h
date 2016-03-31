//
//  LSRegexObject.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSConfigObject.h"

extern NSString * const kLSRegexObject;

extern NSString * const kLSRegexObjectExpressionKey;

@interface LSRegexObject : LSConfigObject

@property (nonatomic, readonly, strong) NSRegularExpression *regex;

@property (nonatomic, readonly, strong) NSArray *captureArray;

@end
