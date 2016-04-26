//
//  LSRegex.m
//  LogStory
//
//  Created by cynthia on 4/25/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSRegex.h"
#import "LSRegexProperty.h"
#import "LSCaptureResult.h"

#import "LSError.h"

@interface LSRegex ()

@property (nonatomic, readwrite, strong) NSRegularExpression *regex;

@property (nonatomic, readwrite, strong) LSRegexProperty *property;

@end

@implementation LSRegex

-(instancetype)initWithProperty:(LSRegexProperty *)property error:(NSError **)outError
{
    if (self = [super init])
    {
        NSRegularExpression *expr = [self createRegexWithProperty:property error:outError];
        if (!expr)
        {
            return nil;
        }
        
        self.property = property;
        self.regex = expr;
    }
    return self;
}

-(NSRegularExpression *)createRegexWithProperty:(LSRegexProperty *)property error:(NSError **)outError
{
    NSRegularExpressionOptions options = property.isCaseSensitive ? 0 : NSRegularExpressionCaseInsensitive;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:property.regexString
                                                                           options:options
                                                                             error:outError];
    if (regex)
    {
        if (regex.numberOfCaptureGroups != property.captureArray.count)
        {
            RETURN_OUT_ERROR(@"Can't initialize regex because capture count mismatch!");
            return nil;
        }
    }
    
    return regex;
}

-(NSDictionary *)performRegexOnString:(NSString *)source range:(NSRange)range
{
    NSTextCheckingResult *result = [self.regex firstMatchInString:source options:0 range:range];
    
    if (result.numberOfRanges > 1)
    {
        for (NSInteger i = 0; i < self.regex.numberOfCaptureGroups; ++i)
        {
            NSRange range = [result rangeAtIndex:i + 1];
            LSCaptureResult *capture = [[LSCaptureResult alloc] initWithProperty:[self.property.captureArray objectAtIndex:i]
                                                                          source:source
                                                                           range:range];
            
        }
        
        return [NSDictionary dictionaryWithDictionary:dictionary];
    }
    return nil;
}

@end
