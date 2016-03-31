//
//  LSLineObject.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSEventObject.h"
#import "LSRegexObject.h"
#import "LSTimeObject.h"
#import "LSCaptureObject.h"

NSString * const kLLEventObject = @"LSEvent";

@implementation LSEventObject

+(NSString *)nodeName
{
    return kLLEventObject;
}

-(void)checkAttributes
{
    _regexObj = (LSRegexObject *)[self attributeWithKey:kLSRegexObject proposedClass:[LSRegexObject class]];
    if (!_regexObj)
    {
        self.errorMessage = [NSString stringWithFormat:@"Regex node is missing"];
        return;
    }
    
    _timeObj = (LSTimeObject *)[self attributeWithKey:kLSTimeObject proposedClass:[LSTimeObject class]];
    if (!_timeObj)
    {
        self.errorMessage = [NSString stringWithFormat:@"Time node is empty"];
        return;
    }
    
    _captureArray = [_regexObj captureArray];
    if (![_captureArray count])
    {
        self.errorMessage = [NSString stringWithFormat:@"Event Filter must contain Capture nodes"];
        return;
    }
    
    _timeCapture = [LSCaptureObject captureObjecWithName:@"Time" inArray:_captureArray];
    if (!_timeCapture)
    {
        self.errorMessage = [NSString stringWithFormat:@"Event Filter must contain Capture node for Time"];
        return;
    }
    
    _contentCapture = [LSCaptureObject captureObjecWithName:@"Content" inArray:_captureArray];
    if (!_contentCapture)
    {
        self.errorMessage = [NSString stringWithFormat:@"Event Filter must contain Capture node for Content"];
        return;
    }
}

@end
