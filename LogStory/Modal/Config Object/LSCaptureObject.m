//
//  LSCaptureObject.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSCaptureObject.h"
#import "LSTypeObject.h"
#import "LSXMLHelper.h"

NSString * const kLSCaptureObject           = @"LSCapture";

NSString * const kLSCaptureObjectNameKey    = @"Name";
NSString * const kLSCaptureObjectTypeKey    = @"Type";

@implementation LSCaptureObject

+(NSString *)elementName
{
    return kLSCaptureObject;
}

-(instancetype)initWithElementNode:(NSXMLElement *)element
{
    if (self = [super initWithElementNode:element])
    {
        if (![self.errorMessage length])
        {
            [self checkAttributes];
        }
    }
    return self;
}

-(BOOL)checkAttributes
{
    NSXMLElement *elementName = [LSXMLHelper firtElementWithName:kLSCaptureObjectNameKey ofParent:self.elementSelf];
    if (![LSConfigObject isValidElement:elementName])
    {
        self.errorMessage = [NSString stringWithFormat:@"[Capture] name is empty"];
        return NO;
    }
    _name = [elementName.stringValue copy];
    
    NSXMLElement *elementType = [LSXMLHelper firtElementWithName:kLSCaptureObjectTypeKey ofParent:self.elementSelf];
    if (![LSConfigObject isValidElement:elementType])
    {
        self.errorMessage = [NSString stringWithFormat:@"[Capture] type is empty"];
        return NO;
    }
    _type = [elementType.stringValue copy];
    
    if ([LSTypeObject isSupportedType:_type])
    {
        self.errorMessage = [NSString stringWithFormat:@"[Capture] type %@ is not supported", _type];
        return NO;
    }
    return YES;
}

@end
