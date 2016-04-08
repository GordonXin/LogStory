//
//  LSFunctionManager.h
//  LogStory
//
//  Created by cynthia on 4/5/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSFunctionManager : NSObject

+(LSFunctionManager *)sharedManager;

+(void)performFunctionWithName:(NSString *)functionName argumentList:(NSArray *)argumentList;

@end
