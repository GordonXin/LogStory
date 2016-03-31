//
//  LSRegexObject.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSRegexObject.h"
#import "LSCaptureObject.h"

NSString * const kLSRegexObject = @"LSRegex";

NSString * const kLSRegexObjectExpressionKey = @"Expression";
NSString * const kLSRegexObjectCaseKey       = @"CaseSensitive";

@implementation LSRegexObject

+(NSString *)nodeName
{
    return kLSRegexObject;
}

-(void)checkAttributes
{
    NSString *expr = [self attributeWithKey:kLSRegexObjectExpressionKey proposedClass:[NSString class]];
    if (![expr length])
    {
        self.errorMessage = [NSString stringWithFormat:@"Regex is empty"];
        return;
    }
    
    _captureArray = [self attributeArrayWithKey:kLSCaptureObject proposedClass:[LSCaptureObject class]];
    
    _regex = [self generateRegex];
}

-(NSRegularExpression *)generateRegex
{
    NSString *expr = [self attributeWithKey:kLSRegexObjectExpressionKey proposedClass:[NSString class]];
    
    NSRegularExpressionOptions option = 0;
    NSString *caseSensitive = [self attributeWithKey:kLSRegexObjectCaseKey proposedClass:[NSString class]];
    if (caseSensitive && ![caseSensitive boolValue])
    {
        option |= NSRegularExpressionCaseInsensitive;
    }
    
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expr options:option error:&error];
    if (!regex)
    {
        self.errorMessage = [NSString stringWithFormat:@"Regex fail. %@ reason %@", [error localizedDescription], [error localizedFailureReason]];
        return nil;
    }
    
    _captureArray = [self attributeArrayWithKey:kLSCaptureObject proposedClass:[LSCaptureObject class]];
    if ([_captureArray count] > regex.numberOfCaptureGroups)
    {
        self.errorMessage = [NSString stringWithFormat:@"Regex "];
        return nil;
    }
    
    return regex;
}

@end
