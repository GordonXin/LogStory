//
//  LSProperty.m
//  LogStory
//
//  Created by cynthia on 4/25/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSProperty.h"
#import "LSError.h"

@implementation LSProperty

-(instancetype)initWithElementNode:(NSXMLElement *)element error:(NSError *__autoreleasing *)outError
{
    if (element == nil)
    {
        RETURN_OUT_ERROR(@"Initialization failed, because input element is nil");
        return nil;
    }
    
    if (self = [super init])
    {
        _xmlNode = element;
    }
     
    return self;
}

-(NSXMLElement *)xmlNdoe
{
    return _xmlNode;
}

@end
