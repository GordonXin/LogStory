//
//  LSCaptureResult.m
//  LogStory
//
//  Created by cynthia on 4/25/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSCapture.h"
#import "LSCaptureConfiguration.h"

@implementation LSCapture

@synthesize source = _source;
@synthesize range = _range;

-(instancetype)initWithConfiguration:(LSConfiguration *)config
{
    if (self = [super initWithConfiguration:config])
    {
        if (![config isKindOfClass:[LSCaptureConfiguration class]])
        {
            RAISE_EXCEPTION(@"Wrong configuration objec class:%@", NSStringFromClass([config class]))
        }
        
        _name = [[self myConfig] name];
        _type = [[self myConfig] type];
        
        _source = nil;
        _range = NSMakeRange(NSNotFound, 0);
    }
    return self;
}

-(LSCaptureConfiguration *)myConfig
{
    return (LSCaptureConfiguration *)self.configuration;
}

-(NSString *)valueString
{
    NSString *str = @"";
    
    if ([_source length] && _range.location != NSNotFound && _range.length > 0)
    {
        str = [_source substringWithRange:_range];
    }
    
    return str;
}

-(id)value
{
    NSString *valueString = [self valueString];
    
    if ([valueString length])
    {
        if ([self.type isEqualToString:@"String"])
        {
            return valueString;
        }
        else if ([self.type isEqualToString:@"Integer"])
        {
            return [NSNumber numberWithInteger:[valueString integerValue]];
        }
        else if ([self.type isEqualToString:@"Float"])
        {
            return [NSNumber numberWithDouble:[valueString doubleValue]];
        }
    }
    
    return nil;
}

@end

