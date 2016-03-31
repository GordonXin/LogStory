//
//  LSActionObject.h
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSConfigObject.h"

@class LSArgumentObject;

extern NSString * const kLSActionObject;

extern NSString * const kLSActionObjectFunctionkey;


@interface LSActionObject : LSConfigObject

@property (nonatomic, readonly, copy)   NSString                    *function;

@property (nonatomic, readonly, copy)   NSArray<LSArgumentObject *> *argList;

@end
