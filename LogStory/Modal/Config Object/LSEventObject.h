//
//  LSLineObject.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSConfigObject.h"

@class LSCaptureObject;
@class LSRegexObject;
@class LSTimeObject;

extern NSString * const kLSEventObject;

@interface LSEventObject : LSConfigObject

@property (nonatomic, readonly, strong) LSCaptureObject *timeCapture;
@property (nonatomic, readonly, strong) LSCaptureObject *contentCapture;
@property (nonatomic, readonly, strong) NSArray         *captureArray;
@property (nonatomic, readonly, strong) LSRegexObject   *regexObj;
@property (nonatomic, readonly, strong) LSTimeObject    *timeObj;

@end
