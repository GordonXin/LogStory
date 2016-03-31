//
//  LSXMLHelper.m
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSXMLHelper.h"

@implementation LSXMLHelper

+(NSXMLElement *)firtElementWithName:(NSString *)name ofParent:(NSXMLElement *)parent
{
    NSArray *array = [parent elementsForName:name];
    if ([array count])
    {
        return [array objectAtIndex:0];
    }
    return nil;
}

@end
