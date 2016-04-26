//
//  LSCaptureResult.m
//  LogStory
//
//  Created by cynthia on 4/25/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSCaptureResult.h"
#import "LSCaptureProperty.h"

NSString * const kLSCaptureWholeEvent = @"LogStory.WholeEvent";

@implementation LSCaptureResult

-(instancetype)initWithProperty:(LSCaptureProperty *)property source:(NSString *)source range:(NSRange)range
{
    if (self = [super init])
    {
        _name = property.name;
        _type = property.type;
        
        _source = source;
        _range = range;
    }
    return self;
}

@end
