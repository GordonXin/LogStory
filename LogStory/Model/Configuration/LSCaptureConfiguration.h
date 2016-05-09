//
//  LSCaptureCreator.h
//  LogStory
//
//  Created by cynthia on 4/28/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSConfiguration.h"

extern NSString * const kLSCaptureNodeName;

extern NSString * const kLSCaptureNameKey;
extern NSString * const kLSCaptureTypeKey;

@interface LSCaptureConfiguration : LSConfiguration

/*
 * property
 */
@property (nonatomic, readwrite, copy) NSString *name;

@property (nonatomic, readwrite, copy) NSString *type;


/*
 * init method
 */
-(instancetype)initWithProperty:(NSDictionary *)properties;

@end
