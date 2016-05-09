//
//  LSBaseObject.m
//  LogStory
//
//  Created by cynthia on 4/29/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSBaseObject.h"

@implementation LSBaseObject

-(instancetype)init
{
    return [self initWithConfiguration:nil];
}

-(instancetype)initWithConfiguration:(LSConfiguration *)configuration
{
    if (!configuration)
    {
        RAISE_EXCEPTION(@"invalid configuration");
        return nil;
    }
    if (self = [super init])
    {
        _configuration = configuration;
    }
    return self;
}

@end
