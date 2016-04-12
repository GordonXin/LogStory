//
//  LSRegex.h
//  LogStory
//
//  Created by cynthia on 4/8/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSXMLObject.h"

extern NSString * const kLSRegex;

@interface LSRegex : LSXMLObject

@property (nonatomic, readonly, copy)   NSString                    *sExpression;

@property (nonatomic, readonly, assign) NSRegularExpressionOptions  nOption;

@property (nonatomic, readonly, strong) NSRegularExpression         *regex;

@end
