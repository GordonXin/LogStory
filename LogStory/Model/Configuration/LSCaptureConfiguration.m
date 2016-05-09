//
//  LSCaptureCreator.m
//  LogStory
//
//  Created by cynthia on 4/28/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSCaptureConfiguration.h"
#import "LSCapture.h"

NSString * const kLSCaptureNodeName = @"LSCapture";

NSString * const kLSCaptureNameKey = @"Name";
NSString * const kLSCaptureTypeKey = @"Type";

@implementation LSCaptureConfiguration

-(instancetype)initWithConfig:(NSXMLElement *)xmlConfig error:(LSError *__autoreleasing *)outError
{
    if (self = [super initWithConfig:xmlConfig error:outError])
    {
        self.name = [self firstConfigNodeStringValueWithName:kLSCaptureNameKey];
        self.type = [self firstConfigNodeStringValueWithName:kLSCaptureTypeKey];
        
        if (![self checkWithError:outError])
        {
            return nil;
        }
    }
    return self;
}

-(BOOL)checkWithError:(LSError *__autoreleasing *)outError
{
    if (![_name length])
    {
        RETURN_OUT_ERROR(@"empty value for config node:%@", kLSCaptureNameKey);
        return NO;
    }
    
    if (![_type length])
    {
        RETURN_OUT_ERROR(@"empty value for config node:%@", kLSCaptureTypeKey);
        return NO;
    }
    return YES;
}

-(id)createObject
{
    return [[LSCapture alloc] initWithConfiguration:self];
}

-(NSXMLElement *)createXmlNode
{
    NSError *error = nil;
    if (![self checkWithError:&error])
    {
        RAISE_EXCEPTION(@"Can't create xml node because: %@", [error description]);
        return nil;
    }
    
    NSXMLElement *element = [super createXmlNode];
    if (element == nil)
    {
        element = [[NSXMLElement alloc] initWithName:kLSCaptureNodeName];
    }
    
    [element addChild:[NSXMLElement elementWithName:kLSCaptureNameKey stringValue:self.name]];
    [element addChild:[NSXMLElement elementWithName:kLSCaptureTypeKey stringValue:self.type]];
    
    return element;
}

@end
