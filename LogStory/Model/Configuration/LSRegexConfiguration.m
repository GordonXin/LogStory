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
NSString * const kLSRegexCaseKey = @"CaseSensitive";
NSString * const kLSRegexLineKey = @"MatchLine";

NSString * const kLSRegexCaptureMatchString = @"MatchString";

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
        
        // add a default capture
        LSCaptureConfiguration *defaultConfig = [[LSCaptureConfiguration alloc] init];
        defaultConfig.name = kLSRegexCaptureMatchString;
        defaultConfig.type = @"String";
        [captures addObject:defaultConfig];
        
        // add custom capture
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
    
    if (exp.numberOfCaptureGroups + 1 < _captureConfigurations.count)
    {
        RETURN_OUT_ERROR(@"Capture group count mismatch, hope to capture:%ld, actuall:%ld", _captureConfigurations.count, exp.numberOfCaptureGroups);
        return NO;
    }
    
    BOOL hasDefaultConfig = FALSE;
    for (LSCaptureConfiguration *aConfig in self.captureConfigurations)
    {
        if ([aConfig.name isEqualToString:kLSRegexCaptureMatchString])
        {
            hasDefaultConfig = TRUE;
            break;
        }
    }
    if (!hasDefaultConfig)
    {
        RETURN_OUT_ERROR(@"Capture group dont't contain default capture");
        return NO;
    }
    
    return YES;
}

-(id)createObject
{
    return [[LSRegex alloc] initWithConfiguration:self];
}

-(NSXMLElement *)createXmlNode
{
    NSError *error = nil;
    if (![self checkWithError:&error])
    {
        RAISE_EXCEPTION(@"Can't create xml node because: %@", [error description]);
        return nil;
    }
    
    NSXMLElement *element = [super createXmlNode];
    if (element == nil)
    {
        element = [NSXMLElement elementWithName:kLSRegexNodeName];
    }
    
    [element addChild:[NSXMLElement elementWithName:kLSRegexPatternKey
                                        stringValue:self.pattern]];
    
    [element addChild:[NSXMLElement elementWithName:kLSRegexCaseKey
                                        stringValue:[NSString stringWithFormat:@"%@", self.isCaseSensitive ? @"TRUE" : @"FALSE"]]];
    
    [element addChild:[NSXMLElement elementWithName:kLSRegexLineKey
                                        stringValue:[NSString stringWithFormat:@"%@", self.isMatchLineSeparator ? @"TRUE" : @"FALSE"]]];
    
    for (LSCaptureConfiguration *aCapture in self.captureConfigurations)
    {
        if (![aCapture.name isEqualToString:kLSRegexCaptureMatchString])
        {
            [element addChild:[aCapture createXmlNode]];
        }
    }
    
    return element;
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
