//
//  LSFilterObject.h
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSConfigObject.h"

extern NSString * const kLSFilterObject;

@class LSRegexObject;
@class LSActionObject;

@interface LSFilterObject : LSConfigObject

@property (nonatomic, readonly, strong)     LSRegexObject               *regex;

@property (nonatomic, readonly, strong)     NSArray<LSActionObject *>   *actionArray;

@end
