//
//  LSBaseObject.h
//  LogStory
//
//  Created by cynthia on 4/29/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSConfiguration.h"
#import "LSError.h"
#import "LSException.h"

@interface LSBaseObject : NSObject

@property (nonatomic, readonly, strong) LSConfiguration *configuration;

-(instancetype)initWithConfiguration:(LSConfiguration *)configuration NS_DESIGNATED_INITIALIZER;

@end
