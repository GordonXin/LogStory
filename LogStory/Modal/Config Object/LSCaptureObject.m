//
//  LSCaptureObject.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSCaptureObject.h"
#import "LSException.h"
#import "NSXMLElement+LogStory.h"

static NSString * const kLSCaptureObject = @"LSCapture";

static NSString * const kLSCaptureName = @"LSCaptureName";
static NSString * const kLSCaptureType = @"LSCaptureType";

@implementation LSCaptureObject

#pragma mark -
#pragma mark        XML loading
#pragma mark -

-(id)initWithElementNode:(NSXMLElement *)elementNode
{
    if (self = [super init])
    {
        NSXMLElement *nameNode = [elementNode childrenElementWithName:kLSCaptureName];
        if (nameNode == nil)
        {
            [LSException raise:SELF_OBJ_NAME format:@""];
            return nil;
        }
        _objectName = nameNode.stringValue;
        
        NSXMLElement *typeNode = [elementNode childrenElementWithName:kLSCaptureType];
        if (typeNode == nil)
        {
            [LSException raise:SELF_OBJ_NAME format:@""];
            return nil;
        }
        _ObjectType = typeNode.stringValue;
    }
    return self;
}

#pragma mark -
#pragma mark        XML writing
#pragma mark -

-(id)initWithAttributes:(NSDictionary *)attributes
{
    NSString *objectName = [attributes objectForKey:kLSCaptureName];
    if (objectName == nil || objectName.length <= 0)
    {
        [LSException raise:SELF_OBJ_NAME format:@""];
        return nil;
    }
    
    NSString *objectType = [attributes objectForKey:kLSCaptureType];
    if (objectType == nil || objectType.length <= 0)
    {
        [LSException raise:SELF_OBJ_NAME format:@""];
        return nil;
    }
    
    if (self = [super init])
    {
        _objectName = [objectName copy];
        _ObjectType = [objectType copy];
    }
    return self;
}

-(NSXMLElement *)element
{
    NSXMLElement *node = [[NSXMLElement alloc] initWithName:kLSCaptureObject];
    
    NSXMLElement *nameNode = [[NSXMLElement alloc] initWithName:kLSCaptureName stringValue:_objectName];
    NSXMLElement *typeNode = [[NSXMLElement alloc] initWithName:kLSCaptureType stringValue:_ObjectType];
    
    [node addChild:nameNode];
    [node addChild:typeNode];
    
    return node;
}

@end

@implementation LSCaptureObject (factoryMethod)

+(id)captureObjectWithElement:(NSXMLElement *)element
{
    if (element == nil)
    {
        [LSException raise:SELF_OBJ_NAME format:@""];
        return nil;
    }
    
    if ([element.name isEqualToString:kLSCaptureObject])
    {
        return [[LSCaptureObject alloc] initWithElementNode:element];
    }

    return nil;
}

+(NSArray *)captureObjectArrayWithParentElement:(NSXMLElement *)element
{
    if (element == nil)
    {
        [LSException raise:SELF_OBJ_NAME format:@""];
        return nil;
    }
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSXMLElement *child in element.children)
    {
        LSCaptureObject *captureObject = [LSCaptureObject captureObjectWithElement:child];
        [array addObject:captureObject];
    }
    if (array.count)
    {
        return [NSArray arrayWithArray:array];
    }
    return nil;
}

@end

