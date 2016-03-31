//
//  LSLineObject.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSConfigObject.h"

@class LSRegexObject;
@class LSTimeObject;

NS_ASSUME_NONNULL_BEGIN

extern NSString * const kLSLineObject;

@interface LSLineObject : LSConfigObject

@property (nonatomic, readonly, strong)     LSRegexObject       *regexObject;

@property (nonatomic, readonly, strong)     LSTimeObject        *timeObject;

@end

NS_ASSUME_NONNULL_END
