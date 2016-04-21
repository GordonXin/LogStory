//
//  LSXMLHelper.m
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSXMLHelper.h"

@implementation LSXMLHelper

+(NSInteger)numberOfElementWithName:(NSString *)name ofParent:(NSXMLElement *)parent
{
    NSArray *array = [parent elementsForName:name];
    return [array count];
}

+(NSXMLElement *)firtElementWithName:(NSString *)name ofParent:(NSXMLElement *)parent
{
    NSArray *array = [parent elementsForName:name];
    if ([array count])
    {
        return [array objectAtIndex:0];
    }
    return nil;
}

+(NSXMLElement *)elementWithName:(NSString *)name atIndex:(NSInteger)index ofParent:(NSXMLElement *)parent
{
    NSArray *array = [parent elementsForName:name];
    if ([array count] && index >= 0 && index < [array count])
    {
        return [array objectAtIndex:index];
    }
    return nil;
}

+(NSString *)stringValueOfElementWithName:(NSString *)name atIndex:(NSInteger)index ofParent:(NSXMLElement *)parent
{
    NSXMLElement *element = [LSXMLHelper elementWithName:name atIndex:index ofParent:parent];
    if (element)
    {
        return (element.stringValue) ? [element.stringValue copy] : @"";
    }
    return @"";
}

@end
