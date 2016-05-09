//
//  LSRegexCreator.m
//  LogStory
//
//  Created by cynthia on 4/28/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSRegexConfiguration.h"
#import "LSCaptureConfiguration.h"
#import "LSRegex.h"

NSString * const kLSRegexNodeName = @"LSRegex";

NSString * const kLSRegexPatternKey = @"LSPattern";
NSString * const kLSRegexCaseKey = @"LSCaseSensitive";
NSString * const kLSRegexLineKey = @"LSMatchLine";

@implementation LSRegexConfiguration

-(instancetype)initWithConfig:(NSXMLElement *)xmlConfig error:(LSError *__autoreleasing *)outError
{
    if (self = [super initWithConfig:xmlConfig error:outError])
    {
        // 1. load pattern
        _pattern = [self firstConfigNodeStringValueWithName:kLSRegexPatternKey];
        
        // 2. load CaseSensitive
        NSString *str = [self firstConfigNodeStringValueWithName:kLSRegexCaseKey];
        _isCaseSensitive = [str length] ? [str boolValue] : YES;
        
        str = [self firstConfigNodeStringValueWithName:kLSRegexLineKey];
        _isMatchLineSeparator = [str length] ? [str boolValue] : YES;
        
        // 3. load capture array
        NSMutableArray *captures = [NSMutableArray array];
        NSArray *array = [self.xmlConfig elementsForName:kLSCaptureNodeName];
        for (NSXMLElement *element in array)
        {
            LSCaptureConfiguration *aConfig = [[LSCaptureConfiguration alloc] initWithConfig:element error:outError];
            if (!aConfig)
            {
                return nil;
            }
            [captures addObject:aConfig];
        }
        _captureConfigurations = [NSArray arrayWithArray:captures];
        
        // 4. check data consistance
        if (![self checkWithError:outError])
        {
            return nil;
        }
    }
    return self;
}

-(instancetype)initWithProperty:(NSDictionary *)properties
{
    NSXMLElement *element = [NSXMLElement elementWithName:kLSRegexNodeName];
    
    NSString *key = kLSRegexPatternKey;
    NSString *val = [properties objectForKey:kLSRegexPatternKey];
    [element addChild:[NSXMLElement elementWithName:key stringValue:[val copy]]];
    
    key = kLSRegexCaseKey;
    val = [properties objectForKey:key];
    if ([val length])
    {
        [element addChild:[NSXMLElement elementWithName:key stringValue:[val copy]]];
    }
    
    key = kLSRegexLineKey;
    val = [properties objectForKey:key];
    if ([val length])
    {
        [element addChild:[NSXMLElement elementWithName:key stringValue:[val copy]]];
    }
    
    key = kLSCaptureNodeName;
    NSArray *objs = [properties objectForKey:key];
    for (LSCaptureConfiguration *aConfig in objs)
    {
        [element addChild:[aConfig.xmlConfig copy]];
    }
    
    NSError *error = nil;
    self = [self initWithConfig:element error:&error];
    if (!self)
    {
        RAISE_EXCEPTION(@"Can't init from properies because %@", [error description]);
        return nil;
    }
    return self;
}

-(BOOL)checkWithError:(LSError *__autoreleasing *)outError
{
    if (![_pattern length])
    {
        RETURN_OUT_ERROR(@"empty pattern in xml config");
        return NO;
    }
    
    NSRegularExpression *exp = [NSRegularExpression regularExpressionWithPattern:_pattern options:0 error:outError];
    if (!exp)
    {
        return NO;
    }
    
    if (exp.numberOfCaptureGroups < _captureConfigurations.count)
    {
        RETURN_OUT_ERROR(@"Capture group count mismatch, hope to capture:%ld, actuall:%ld", _captureConfigurations.count, exp.numberOfCaptureGroups);
        return NO;
    }
    
    return YES;
}

-(id)createObject
{
    return [[LSRegex alloc] initWithConfiguration:self];
}

-(NSArray *)createCaptureObjects
{
    NSMutableArray *array = [NSMutableArray array];
    
    for (LSCaptureConfiguration *aConfig in _captureConfigurations)
    {
        [array addObject:[aConfig createObject]];
    }
    
    return [NSArray arrayWithArray:array];
}

@end
