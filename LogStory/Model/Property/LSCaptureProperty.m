//
//  LSCaptureProperty.m
//  LogStory
//
//  Created by cynthia on 4/25/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSCaptureProperty.h"
#import "LSError.h"

static NSString * const kLSCaptureNameKey = @"Name";
static NSString * const kLSCaptureTypeKey = @"Type";

@implementation LSCaptureProperty

+(NSString *)xmlNodeName
{
    return @"LSCapture";
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
    NSArray *array = [element elementsForName:kLSCaptureNameKey];
    if ([array count])
    {
        NSXMLElement *node = [array objectAtIndex:0];
        self.name = node.stringValue;
    }
    
    array = [element elementsForName:kLSCaptureTypeKey];
    if ([array count])
    {
        NSXMLElement *node = [array objectAtIndex:0];
        self.type = node.stringValue;
    }
    
    if (![self.name length])
    {
        RETURN_OUT_ERROR(@"Initialization failed, because '%@' node is empty", kLSCaptureNameKey);
        return NO;
    }
    
    if (![self.type length])
    {
        RETURN_OUT_ERROR(@"Initialization failed, because '%@' node is empty", kLSCaptureTypeKey);
        return NO;
    }
    return YES;
}

-(NSXMLElement *)xmlNdoe
{
    if ([self.name length] && [self.type length])
    {
        NSXMLElement *element = [[NSXMLElement alloc] initWithName:[self.class xmlNodeName]];
        
        [element addChild:[[NSXMLElement alloc] initWithName:kLSCaptureNameKey stringValue:self.name]];
        [element addChild:[[NSXMLElement alloc] initWithName:kLSCaptureTypeKey stringValue:self.type]];
        return element;
    }
    return nil;
}

@end
