//
//  LSRegexObject.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSRegexObject.h"
#import "LSCaptureObjectList.h"

#import "LSException.h"
#import "NSXMLElement+LogStory.h"

static NSString * const kLSRegexObject = @"LSRegexObject";
static NSString * const kLSRegexExpression = @"LSRegexExpression";

@implementation LSRegexObject

#pragma mark -
#pragma mark        XML loading
#pragma mark -

-(id)initWithElementNode:(NSXMLElement *)elementNode
{
    if (elementNode == nil)
    {
        [LSException raise:SELF_OBJ_NAME format:@""];
        return nil;
    }
    
    if (self = [super init])
    {
        NSXMLElement *expressionNode = [elementNode childrenElementWithName:kLSRegexExpression];
        if (expressionNode == nil)
        {
            [LSException raise:SELF_OBJ_NAME format:@""];
            return nil;
        }
        _expression = [expressionNode stringValue];
        
        NSXMLElement *captureListNode = [elementNode childrenElementWithName:[LSCaptureObjectList name]];
        if (captureListNode != nil)
        {
            _captureList = [[LSCaptureObjectList alloc] initWithElementNode:captureListNode];
        }
    }
    
    return self;
}

#pragma mark -
#pragma mark        XML writing
#pragma mark -

-(id)initWithAttributes:(NSDictionary *)attributes
{
    NSString *expression = [attributes objectForKey:kLSRegexExpression];
    if (expression == nil || expression.length <= 0)
    {
        [LSException raise:SELF_OBJ_NAME format:@""];
        return nil;
    }
    LSCaptureObjectList *list = [attributes objectForKey:[LSCaptureObjectList name]];
    
    if (self = [super init])
    {
        _expression = expression;
        _captureList = list;
    }
    return self;
}

-(NSXMLElement *)element
{
    NSXMLElement *node = [[NSXMLElement alloc] initWithName:kLSRegexObject];
    NSXMLElement *expressionNode = [[NSXMLElement alloc] initWithName:kLSRegexExpression stringValue:_expression];
    [node addChild:expressionNode];
    
    if (_captureList)
    {
        [node addChild:[_captureList element]];
    }
    return node;
}

@end
