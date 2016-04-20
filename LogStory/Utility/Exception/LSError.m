//
//  LSError.m
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSError.h"
#import "LSLog.h"

NSString * const kLSErrorDomain         = @"LogStory.Error.Domain";


NSInteger        kLSErrorCodeDefaut     = 100;

NSString * const kLSErrorClassKey       = @"className";
NSString * const kLSErrorSelectorKey    = @"selector";

@implementation LSError

+(id)errorFromClass:(NSString *)className selector:(NSString *)selector description:(NSString *)description
{
    NSDictionary *userInfo = @{
                               kLSErrorClassKey             : className,
                               kLSErrorSelectorKey          : selector,
                               NSLocalizedDescriptionKey    : description,
                               };
    
    [LSLog logErrorWithClassName:className selector:selector messageFormat:@"Return Error because: %@", description];
    
    return [[LSError alloc] initWithDomain:kLSErrorDomain
                                      code:kLSErrorCodeDefaut
                                  userInfo:userInfo];
}

+(id)errorFromClass:(NSString *)className selector:(NSString *)selector format:(NSString *)format, ...
{
    va_list ap;
    va_start(ap, format);
    NSString *description = [[NSString alloc] initWithFormat:format arguments:ap];
    va_end(ap);
    
    return [LSError errorFromClass:className
                          selector:selector
                       description:description];
}

@end
