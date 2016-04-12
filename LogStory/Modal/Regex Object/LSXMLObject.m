//
//  LSXMLObject.m
//  LogStory
//
//  Created by cynthia on 4/8/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSXMLObject.h"

@implementation LSXMLObject

-(instancetype)initFromXMLNode:(NSXMLElement *)xmlNode error:(NSError *__autoreleasing *)outError
{
    if (self = [super init])
    {
        if (xmlNode == nil)
        {
            THROW_ERROR(@"Input XML node is invalid")
            return nil;
        }
        
        _xmlNode = xmlNode;
    }
    return self;
}

@end
