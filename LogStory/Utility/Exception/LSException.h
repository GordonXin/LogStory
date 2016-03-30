//
//  LSException.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SELF_OBJ_NAME NSStringFromClass([self class])

@interface LSException : NSException

+ (void)raise:(NSString *)name format:(NSString *)format, ... NS_FORMAT_FUNCTION(2,3);
+ (void)raise:(NSString *)name format:(NSString *)format arguments:(va_list)argList NS_FORMAT_FUNCTION(2,0);

@end
