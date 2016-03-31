//
//  LSPair.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSPair.h"

@implementation LSPair

-(instancetype)initWithValue:(id)value forKey:(NSString *)key
{
    if (self = [super init])
    {
        _value = value;
        _key = [key copy];
    }
    return self;
}

@end
