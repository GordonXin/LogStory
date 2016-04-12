//
//  LSError.h
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LS_ERROR(inFormat...) \
    [LSError errorFromClass:[self class] selector:_cmd format:inFormat];

@interface LSError : NSError

+(id)errorFromClass:(Class)className selector:(SEL)selector description:(NSString *)description;
+(id)errorFromClass:(Class)className selector:(SEL)selector format:(NSString *)format, ... NS_FORMAT_FUNCTION(3,4);
+(id)errorFromClass:(Class)className selector:(SEL)selector format:(NSString *)format arguments:(va_list)argList  NS_FORMAT_FUNCTION(3,0);

@end
