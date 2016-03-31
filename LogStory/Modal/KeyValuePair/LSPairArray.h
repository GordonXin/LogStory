//
//  LSKeyValuePairArray.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSPair.h"

@interface LSPairArray : NSObject

#pragma mark -
#pragma mark        creatation 
#pragma mark -

+(instancetype)pairArray;
+(instancetype)pairArrayWithPairArray:(LSPairArray *)pairArray;
+(instancetype)pairArrayWithPairObjects:(NSArray<LSPair *> *)array;

-(instancetype)init;
-(instancetype)initWithPairArray:(LSPairArray *)pairArray;
-(instancetype)initWithPairObjects:(NSArray<LSPair *> *)array;

-(LSPairArray *)copy;


#pragma mark -
#pragma mark        data access
#pragma mark -

-(NSArray<LSPair *> *)pairsForKey:(NSString *)key;
-(NSArray<id> *)valuesForKey:(NSString *)key;
-(id)firstValueForKey:(NSString *)key;
-(LSPair *)pairAtIndex:(NSUInteger)index;
-(NSUInteger)count;

-(void)addPair:(LSPair *)pair;
-(void)removePair:(LSPair *)pair;

-(NSArray<NSString *> *)allKeys;
-(NSArray<id> *)allValues;

@end
