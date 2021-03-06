//
//  LSFormatterConfigruation.h
//  LogStory
//
//  Created by cynthia on 4/29/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSConfiguration.h"

extern NSString * const kLSFormatterNodeName;
extern NSString * const kLSFormatterTimeKey;

extern NSString * const kLSFormatterTimeCapture;
extern NSString * const kLSFormatterLogLevelCapture;
extern NSString * const kLSFormatterEventCapture;

@class LSRegexConfiguration;

@interface LSFormatterConfigruation : LSConfiguration

@property (nonatomic, readonly, strong) LSRegexConfiguration *regex;

@property (nonatomic, readonly, copy) NSString * timeFormat;

@end
