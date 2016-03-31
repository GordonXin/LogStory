//
//  LSError.m
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSError.h"

NSString * const kLSErrorDomain         = @"LogStory.Error.Domain";


NSInteger        kLSErrorCodeDefaut     = 100;

NSString * const kLSErrorClassKey       = @"className";
NSString * const kLSErrorSelectorKey    = @"selector";

@implementation LSError

+(id)errorFromClass:(Class)className selector:(SEL)selector description:(NSString *)description
{
    NSDictionary *userInfo = @{
                               kLSErrorClassKey             : NSStringFromClass(className),
                               kLSErrorSelectorKey          : NSStringFromSelector(selector),
                               NSLocalizedDescriptionKey    : description,
                               };
    
    return [[LSError alloc] initWithDomain:kLSErrorDomain
                                      code:kLSErrorCodeDefaut
                                  userInfo:userInfo];
}

+(id)errorFromClass:(Class)className selector:(SEL)selector format:(NSString *)format, ...
{
    va_list ap;
    va_start(ap, format);
    NSString *description = [[NSString alloc] initWithFormat:format arguments:ap];
    va_end(ap);
    
    return [LSError errorFromClass:className
                          selector:selector
                       description:description];
}

+(id)errorFromClass:(Class)className selector:(SEL)selector format:(NSString *)format arguments:(va_list)argList
{
    NSString *description = [[NSString alloc] initWithFormat:format arguments:argList];
    
    return [LSError errorFromClass:className
                          selector:selector
                       description:description];
}

@end
