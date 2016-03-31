//
//  LSCaptureObject.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSConfigObject.h"

extern  NSString * const kLSCaptureObject;

extern  NSString * const kLSCaptureObjectNameKey;
extern  NSString * const kLSCaptureObjectTypeKey;

@interface LSCaptureObject : LSConfigObject

+(LSCaptureObject *)captureObjecWithName:(NSString *)name inArray:(NSArray<LSCaptureObject *>*)array;

@property (nonatomic, readonly, copy)   NSString *name;

@property (nonatomic, readonly, copy)   NSString *type;

@end
