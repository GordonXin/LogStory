//
//  LSCaptureObject.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSConfigObject.h"

extern  NSString * const kLSCaptureObject;
extern  NSString * const kLSCaptureObjectList;

@interface LSCaptureObject : LSConfigObject

@property (nonatomic, readwrite, copy) NSString     *name;
@property (nonatomic, readwrite, copy) NSString     *type;

@end

@interface LSCaptureObjectList : LSConfigObject

@property (nonatomic, readonly, assign) NSInteger    count;

-(LSCaptureObject *)captureObjectAtIndex:(NSInteger)index;

-(void)addCaptureObject:(LSCaptureObject *)captureObj;

-(void)removeCaptureObject:(LSCaptureObject *)captureObj;

@end

@interface LSCaptureType : NSObject

+(NSArray *)leagalCaptureType;

+(BOOL)isleagalCaptureType:(NSString *)type;

@end