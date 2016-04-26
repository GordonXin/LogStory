//
//  LSRegexProperty.m
//  LogStory
//
//  Created by cynthia on 4/25/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSRegexProperty.h"
#import "LSCaptureProperty.h"

#import "LSError.h"

static NSString * const kLSRegexExpressionKey = @"Expression";
static NSString * const kLSRegexCaseKey = @"CaseSensiive";

@implementation LSRegexProperty

+(NSString *)xmlNodeName
{
    return @"LSRegex";
}

-(instancetype)initWithElementNode:(NSXMLElement *)element error:(NSError *__autoreleasing *)outError
{
    if (self = [super initWithElementNode:element error:outError])
    {
        if (![self loadPropertyWithElementNode:element error:outError])
        {
            return nil;
        }
    }
    return self;
}

-(BOOL)loadPropertyWithElementNode:(NSXMLElement *)element error:(NSError *__autoreleasing *)outError
{
    NSArray *array = [element elementsForName:kLSRegexExpressionKey];
    if ([array count])
    {
        NSXMLElement *node = [array objectAtIndex:0];
        self.regexString = node.stringValue;
    }
    
    if (![self.regexString length])
    {
        RETURN_OUT_ERROR(@"Initialzation fail. empty regex expression");
        return NO;
    }
    
    NSMutableArray *captures = [NSMutableArray array];
    array = [element elementsForName:[LSCaptureProperty xmlNodeName]];
    if ([array count])
    {
        for (NSXMLElement *node in array)
        {
            LSCaptureProperty *property = [[LSCaptureProperty alloc] initWithElementNode:node error:outError];
            if (!property)
            {
                return NO;
            }
            [captures addObject:property];
        }
    }
    _captureArray = [NSArray arrayWithArray:captures];
    
    array = [element elementsForName:kLSRegexCaseKey];
    if ([array count])
    {
        NSXMLElement *node = [array objectAtIndex:0];
        self.isCaseSensitive = [node.stringValue boolValue];
    }
    else
    {
        self.isCaseSensitive = NO;
    }
    
    return YES;
}

-(NSXMLElement *)xmlNdoe
{
    if ([self.regexString length])
    {
        NSXMLElement *element = [NSXMLElement elementWithName:[self.class xmlNodeName]];
        
        [element addChild:[[NSXMLElement alloc] initWithName:kLSRegexExpressionKey stringValue:self.regexString]];
        
        if ([self.captureArray count])
        {
            for (LSCaptureProperty *property in self.captureArray)
            {
                NSXMLElement *child = [property xmlNdoe];
                if (child)
                {
                    [element addChild:child];
                }
            }
        }
        
        [element addChild:[[NSXMLElement alloc] initWithName:kLSRegexExpressionKey stringValue:self.isCaseSensitive ? @"TRUE" : @"FALSE"]];
    }
    return nil;
}

@end
