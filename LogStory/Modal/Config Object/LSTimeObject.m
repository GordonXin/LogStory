//
//  LSTimeObject.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSTimeObject.h"

NSString * const kLSTimeObject = @"LSTime";

NSString * const kLSTimeObjectFormatKey = @"Format";

@implementation LSTimeObject

+(NSString *)nodeName
{
    return kLSTimeObject;
}

-(void)checkAttributes
{
    _format = [self attributeWithKey:kLSTimeObjectFormatKey proposedClass:[NSString class]];
    if (![_format length])
    {
        self.errorMessage = [NSString stringWithFormat:@"Time format is empty"];
        return;
    }
}

@end
