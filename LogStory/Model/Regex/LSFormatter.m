//
//  LSFormatter.m
//  LogStory
//
//  Created by cynthia on 4/29/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSFormatter.h"
#import "LSFormatterConfigruation.h"
#import "LSRegexConfiguration.h"
#import "LSRegex.h"

@interface LSFormatter()

@property (nonatomic, readwrite, strong) LSRegex *regex;


@end

@implementation LSFormatter

-(instancetype)initWithConfiguration:(LSConfiguration *)configuration
{
    if (![configuration isKindOfClass:[LSFormatterConfigruation class]])
    {
        RAISE_EXCEPTION(@"Wrong configuration object class:%@", [self.configuration class]);
        return nil;
    }
    
    if (self = [super initWithConfiguration:configuration])
    {
        LSFormatterConfigruation *config = (LSFormatterConfigruation *)self.configuration;
        _regex = [config.regex createObject];
        
        _timeFormat = [[NSDateFormatter alloc] init];
        [_timeFormat setDateFormat:config.timeFormat];
    }
    return self;
}

-(void)enumerateEventInString:(__weak NSString *)inString
                      inRange:(NSRange)inRange
                   matchBlock:(MatchBlock)matchBlock
                completeBlock:(CompleteBlock)completeBlock
{
    NSDate *date = [NSDate date];
    
    [_regex enumerateMatchInString:inString
                           inRange:inRange
                        matchBlock:matchBlock
                     completeBlock:completeBlock
                        errorBlock:nil];
    
    NSTimeInterval ti = [[NSDate date] timeIntervalSinceDate:date];
    ti = ti;
}

@end

@implementation LSFormatterManager

-(instancetype)init
{
    if (self = [super init])
    {
        _formatterDictionary = @{};
    }
    return self;
}

static LSFormatterManager *_defaultManager;
+(LSFormatterManager *)defaultManager
{
    if (_defaultManager == nil)
    {
        _defaultManager = [[LSFormatterManager alloc] init];
        [_defaultManager loadFormatters];
    }
    return _defaultManager;
}

-(void)loadFormatters
{
    NSError *error = nil;
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    NSArray *urls = [[NSBundle mainBundle] URLsForResourcesWithExtension:@"xml" subdirectory:@"Formatter"];
    for (NSURL *aURL in urls)
    {
        LSFormatter *formatter = [self loadFormatterWithURL:aURL error:&error];
        
        if (formatter)
        {
            [dic setObject:formatter forKey:formatter.name];
        }
    }
    
    _formatterDictionary = [NSDictionary dictionaryWithDictionary:dic];
}

-(LSFormatter *)loadFormatterWithURL:(NSURL *)url error:(LSError *__autoreleasing*)outError
{
    if (!url)
    {
        return nil;
    }
    
    NSXMLDocument *doc = [[NSXMLDocument alloc] initWithContentsOfURL:url options:0 error:outError];
    if (!doc)
    {
        return nil;
    }
    
    LSFormatterConfigruation *config = [[LSFormatterConfigruation alloc] initWithConfig:doc.rootElement error:outError];
    if (!config)
    {
        return nil;
    }
    
    LSFormatter *formatter = [config createObject];
    [formatter setName:[url.lastPathComponent stringByDeletingPathExtension]];
    
    return formatter;
}

-(LSFormatter *)formatterWithName:(NSString *)name
{
    return [_formatterDictionary objectForKey:name];
}

@end
