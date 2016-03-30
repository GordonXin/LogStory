//
//  LSDataObject.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kLSDataObjectInvalidName;

@interface LSDataObject : NSObject

@property (nonatomic, readonly, copy) NSString      *objectName;

-(instancetype)initWithObjectName:(NSString *)name;

-(id)dataValueWithKey:(NSString *)key;
-(void)setDataValue:(id)dataValue toKey:(NSString *)key;

-(NSMutableString *)stringDataValueWithKey:(NSString *)key;
-(void)setStringDataValue:(NSMutableString *)stringDataValue toKey:(NSString *)key;

-(NSMutableArray *)arrayDataValueWithKey:(NSString *)key;
-(void)setArrayDataValue:(NSMutableArray *)arrayDataValue toKey:(NSString *)key;

-(NSMutableDictionary *)dictionaryDataWithKey:(NSString *)key;
-(void)setDictionaryDataValue:(NSMutableDictionary *)dictionaryDataValue toKey:(NSString *)key;

-(NSNumber *)numberDataValueWithKey:(NSString *)key;
-(void)setNumberDataValue:(NSNumber *)numberDataValue toKey:(NSString *)key;
-(NSInteger)integerDataVauleWithKey:(NSString *)key;
-(void)setIntegerDataValue:(NSInteger)integerDataValue toKey:(NSString *)key;
-(CGFloat)floatDataValueWithKey:(NSString *)key;
-(void)setFloatDataValue:(CGFloat)floatDataValue toKey:(NSString *)key;

@end
