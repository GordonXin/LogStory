//
//  LSActionObject.h
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSConfigObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSActionObject : LSConfigObject

@property (nonatomic, readonly, copy)   NSString        *actionName;

@property (nonatomic, readonly, copy)   NSArray         *argList;

@end

NS_ASSUME_NONNULL_END