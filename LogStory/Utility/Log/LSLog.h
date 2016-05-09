//
//  LSLog.h
//  LogStory
//
//  Created by cynthia on 4/20/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LOGERR(inFormat...) \
[LSLog logErrorWithClassName:NSStringFromClass([self class]) selector:NSStringFromSelector(_cmd) messageFormat:inFormat];

#define LOG(inFormat...) \
[LSLog logInfoWithClassName: NSStringFromClass([self class]) selector:NSStringFromSelector(_cmd) messageFormat:inFormat];

@interface LSLog : NSObject

+(void)logErrorWithClassName:(NSString *)className selector:(NSString *)selectorName messageFormat:(NSString *)format, ...NS_FORMAT_FUNCTION(3,4);
+(void)logWarnWithClassName:(NSString *)className selector:(NSString *)selectorName messageFormat:(NSString *)format, ...NS_FORMAT_FUNCTION(3,4);
+(void)logInfoWithClassName:(NSString *)className selector:(NSString *)selectorName messageFormat:(NSString *)format, ...NS_FORMAT_FUNCTION(3,4);

@end

