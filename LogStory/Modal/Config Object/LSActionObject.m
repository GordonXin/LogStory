//
//  LSActionObject.m
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSActionObject.h"
#import "LSArgumentObject.h"

NSString * const kLSActionObject = @"LSAction";

NSString * const kLSActionObjectFunctionkey = @"Function";

@implementation LSActionObject

+(NSString *)nodeName
{
    return kLSActionObject;
}

-(void)checkAttributes
{
    _function = [self attributeWithKey:kLSActionObjectFunctionkey proposedClass:[NSString class]];
    if (![_function length])
    {
        self.errorMessage = [NSString stringWithFormat:@"[LSAction] function is empty"];
        return;
    }
    
    _argList = [self attributeArrayWithKey:kLSArgumentObject proposedClass:[LSArgumentObject class]];
}

@end
