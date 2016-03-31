//
//  LSLineObject.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSLineObject.h"
#import "LSRegexObject.h"
#import "LSTimeObject.h"

#import "LSError.h"
#import "LSXMLHelper.h"


NSString * const kLSLineObject = @"LSLine";

@implementation LSLineObject

-(instancetype)initWithElementNode:(NSXMLElement *)element error:(NSError *__autoreleasing *)outError
{
    if (self = [super initWithElementNode:element error:outError])
    {
    
    }
    return self;
}

-(BOOL)readNode:(NSXMLElement *)element error:(NSError * __autoreleasing *)outError
{
    // check
    if (![element.name isEqualToString:kLSLineObject])
    {
        if (outError)
        {
            *outError = [LSError errorFromClass:self.class
                                       selector:_cmd
                                         format:@"Initialization failed, because input element with wrong name:%@", element.name];
        }
        return NO;
    }
    
    NSXMLElement *regexNode = [LSXMLHelper firtElementWithName:kLSRegexObject ofParent:element];
    if (!regexNode)
    {
        if (outError)
        {
            *outError = [LSError errorFromClass:self.class
                                       selector:_cmd
                                         format:@"Initialization failed, because can't find node with name:%@", kLSRegexObject];
        }
        return NO;
    }
    _regexObject = [[LSRegexObject alloc] initWithElementNode:regexNode error:outError];
    if (!regexNode)
    {
        return NO;
    }
    
    NSXMLElement *timeNode = [LSXMLHelper firtElementWithName:kLSTimeObject ofParent:element];
    if (!timeNode)
    {
        if (outError)
        {
            *outError = [LSError errorFromClass:self.class
                                       selector:_cmd
                                         format:@"Initialization failed, because can't find node with name:%@", kLSTimeObject];
        }
        return NO;
    }
    _timeObject = [[LSTimeObject alloc] initWithElementNode:timeNode error:outError];
    if (!timeNode)
    {
        return NO;
    }
    
    return YES;
}

@end
