//
//  LSCaptureList.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSCaptureObjectList.h"
#import "LSCaptureObject.h"

#import "LSException.h"

static NSString * const kLSCaptureList = @"LSCaptureList";

@implementation LSCaptureObjectList

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
        NSMutableArray *array = [NSMutableArray array];
        
        for (NSXMLElement *child in elementNode.children)
        {
            LSCaptureObject *capture = [LSCaptureObject captureObjectWithElement:child];
            [array addObject:capture];
        }
        
        _captureList = [NSArray arrayWithArray:array];
    }
    return self;
}

#pragma mark -
#pragma mark        XML writing
#pragma mark -

-(id)initWithAttributes:(NSDictionary *)attributes
{
    id val = [attributes objectForKey:kLSCaptureList];
    if (val == nil || ![val isKindOfClass:[NSArray class]])
    {
        [LSException raise:SELF_OBJ_NAME format:@""];
        return nil;
    }
    
    NSArray *captureList = (NSArray *)val;
    if (self = [super init])
    {
        _captureList = [captureList copy];
    }
    return self;
}

-(NSXMLElement *)element
{
    NSXMLElement *node = [[NSXMLElement alloc] initWithName:kLSCaptureList];
    
    for (LSCaptureObject *capture in _captureList)
    {
        NSXMLElement *captureNode = [capture element];
        [node addChild:captureNode];
    }
    
    return node;
}

@end