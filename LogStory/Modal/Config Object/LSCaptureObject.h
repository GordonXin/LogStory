//
//  LSCaptureObject.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSConfigObject.h"

NS_ASSUME_NONNULL_BEGIN

@class LSConfigObject;

extern  NSString * const kLSCaptureObject;
extern  NSString * const kLSCaptureObjectList;

@interface LSCaptureObject : LSConfigObject

@property (nonatomic, readonly, copy) NSString     *name;
@property (nonatomic, readonly, copy) NSString     *type;

@end

@interface LSCaptureObjectList : LSConfigObjectList

@property (nonatomic, readonly, copy) NSArray      *captureObjects;

@end

@interface LSCaptureType : NSObject

+(NSArray *)leagalCaptureType;

+(BOOL)isleagalCaptureType:(NSString *)type;

@end


NS_ASSUME_NONNULL_END