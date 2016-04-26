//
//  LSError.h
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define RETURN_OUT_ERROR(inFormat...) \
if (outError) \
{ \
    *outError = [LSError errorFromClass:NSStringFromClass([self class]) selector:NSStringFromSelector(_cmd) format:inFormat]; \
}

@interface LSError : NSError

+(id)errorFromClass:(NSString *)className selector:(NSString *)selector format:(NSString *)format, ... NS_FORMAT_FUNCTION(3,4);

@end
