//
//  LSRegex.m
//  LogStory
//
//  Created by cynthia on 4/25/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSRegex.h"
#import "LSCapture.h"
#import "LSRegexConfiguration.h"

@interface LSRegex ()

@property (nonatomic, readwrite, strong) NSRegularExpression *regularExpression;

@end

@implementation LSRegex

-(instancetype)initWithConfiguration:(LSConfiguration *)config
{
    if (self = [super initWithConfiguration:config])
    {
        if (![self.configuration isKindOfClass:[LSRegexConfiguration class]])
        {
            RAISE_EXCEPTION(@"Wrong configuration object class:%@", [self.configuration class]);
            return nil;
        }
        
        NSError *error = nil;
        NSRegularExpressionOptions options = 0;
        LSRegexConfiguration *config = (LSRegexConfiguration *)self.configuration;
        if (!config.isCaseSensitive)
        {
            options |= NSRegularExpressionCaseInsensitive;
        }
        if (!config.isMatchLineSeparator)
        {
            options |= NSRegularExpressionDotMatchesLineSeparators;
        }
        _regularExpression = [NSRegularExpression regularExpressionWithPattern:config.pattern
                                                                       options:options
                                                                         error:&error];
    }
    
    return self;
}

-(NSDictionary *)firstMatchInString:(NSString *__weak)inString
                            inRange:(NSRange)inRange
                         errorBlock:(ErrorBlock)errorBlock
{
    NSMutableDictionary *ret = [NSMutableDictionary dictionary];
    LSRegexConfiguration *config = (LSRegexConfiguration *)self.configuration;
    NSTextCheckingResult *result = [_regularExpression firstMatchInString:inString options:0 range:inRange];
    
    if (result && result.range.location != NSNotFound)
    {
        NSArray *captures = [config createCaptureObjects];
        for (NSInteger i = 0; i < result.numberOfRanges && i < captures.count; ++i)
        {
            LSCapture *aCapture = [captures objectAtIndex:i];
            [aCapture setSource:inString];
            [aCapture setRange:[result rangeAtIndex:i]];
            [ret setObject:aCapture forKey:aCapture.name];
        }
    }
    
    return ret;
}

-(void)enumerateMatchInString:(__weak NSString *)inString
                      inRange:(NSRange)inRange
                   matchBlock:(MatchBlock)matchBlock
                completeBlock:(CompleteBlock)completeBlock
                   errorBlock:(ErrorBlock)errorBlock
{
    NSMatchingOptions options = 0;
    NSDate *date = [NSDate date];
    
    [_regularExpression enumerateMatchesInString:inString
                                         options:options
                                           range:inRange
                                      usingBlock:^(NSTextCheckingResult * result, NSMatchingFlags flags, BOOL *stop)
    {
        LSRegexConfiguration *config = (LSRegexConfiguration *)self.configuration;
        if (result && result.range.location != NSNotFound)
        {
            NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
            NSArray *captures = [config createCaptureObjects];
            for (NSInteger i = 0; i < [captures count] && i < result.numberOfRanges; ++i)
            {
                LSCapture *aCapture = [captures objectAtIndex:i];
                [aCapture setSource:inString];
                [aCapture setRange:[result rangeAtIndex:i]];
                [dictionary setObject:aCapture forKey:aCapture.name];
            }
            
            if (matchBlock)
            {
                BOOL ret = matchBlock(result.range, [NSMutableDictionary dictionaryWithDictionary:dictionary]);
                if (ret == NO)
                {
                    *stop = YES;
                }
            }
        }
    }];
    
    if (completeBlock)
    {
        completeBlock();
    }
    
    NSTimeInterval ti = [[NSDate date] timeIntervalSinceDate:date];
    ti = ti;
}

@end
