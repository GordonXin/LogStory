//
//  LSConfigObject.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSConfigObject.h"
#import "LSException.h"

@implementation LSConfigObject

#pragma mark -
#pragma mark        XML loading
#pragma mark -

-(instancetype)initWithElementNode:(NSXMLElement *)elementNode
{
    if (self = [super init])
    {
    
    }
    return self;
}

#pragma mark -
#pragma mark        XML writing
#pragma mark -

-(instancetype)initWithAttributes:(NSDictionary *)attributes
{
    if (self = [super init])
    {
    
    }
    return self;
}

-(NSXMLElement *)element
{
    [LSException raise:SELF_OBJ_NAME format:@""];
    return nil;
}

@end
