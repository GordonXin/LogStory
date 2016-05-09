//
//  LSTest.m
//  LogStory
//
//  Created by cynthia on 4/28/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSTest.h"

#import "LSCaptureConfiguration.h"
#import "LSRegexConfiguration.h"
#import "LSRegex.h"
#import "LSCapture.h"

#import "LSFormatter.h"

@implementation LSTest

+(void)runTest2
{
    LSFormatterManager *mgr = [LSFormatterManager defaultManager];
    mgr = mgr;
}

+(void)runTest
{
    //
    // load regex
    //
    // time
    LSCaptureConfiguration *timeCapture = [[LSCaptureConfiguration alloc] initWithProperty:@{kLSCaptureNameKey : @"Time",
                                                                                             kLSCaptureTypeKey :@"String"}];
    // LogLevel
    LSCaptureConfiguration *logLevelCapture = [[LSCaptureConfiguration alloc] initWithProperty:@{kLSCaptureNameKey : @"LogLevel",
                                                                                                 kLSCaptureTypeKey : @"String"}];
    // event
    LSCaptureConfiguration *eventCapture = [[LSCaptureConfiguration alloc] initWithProperty:@{kLSCaptureNameKey : @"Event",
                                                                                              kLSCaptureTypeKey : @"String"}];
    
    // pattern
    NSString *pattern = @"";
    
    NSMutableString *mutablePattern = [NSMutableString string];
    [mutablePattern appendString:@"(?<=\\n|\\A)"]; // look-behind
    [mutablePattern appendString:@"\\[[0-9a-fA-F]+?\\]"]; // thread id
    [mutablePattern appendString:@"\\[([0-9]{2}[a-zA-Z]{3}[0-9]{2}\\s[0-9]{2}:[0-9]{2}:[0-9]{2}\\.[0-9]{3})\\]"]; // time
    //[mutablePattern appendString:@"(\\s(?:\\[.+?\\]))"];//log level
    [mutablePattern appendString:@"\\s(?:\\[(.+?)\\]\\s)?"];
    [mutablePattern appendString:@"(.+?)"];//event
    [mutablePattern appendString:@"\\n"];
    [mutablePattern appendString:@"(?=\\[|\\z)"];// look-ahead
    pattern = [NSString stringWithString:mutablePattern];
    
    // case sensitive
    NSString *caseSensitive = @"TRUE";
    NSString *matchLine = @"FALSE";
    
    // Regex creator
    LSRegexConfiguration *regexCreator = [[LSRegexConfiguration alloc] initWithProperty:@{kLSRegexPatternKey : pattern,
                                                                                          kLSRegexCaseKey : caseSensitive,
                                                                                          kLSRegexLineKey : matchLine,
                                                                                          kLSCaptureNodeName : @[timeCapture,
                                                                                                                 logLevelCapture,
                                                                                                                 eventCapture]}];
    
    // Regex object
    LSRegex *regex = [regexCreator createObject];
    
    //
    // load file
    //
    NSString *fileString = [NSString stringWithContentsOfFile:@"/temp/Test.log" encoding:NSUTF8StringEncoding error:nil];
    
    // match block
    MatchBlock matchBlock = ^BOOL(NSRange matchRange, NSDictionary *captures){
        
        for (LSCapture *aCapture in captures.allValues)
        {
            NSString *str = [aCapture valueString];
            NSLog(@"Capture \n%@", str);
        }
        
        NSLog(@"**********************************************");
        return YES;
    };
    
    [regex enumerateMatchInString:fileString
                          inRange:NSMakeRange(0, fileString.length)
                       matchBlock:matchBlock
                    completeBlock:nil];
}

@end
