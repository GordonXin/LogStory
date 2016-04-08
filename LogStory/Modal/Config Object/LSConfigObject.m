//
//  LSConfigObject.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSConfigObject.h"

@interface LSConfigObject ()

@end

@implementation LSConfigObject

+(BOOL)isValidElement:(NSXMLElement *)element
{
    if (element == nil || ![element.stringValue length])
    {
        return NO;
    }
    return YES;
}

-(instancetype)initWithElementNode:(NSXMLElement *)element
{
    if (self = [super init])
    {
        _elementSelf = element;
        
        _errorMessage = @"";
    }
    return self;
}

@end

