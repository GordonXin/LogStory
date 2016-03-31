//
//  LSConfigObject.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSPairArray;

@interface LSConfigObject : NSObject

-(instancetype)initWithElementNode:(NSXMLElement *)element error:(NSError *__autoreleasing *)outError;

-(instancetype)initWithAttributes:(LSPairArray *)attributes;

@property (nonatomic, readonly, strong) LSPairArray *attributes;

-(NSXMLElement *)element;

@end




@interface LSConfigObjectList : LSConfigObject

-(instancetype)initWithObjectList:(LSPairArray *)attributes array:(NSMutableArray *)objectList;

@property (nonatomic, readonly, strong) NSMutableArray *objectList;

-(NSString *)subElementName;

@end

