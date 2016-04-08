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

+(NSString *)elementName
{
    return kLSRegexObject;
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
    // read expression
    NSXMLElement *elementExpr = [LSXMLHelper firtElementWithName:kLSRegexObjectExpressionKey ofParent:self.elementSelf];
    if (![LSConfigObject isValidElement:elementExpr])
    {
        self.errorMessage = [NSString stringWithFormat:@"[Regex] expression is empty"];
        return NO;
    }
    NSString *expr = [elementExpr.stringValue copy];
    
    // read case sensitive
    NSXMLElement *elementCase = [LSXMLHelper firtElementWithName:kLSRegexObjectCaseKey ofParent:self.elementSelf];
    NSString *stringCase = @"";
    if ([LSConfigObject isValidElement:elementCase])
    {
        stringCase = [elementCase.stringValue copy];
    }
    NSRegularExpressionOptions option = 0;
    if (![stringCase boolValue])
    {
        option |= NSRegularExpressionCaseInsensitive;
    }
    
    // read captures
    NSArray *elementsCapture = [self.elementSelf elementsForName:kLSCaptureObject];
    NSMutableArray *arrayCapture = [NSMutableArray array];
    for (NSXMLElement *aCapture in elementsCapture)
    {
        LSCaptureObject *obj = [[LSCaptureObject alloc] initWithElementNode:aCapture];
        if ([obj errorMessage])
        {
            self.errorMessage = [obj.errorMessage copy];
            return NO;
        }
        [arrayCapture addObject:obj];
    }
    _captureArray = [NSArray arrayWithArray:arrayCapture];
    
    // generate NSRegularExpression
    NSError *outError = nil;
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:expr options:option error:&outError];
    if (regex == nil)
    {
        self.errorMessage = [NSString stringWithFormat:@"[Regex] %@ due to %@", outError.localizedDescription, outError.localizedFailureReason];
        return NO;
    }
    if (_captureArray.count > regex.numberOfCaptureGroups)
    {
        self.errorMessage = [NSString stringWithFormat:@"[Regex] capture count exceed that in expression"];
        return NO;
    }
    
    _regex = regex;
    return YES;
}

-(NSDictionary *)matchOnString:(NSString *)string range:(NSRange)range
{
    
}

@end
