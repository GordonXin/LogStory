//
//  LSRegex.m
//  LogStory
//
//  Created by cynthia on 4/8/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSRegex.h"

NSString * const kLSRegex               = @"LSRegex";

static NSString * const kExpressionKey  = @"Expression";
static NSString * const kCaseKey        = @"CaseInsensitive";

@implementation LSRegex

-(instancetype)initFromXMLNode:(NSXMLElement *)xmlNode error:(NSError *__autoreleasing *)outError
{
    if (self = [super initFromXMLNode:xmlNode error:outError])
    {
        if (![self.xmlNode.name isEqualToString:kLSRegex])
        {
            THROW_ERROR(@"Input XML node is not LSRegex")
            return nil;
        }
        
        if (![self loadNodeAndReturnError:outError])
        {
            return nil;
        }
        
        if (![self loadRegexAndReturnError:outError])
        {
            return nil;
        }
    }
    return self;
}

-(BOOL)loadNodeAndReturnError:(NSError *__autoreleasing*)outError
{
    // load pattern
    NSXMLElement *exprNode = [LSXMLHelper firtElementWithName:kExpressionKey ofParent:self.xmlNode];
    if (!exprNode)
    {
        THROW_ERROR(@"Can't find %@ node", kExpressionKey);
        return NO;
    }
    if (![exprNode.stringValue length])
    {
        THROW_ERROR(@"%@ node is empty", kExpressionKey);
        return NO;
    }
    _sExpression = [exprNode.stringValue copy];
    
    // load case insensitive
    _nOption = 0;
    NSXMLElement *caseNode = [LSXMLHelper firtElementWithName:kCaseKey ofParent:self.xmlNode];
    if (caseNode && [caseNode.stringValue length])
    {
        if ([caseNode.stringValue boolValue])
        {
            _nOption |= NSRegularExpressionCaseInsensitive;
        }
    }
    
    return YES;
}

-(BOOL)loadRegexAndReturnError:(NSError *__autoreleasing*)outError
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:self.sExpression
                                                                           options:self.nOption
                                                                             error:outError];
    if (!regex)
    {
        return NO;
    }
    
    _regex = regex;
    return YES;
}


@end
