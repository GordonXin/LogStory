//
//  LSTimeObject.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSConfigObject.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString * const kLSTimeObject;

@interface LSTimeObject : LSConfigObject

@property (nonatomic, readonly, copy) NSString      *formatString;

@end

NS_ASSUME_NONNULL_END
