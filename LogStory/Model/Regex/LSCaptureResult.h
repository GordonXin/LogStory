//
//  LSCaptureResult.h
//  LogStory
//
//  Created by cynthia on 4/25/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kLSCaptureWholeEvent;

@class LSCaptureProperty;

@interface LSCaptureResult : NSObject

@property (nonatomic, readonly, copy)   NSString *name;

@property (nonatomic, readonly, copy)   NSString *type;

@property (nonatomic, readonly, weak)   NSString *source;

@property (nonatomic, readonly, assign) NSRange  range;

-(instancetype)initWithProperty:(LSCaptureProperty*)property source:(NSString *)source range:(NSRange)range;

@end
