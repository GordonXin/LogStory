//
//  LSArgumentObject.h
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSConfigObject.h"

extern NSString * const kLSArgumentObject;

extern NSString * const kLSArgumentObjectTypeKey;
extern NSString * const KLSArgumentObjectVauleKey;

@interface LSArgumentObject : LSConfigObject

@property (nonatomic, readonly, copy) NSString *type;

@property (nonatomic, readonly, copy) NSString *value;

@end
