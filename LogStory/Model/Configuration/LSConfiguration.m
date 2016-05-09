//
//  LSCreator.m
//  LogStory
//
//  Created by cynthia on 4/28/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSConfiguration.h"

@implementation LSConfiguration

-(instancetype)init
{
    if (self = [super init])
    {
        _xmlConfig = nil;
    }
    return self;
}

-(instancetype)initWithConfig:(NSXMLElement *)xmlConfig
                        error:(LSError *__autoreleasing *)outError
{
    if (!xmlConfig)
    {
        RETURN_OUT_ERROR(@"invalid input xml node");
        return nil;
    }
    
    if (self = [self init])
    {
        _xmlConfig = xmlConfig;
    }
    return self;
}

-(NSXMLElement *)firstConfigNodeWithName:(NSString *)name
{
    NSArray *children = [_xmlConfig elementsForName:name];
    if ([children count])
    {
        return [children firstObject];
    }
    return nil;
}

-(NSString *)firstConfigNodeStringValueWithName:(NSString *)name
{
    NSXMLElement *element = [self firstConfigNodeWithName:name];
    if ([[element stringValue] length])
    {
        return [element.stringValue copy];
    }
    return @"";
}

-(id)createObject
{
    RAISE_EXCEPTION(@"Base class didn't implement this method");
    return nil;
}

-(NSXMLElement *)createXmlNode
{
    return nil;
}

@end
