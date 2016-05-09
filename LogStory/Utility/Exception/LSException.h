//
//  LSException.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define RAISE_EXCEPTION(inFormat...) \
\
[LSException raiseFromClass:NSStringFromClass([self class]) selector:NSStringFromSelector(_cmd) format:inFormat]; \

@interface LSException : NSException

+ (void)raiseFromClass:(NSString *)className selector:(NSString *)selectorName format:(NSString *)format, ... NS_FORMAT_FUNCTION(3,4);

@end
