//
//  LSConfigObject.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSConfigObject.h"

@interface LSConfigObject ()
{
    LSPairArray *_attributes;
}

@end

@implementation LSConfigObject

+(NSString *)nodeName
{
    return @"Invalid Node Name";
}

+(BOOL)isValidElement:(NSXMLElement *)element
{
    if (element && element.name && element.name.length)
    {
        return YES;
    }
    return NO;
}

+(id)configObjectWithElement:(NSXMLElement *)element
{
    if (element.childCount)
    {
    
    }
    
    return (element.stringValue) ? element.stringValue : @"";
}

-(instancetype)initWithElementNode:(NSXMLElement *)element
{
    if (self = [self init])
    {
        _configName = [element.name copy];
        
        [self readChildFrom:element];
        
        [self checkErrorFromAtrributes];
        
        if (![self.errorMessage length])
        {
            [self checkAttributes];
        }
    }
    return self;
}

-(void)readChildFrom:(NSXMLElement *)element
{
    if (element.childCount)
    {
        for (NSXMLElement *child in element.children)
        {
            if ([LSConfigObject isValidElement:child])
            {
                id obj = [LSConfigObject configObjectWithElement:child];
                [_attributes addPair:[[LSPair alloc] initWithValue:obj forKey:child.name]];
            }
        }
    }
}

-(void)checkErrorFromAtrributes
{
    for (NSUInteger i = 0; i < [_attributes count]; ++i)
    {
        LSPair *pair = [_attributes pairAtIndex:i];
        id val = [pair value];
        if ([val isKindOfClass:[LSConfigObject class]] && [[val errorMessage] length])
        {
            self.errorMessage = [(LSConfigObject *)val errorMessage];
        }
    }
}

-(void)checkAttributes
{

}

-(id)attributeWithKey:(NSString *)key proposedClass:(Class)className
{
    id obj = [_attributes firstValueForKey:key];
    if (obj && [obj isKindOfClass:className])
    {
        return obj;
    }
    return nil;
}

-(NSArray *)attributeArrayWithKey:(NSString *)key proposedClass:(Class)className
{
    NSArray *attrs = [_attributes valuesForKey:key];
    NSMutableArray *array = [NSMutableArray array];
    
    if ([attrs count])
    {
        for (id obj in attrs)
        {
            if ([obj isKindOfClass:className])
            {
                [array addObject:obj];
            }
        }
    }
    return [NSArray arrayWithArray:array];
}

@end

