//
//  LSConfigObject.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSConfigObject.h"
#import "LSConfigObjectFactory.h"
#import "LSError.h"

@implementation LSConfigObject

+(NSString *)xmlNodeName
{
    return @"BaseConfig";
}

-(instancetype) init
{
    if (self = [super init])
    {
        _xmlNode = nil;
        _attributes = [LSPairArray pairArray];
    }
    return self;
}

-(instancetype)initWithElementNode:(NSXMLElement *)element error:(NSError *__autoreleasing *)outError;
{
    if (element == nil)
    {
        RETURN_OUT_ERROR(@"Initialization failed, because input element is nil");
        return nil;
    }
    
    if (self = [self init])
    {
        _xmlNode = element;
        
        [self loadNodes];
    }
    return self;
}

-(void)loadNodes
{
    NSArray *children = [_xmlNode children];
    for (NSXMLElement *element in children)
    {
        LSPair *pair = [LSConfigObjectFactory configObjectWithElement:element];
        if (pair)
        {
            [_attributes addPair:pair];
        }
    }
}

-(void)updateAttribute:(id)newValue forKey:(NSString *)key
{
    LSPair *pair = [_attributes firstPairWithKey:key];
    
    if (pair)
    {
        pair.value = newValue;
    }
    else
    {
        pair = [[LSPair alloc] initWithValue:newValue andKey:key];
        [_attributes addPair:pair];
    }
}

-(NSXMLElement *)generateXMLNode
{
    NSXMLElement *element = [[NSXMLElement alloc] initWithName:[[self class] xmlNodeName]];
    
    for (NSInteger i = 0; i < _attributes.count; ++i)
    {
        NSXMLElement *child = nil;
        LSPair *pair = [_attributes pairAtIndex:i];
        if ([pair.value isKindOfClass:[LSConfigObject class]])
        {
            child = [(LSConfigObject *)pair.value generateXMLNode];
        }
        else if ([pair.value isKindOfClass:[NSString class]])
        {
            child = [[NSXMLElement alloc] initWithName:pair.key];
            [child setStringValue:pair.value];
        }
        
        if (child)
        {
            [element addChild:child];
        }
    }
    
    return element;
}

@end
