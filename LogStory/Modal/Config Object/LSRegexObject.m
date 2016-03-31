//
//  LSRegexObject.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSRegexObject.h"
#import "LSCaptureObject.h"

#import "LSError.h"
#import "LSXMLHelper.h"

NSString * const kLSRegexObject = @"LSRegex";

NSString * const kExpressionKey = @"Expression";

@implementation LSRegexObject

-(instancetype)initWithElementNode:(NSXMLElement *)element error:(NSError *__autoreleasing *)outError
{
    if (self = [super initWithElementNode:element error:outError])
    {
        
    }
    return self;
}

-(BOOL)readNode:(NSXMLElement *)element error:(NSError *__autoreleasing *)outError
{
    // check
    if (![element.name isEqualToString:kLSRegexObject])
    {
        if (outError)
        {
            *outError = [LSError errorFromClass:self.class
                                       selector:_cmd
                                         format:@"Initialization failed, because input element with wrong name:%@", element.name];
        }
        return NO;
    }
    
    // read <Expression></Expression>
    NSXMLElement *regexNode = [LSXMLHelper firtElementWithName:kExpressionKey ofParent:element];
    if (!regexNode)
    {
        if (outError)
        {
            *outError = [LSError errorFromClass:self.class
                                       selector:_cmd
                                         format:@"Initialization failed, because can't find %@ element in input element:%@", kExpressionKey, element.name];
        }
        return NO;
    }
    _regexString = [regexNode stringValue];
    if (![_regexString length])
    {
        if (outError)
        {
            *outError = [LSError errorFromClass:self.class
                                       selector:_cmd
                                         format:@"Initialization failed, because %@ value is empty", kExpressionKey];
        }
        return NO;
    }
    
    // read <LSCaptureList></LSCaptureList>
    NSXMLElement *captureNode = [LSXMLHelper firtElementWithName:kLSCaptureObjectList ofParent:element];
    if (captureNode)
    {
        _captureList = [[LSCaptureObjectList alloc] initWithElementNode:element error:outError];
        if (!_captureList)
        {
            return NO;
        }
    }

    return YES;
}

@end
