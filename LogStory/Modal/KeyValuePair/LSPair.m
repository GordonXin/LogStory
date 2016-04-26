//
//  LSPair.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSPair.h"

@implementation LSPair

-(instancetype)initWithValue:(id)value andKey:(NSString *)key
{
    if (self = [super init])
    {
        self.value = value;
        self.key = key;
    }
    return self;
}

-(LSPair *)copy
{
    return [[LSPair alloc] initWithValue:self.value andKey:self.key];
}

@end
