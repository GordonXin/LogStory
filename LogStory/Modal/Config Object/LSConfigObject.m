//
//  LSConfigObject.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSConfigObject.h"

#import "LSError.h"
#import "LSException.h"


#import "LSPairArray.h"
#import "LSConfigObjectFactory.h"

@implementation LSConfigObject

-(instancetype)init
{
    if (self = [super init])
    {
        _attributes = [LSPairArray pairArray];
    }
    return self;
}

-(instancetype)initWithElementNode:(NSXMLElement *)element error:(NSError *__autoreleasing *)outError;
{
    if (element == nil)
    {
        if (outError)
        {
            *outError = [LSError errorFromClass:self.class
                                       selector:_cmd
                                         format:@"Initialization failed, because input element is nil"];
        }
        return nil;
    }
    
    if (self = [self init])
    {
    }
    return self;
}

-(instancetype)initWithAttributes:(LSPairArray *)attributes
{
    if (self = [self init])
    {
        _attributes = attributes ? [attributes copy] : [LSPairArray pairArray];
    }
    return self;
}

-(NSXMLElement *)element
{
    NSXMLElement *node = [NSXMLElement elementWithName:[self elementName]];
    
    for (id aValue in _attributes.allValues)
    {
        if ([aValue isKindOfClass:[LSConfigObject class]])
        {
            NSXMLElement *subNode = [(LSConfigObject *)aValue element];
            if (subNode)
            {
                [node addChild:subNode];
            }
        }
    }
    
    return node;
}

-(NSString *)elementName
{
    [LSException raise:SELF_OBJ_NAME format:@""];
    return nil;
}

@end





@implementation LSConfigObjectList

-(instancetype)initWithElementNode:(NSXMLElement *)elementNode
{
    if (elementNode == nil)
    {
        [LSException raise:SELF_OBJ_NAME format:@""];
        return nil;
    }
    
    if (self = [super init])
    {
        _objectList = [NSMutableArray array];
        
        for (NSXMLElement *child in elementNode.children)
        {
            if (child && child.name && [child.name isEqualToString:[self subElementName]])
            {
                id obj = [LSConfigObjectFactory configObjectWithElement:child];
                [_objectList addObject:obj];
            }
            else
            {
                id obj = [LSConfigObjectFactory configObjectWithElement:child];
                if (obj)
                {
                    //[self.attributes setObject:obj forKey:child.name];
                }
            }
        }
    }
    return self;
}

-(instancetype)initWithAttributes:(LSPairArray *)attributes
{
    if (self = [super initWithAttributes:attributes])
    {
        _objectList = [NSMutableArray array];
    }
    return self;
}

-(instancetype)initWithObjectList:(LSPairArray *)attributes array:(NSMutableArray *)objectList
{
    if (self = [super initWithAttributes:attributes])
    {
        if (objectList)
        {
            _objectList = [objectList copy];
        }
    }
    return self;
}

-(NSString *)subElementName
{
    [LSException raise:SELF_OBJ_NAME format:@""];
    return nil;
}

@end


