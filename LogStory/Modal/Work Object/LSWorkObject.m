//
//  LSWorkObject.m
//  LogStory
//
//  Created by cynthia on 4/5/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSWorkObject.h"
#import "LSEventFormatFile.h"
#import "LSEventObject.h"
#import "LSRegexObject.h"

@implementation LSWorkObject

-(void)startWorkOnString:(NSString *)fileString
{
    LSRegexObject *obj = _format.event.regexObj;
    
    NSRegularExpression *regex = obj.regex;
    
    [regex enumerateMatchesInString:fileString
                            options:0
                              range:NSMakeRange(0, fileString.length)
                         usingBlock:^(NSTextCheckingResult * result, NSMatchingFlags flags, BOOL *stop)
     {
         int ab = 0;
         
         if (ab)
         {
         
         }
     }];
}

@end
