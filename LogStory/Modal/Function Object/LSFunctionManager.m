//
//  LSFunctionManager.m
//  LogStory
//
//  Created by cynthia on 4/5/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSFunctionManager.h"

@interface LSFunctionManager ()
{
    NSArray *_functionList;
}

@end

@implementation LSFunctionManager

static LSFunctionManager *_sharedManager = nil;
+(LSFunctionManager *)sharedManager
{
    if (_sharedManager == nil)
    {
        _sharedManager = [[LSFunctionManager alloc] init];
    }
    return _sharedManager;
}

+(void)performFunctionWithName:(NSString *)functionName argumentList:(NSArray *)argumentList
{

}

@end
