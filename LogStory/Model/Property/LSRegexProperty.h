//
//  LSRegexProperty.h
//  LogStory
//
//  Created by cynthia on 4/25/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSProperty.h"

@interface LSRegexProperty : LSProperty

@property (nonatomic, readwrite, copy) NSString *regexString;

@property (nonatomic, readwrite, copy) NSArray  *captureArray;

@property (nonatomic, readwrite, assign) BOOL   isCaseSensitive;

@end
