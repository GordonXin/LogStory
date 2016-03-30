//
//  NSXMLElement+LogStory.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "NSXMLElement+LogStory.h"

@implementation NSXMLElement (LogStory)

-(NSXMLElement *)childrenElementWithName:(NSString *)name
{
    for (NSXMLElement *child in self.children)
    {
        if ([child.name isEqualToString:name])
            return child;
    }
    return nil;
}

@end
