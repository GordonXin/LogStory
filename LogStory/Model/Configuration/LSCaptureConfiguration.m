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

NSString * const kLSCaptureNameKey = @"LSName";
NSString * const kLSCaptureTypeKey = @"LSType";

@implementation LSCaptureConfiguration

-(instancetype)initWithConfig:(NSXMLElement *)xmlConfig error:(LSError *__autoreleasing *)outError
{
    if (self = [super initWithConfig:xmlConfig error:outError])
    {
        _name = [[self firstConfigNodeStringValueWithName:kLSCaptureNameKey] copy];
        _type = [[self firstConfigNodeStringValueWithName:kLSCaptureTypeKey] copy];
        
        if (![self checkWithError:outError])
        {
            return nil;
        }
    }
    return self;
}

-(instancetype)initWithProperty:(NSDictionary *)properties
{
    NSString *name = [properties objectForKey:kLSCaptureNameKey];
    NSString *type = [properties objectForKey:kLSCaptureTypeKey];
    
    NSXMLElement *element = [NSXMLElement elementWithName:kLSCaptureNodeName];
    [element addChild:[NSXMLElement elementWithName:kLSCaptureNameKey stringValue:[name copy]]];
    [element addChild:[NSXMLElement elementWithName:kLSCaptureTypeKey stringValue:[type copy]]];
    
    NSError *error = nil;
    self = [super initWithConfig:element error:&error];
    if (!self)
    {
        RAISE_EXCEPTION(@"can't create configuration object because %@", [error description]);
        return nil;
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

@end
