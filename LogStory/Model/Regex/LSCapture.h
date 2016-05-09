//
//  LSCaptureResult.h
//  LogStory
//
//  Created by cynthia on 4/25/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSBaseObject.h"

@class LSCaptureConfiguration;

@interface LSCapture : LSBaseObject

/*
 * wrappers for configuration
 */
@property (nonatomic, readonly, copy)    NSString *name;

@property (nonatomic, readonly, copy)    NSString *type;


/*
 * data property
 */
@property (nonatomic, readwrite, weak)   NSString *source;

@property (nonatomic, readwrite, assign) NSRange  range;

-(id)value;

-(NSString *)valueString;

@end