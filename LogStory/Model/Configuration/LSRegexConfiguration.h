//
//  LSRegexCreator.h
//  LogStory
//
//  Created by cynthia on 4/28/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSConfiguration.h"

extern NSString * const kLSRegexNodeName;
extern NSString * const kLSRegexPatternKey;
extern NSString * const kLSRegexCaseKey;
extern NSString * const kLSRegexLineKey;
extern NSString * const kLSRegexCaptureMatchString;

@interface LSRegexConfiguration : LSConfiguration

@property (nonatomic, readwrite, copy)   NSString *pattern;

@property (nonatomic, readwrite, assign) BOOL isCaseSensitive;

@property (nonatomic, readwrite, assign) BOOL isMatchLineSeparator;

@property (nonatomic, readwrite, copy)   NSArray *captureConfigurations;

-(NSArray *)createCaptureObjects;

@end
