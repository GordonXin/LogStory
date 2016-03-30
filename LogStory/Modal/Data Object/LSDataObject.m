//
//  LMDataObject.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSDataObject.h"
#import "LSException.h"

NSString * const kLSDataObjectInvalidName = @"LSDataObject.InvalidName";

@interface LSDataObject()
{
    NSMutableDictionary         *_dataDictionary;
}

@end

@implementation LSDataObject

#pragma mark -
#pragma mark        init methods
#pragma mark -

-(instancetype)init
{
    if (self = [super init])
    {
        _dataDictionary = [NSMutableDictionary dictionary];
        _objectName = kLSDataObjectInvalidName;
    }
    return self;
}

-(instancetype)initWithObjectName:(NSString *)name
{
    if (self = [super init])
    {
        _dataDictionary = [NSMutableDictionary dictionary];
        _objectName = [name copy];
    }
    return self;
}

#pragma mark -
#pragma mark        data access
#pragma mark -

-(BOOL)isValidKey:(NSString *)key
{
    return key != nil && key.length > 0;
}

-(id)dataValueWithKey:(NSString *)key
{
    if ([self isValidKey:key])
    {
        return [_dataDictionary objectForKey:key];
    }
    return nil;
}

-(void)setDataValue:(id)dataValue toKey:(NSString *)key
{
    if (![self isValidKey:key])
        return;
    
    id existedData = [_dataDictionary objectForKey:key];
    
    // if already exist a data, need to compare data types
    if (existedData)
    {
        if (![dataValue isMemberOfClass:[existedData class]])
        {
            // throw
        }
    }
    
//    if ([dataValue isKindOfClass:[NSString class]] && ![dataValue isKindOfClass:[NSMutableString class]])
//    {
//        dataValue = [NSMutableString stringWithString:(NSString *)dataValue];
//    }
//    else if ([dataValue isKindOfClass:[NSArray class]] && ![dataValue isKindOfClass:[NSMutableArray class]])
//    {
//        dataValue = [NSMutableArray arrayWithArray:(NSArray *)dataValue];
//    }
//    else if ([dataValue isKindOfClass:[NSDictionary class]] && ![dataValue isKindOfClass:[NSMutableDictionary class]])
//    {
//        dataValue = [NSMutableDictionary dictionaryWithDictionary:(NSDictionary *)dataValue];
//    }
    
    [_dataDictionary setObject:dataValue forKey:key];
}

-(NSMutableString *)stringDataValueWithKey:(NSString *)key
{
    id dataValue = [self dataValueWithKey:key];
    if ([dataValue isKindOfClass:[NSMutableString class]])
    {
        return (NSMutableString *)dataValue;
    }
    return nil;
}

-(void)setStringDataValue:(NSMutableString *)stringDataValue toKey:(NSString *)key
{
    [self setDataValue:stringDataValue toKey:key];
}

-(NSMutableArray *)arrayDataValueWithKey:(NSString *)key
{
    id dataValue = [self dataValueWithKey:key];
    if ([dataValue isKindOfClass:[NSMutableArray class]])
    {
        return dataValue;
    }
    return nil;
}

-(void)setArrayDataValue:(NSMutableArray *)arrayDataValue toKey:(NSString *)key
{
    [self setDataValue:arrayDataValue toKey:key];
}

-(NSMutableDictionary *)dictionaryDataWithKey:(NSString *)key
{
    id dataValue = [self dataValueWithKey:key];
    if ([dataValue isKindOfClass:[NSMutableDictionary class]])
    {
        return dataValue;
    }
    return nil;
}

-(void)setDictionaryDataValue:(NSMutableDictionary *)dictionaryDataValue toKey:(NSString *)key
{
    [self setDictionaryDataValue:dictionaryDataValue toKey:key];
}

-(NSNumber *)numberDataValueWithKey:(NSString *)key
{
    id dataValue = [self dataValueWithKey:key];
    if ([dataValue isKindOfClass:[NSNumber class]])
    {
        return dataValue;
    }
    return nil;
}

-(void)setNumberDataValue:(NSNumber *)numberDataValue toKey:(NSString *)key
{
    [self setDataValue:numberDataValue toKey:key];
}

-(NSInteger)integerDataVauleWithKey:(NSString *)key
{
    NSNumber *number = [self numberDataValueWithKey:key];
    if (number)
    {
        return [number integerValue];
    }
    return NSNotFound;
}

-(void)setIntegerDataValue:(NSInteger)integerDataValue toKey:(NSString *)key
{
    NSNumber *number = [NSNumber numberWithInteger:integerDataValue];
    [self setNumberDataValue:number toKey:key];
}

-(CGFloat)floatDataValueWithKey:(NSString *)key
{
    NSNumber *number = [self numberDataValueWithKey:key];
    if (number)
    {
        return [number floatValue];
    }
    return CGFLOAT_MIN;
}

-(void)setFloatDataValue:(CGFloat)floatDataValue  toKey:(NSString *)key
{
    NSNumber *number = [NSNumber numberWithFloat:floatDataValue];
    [self setNumberDataValue:number toKey:key];
}

@end
