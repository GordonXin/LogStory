//
//  LSFormatterConfigruation.m
//  LogStory
//
//  Created by cynthia on 4/29/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSFormatterConfigruation.h"
#import "LSRegexConfiguration.h"
#import "LSCaptureConfiguration.h"
#import "LSFormatter.h"

NSString * const kLSFormatterNodeName = @"LSFormatter";
NSString * const kLSFormatterTimeKey = @"LSTimeFormat";

NSString * const kLSFormatterTimeCapture = @"Time";
NSString * const kLSFormatterLogLevelCapture = @"LogLevel";
NSString * const kLSFormatterEventCapture = @"Event";

@implementation LSFormatterConfigruation

-(instancetype)initWithConfig:(NSXMLElement *)xmlConfig error:(LSError *__autoreleasing *)outError
{
    if (self = [super initWithConfig:xmlConfig error:outError])
    {
        _regex = [[LSRegexConfiguration alloc] initWithConfig:[self firstConfigNodeWithName:kLSRegexNodeName] error:outError];
        _timeFormat = [self firstConfigNodeStringValueWithName:kLSFormatterTimeKey];
        
        if (![self checkWithError:outError])
        {
            return nil;
        }
    }
    return self;
}

-(instancetype)initWithProperty:(NSDictionary *)properties
{
    NSXMLElement *element = [NSXMLElement elementWithName:kLSFormatterNodeName];
    
    LSRegexConfiguration *regex = [properties objectForKey:kLSRegexNodeName];
    [element addChild:[regex xmlConfig]];
    
    NSString *timeFormat = [properties objectForKey:kLSFormatterTimeKey];
    [element addChild:[NSXMLElement elementWithName:kLSFormatterTimeKey stringValue:timeFormat]];
    
    NSError *error = nil;
    self = [super initWithConfig:element error:&error];
    if (!self)
    {
        RAISE_EXCEPTION(@"can't create configuration object because %@", [error description]);
        return nil;
    }
    return self;
}

-(BOOL)checkWithError:(LSError *__autoreleasing *)outError
{
    if (!_regex)
    {
        RETURN_OUT_ERROR(@"empty regular expression configuration");
        return NO;
    }
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    for (LSCaptureConfiguration *aConfig in _regex.captureConfigurations)
    {
        [dictionary setObject:aConfig forKey:aConfig.name];
    }
    
    NSString *key = kLSFormatterTimeCapture;
    if (![dictionary objectForKey:key])
    {
        RETURN_OUT_ERROR(@"Can't find capture for:%@", key);
        return NO;
    }
    
    key = kLSFormatterLogLevelCapture;
    if (![dictionary objectForKey:key])
    {
        RETURN_OUT_ERROR(@"Can't find capture for:%@", key);
        return NO;
    }
    
    key = kLSFormatterEventCapture;
    if (![dictionary objectForKey:key])
    {
        RETURN_OUT_ERROR(@"Can't find capture for:%@", key);
        return NO;
    }
    
    if (![_timeFormat length])
    {
        RETURN_OUT_ERROR(@"invalid time format");
        return NO;
    }
    
    return YES;
}

-(id)createObject
{
    return [[LSFormatter alloc] initWithConfiguration:self];
}

@end
