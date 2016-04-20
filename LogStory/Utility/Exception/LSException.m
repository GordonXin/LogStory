//
//  LSException.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSException.h"
#import "LSLog.h"

@implementation LSException

+ (void)raiseFromClass:(NSString *)className selector:(NSString *)selectorName format:(NSString *)format, ...
{
    va_list ap;
    va_start(ap, format);
    NSString *reason = [[NSString alloc] initWithFormat:format arguments:ap];
    [LSLog logErrorWithClassName:className selector:selectorName messageFormat:@"Raise exception because: %@", reason];
    
    LSException *exp = [[LSException alloc] initWithName:@"LSExcpetion"
                                                  reason:reason
                                                userInfo:nil];
    va_end(ap);
    
    [exp raise];
}

@end
