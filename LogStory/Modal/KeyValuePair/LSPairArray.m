//
//  LSKeyValuePairArray.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSPair.h"
#import "LSPairArray.h"

@interface LSPairArray ()
{
    NSMutableArray *_pairArray;
}

@end

@implementation LSPairArray

#pragma mark -
#pragma mark        creatation
#pragma mark -

+(instancetype)pairArray
{
    return [[LSPairArray alloc] init];
}

+(instancetype)pairArrayWithPairArray:(LSPairArray *)pairArray
{
    return [[LSPairArray alloc] initWithPairArray:pairArray];
}

+(instancetype)pairArrayWithPairObjects:(NSArray<LSPair *> *)array
{
    return [[LSPairArray alloc] initWithPairObjects:array];
}

-(instancetype)init
{
    if (self = [super init])
    {
        _pairArray = [NSMutableArray array];
    }
    return self;
}

-(instancetype)initWithPairArray:(LSPairArray *)pairArray
{
    return [pairArray copy];
}

-(instancetype)initWithPairObjects:(NSArray<LSPair *> *)array
{
    if (self = [super init])
    {
        _pairArray = [array copy];
    }
    return self;
}

-(LSPairArray *)copy
{
    return [[LSPairArray alloc] initWithPairObjects:_pairArray];
}


#pragma mark -
#pragma mark        data access
#pragma mark -

-(NSArray <LSPair *> *)pairsForKey:(NSString *)key
{
    NSMutableArray *array = [NSMutableArray array];
    
    for (LSPair *pair in _pairArray)
    {
        if ([pair.key isEqualToString:key])
        {
            [array addObject:pair];
        }
    }
    
    return [NSArray arrayWithArray:array];
}

-(NSArray <id> *)valuesForKey:(NSString *)key
{
    NSMutableArray *array = [NSMutableArray array];
    
    for (LSPair *pair in _pairArray)
    {
        if ([pair.key isEqualToString:key])
        {
            [array addObject:pair.value];
        }
    }
    
    return [NSArray arrayWithArray:array];
}

-(id)firstValueForKey:(NSString *)key
{
    for (LSPair *pair in _pairArray)
    {
        if ([pair.key isEqualToString:key])
        {
            return pair.value;
        }
    }
    return nil;
}

-(LSPair *)pairAtIndex:(NSUInteger)index
{
    if (index < _pairArray.count)
    {
        return [_pairArray objectAtIndex:index];
    }
    return nil;
}

-(NSUInteger)count
{
    return [_pairArray count];
}

-(void)addPair:(LSPair *)pair
{
    if (![_pairArray containsObject:pair])
    {
        [_pairArray addObject:pair];
    }
}

-(void)removePair:(LSPair *)pair
{
    if ([_pairArray containsObject:pair])
    {
        [_pairArray removeObject:pair];
    }
}

-(NSArray <NSString *> *)allKeys
{
    NSMutableArray *array = [NSMutableArray array];
    
    for (LSPair *pair in _pairArray)
    {
        if (![array containsObject:pair.key])
        {
            [array addObject:pair.key];
        }
    }
    
    return [NSArray arrayWithArray:array];
}

-(NSArray <id> *)allValues
{
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (LSPair *pair in _pairArray)
    {
        [array addObject:pair.value];
    }
    
    return [NSArray arrayWithArray:array];
}

@end
