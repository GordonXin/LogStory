//
//  LSTypeObject.m
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSTypeObject.h"

@implementation LSTypeObject

static NSArray *_supportedTypes = nil;
+(NSArray<NSString *> *)supportedTypes
{
    if (_supportedTypes == nil)
    {
        _supportedTypes = @[
                            @"Integer",
                            @"String",
                            @"Float",
                            @"Capture",
                            ];
    }
    return _supportedTypes;
}

+(BOOL)isSupportedType:(NSString *)type
{
    NSArray *legalTypes = [self supportedTypes];
    
    if ([legalTypes containsObject:type])
    {
        return YES;
    }
    return NO;
}

@end
