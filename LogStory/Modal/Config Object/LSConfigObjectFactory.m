//
//  LSConfigObjectFactory.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSConfigObjectFactory.h"
#import "LSConfigObject.h"
#import "LSCaptureObject.h"
#import "LSRegexObject.h"
#import "LSLineObject.h"
#import "LSTimeObject.h"

@implementation LSConfigObjectFactory

+(id)configObjectWithElement:(NSXMLElement *)element
{
    if (element == nil)
    {
        return nil;
    }
    
    if (element.name == nil || element.name.length <= 0)
    {
        return nil;
    }
//    
//    if ([element.name isEqualToString:kLSCaptureObject])
//    {
//        return [[LSConfigObject alloc] initWithElementNode:element];
//    }
//    else if ([element.name isEqualToString:kLSCaptureObjectList])
//    {
//        return [[LSConfigObjectList alloc] initWithElementNode:element];
//    }
//    else if ([element.name isEqualToString:kLSRegexObject])
//    {
//        return [[LSRegexObject alloc] initWithElementNode:element];
//    }
//    else if ([element.name isEqualToString:kLSTimeObject])
//    {
//        return [[LSTimeObject alloc] initWithElementNode:element];
//    }
//    else if ([element.name isEqualToString:kLSLineObject])
//    {
//        return [[LSLineObject alloc] initWithElementNode:element];
//    }
//    
//    if (element.stringValue != nil && element.stringValue.length > 0)
//    {
//        return [NSString stringWithString:element.stringValue];
//    }
    
    return nil;
}

@end
