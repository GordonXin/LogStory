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

@interface LSRegexConfiguration : LSConfiguration

/*
 * property
 */
@property (nonatomic, readonly, copy)   NSString *pattern;

@property (nonatomic, readonly, assign) BOOL isCaseSensitive;

@property (nonatomic, readonly, assign) BOOL isMatchLineSeparator;

@property (nonatomic, readonly, copy)   NSArray *captureConfigurations;

/*
 * init method
 */
-(instancetype)initWithProperty:(NSDictionary *)properties;


-(NSArray *)createCaptureObjects;

@end
