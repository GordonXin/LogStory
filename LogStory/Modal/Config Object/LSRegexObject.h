//
//  LSRegexObject.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSConfigObject.h"

@class LSCaptureObjectList;

@interface LSRegexObject : LSConfigObject

@property (nonatomic, readonly, copy) NSString *expression;

@property (nonatomic, readonly, copy) NSArray  *options;

@property (nonatomic, readonly, strong) LSCaptureObjectList *captureList;

@end
