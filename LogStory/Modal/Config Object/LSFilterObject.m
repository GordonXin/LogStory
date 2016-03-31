//
//  LSFilterObject.m
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSFilterObject.h"
#import "LSActionObject.h"
#import "LSRegexObject.h"

NSString * const kLSFilterObject = @"kLSFilter";

@implementation LSFilterObject

+(NSString *)nodeName
{
    return kLSFilterObject;
}

-(void)checkAttributes
{
    _regex = [self attributeWithKey:kLSRegexObject proposedClass:[kLSRegexObject class]];
    if (!_regex)
    {
        self.errorMessage = [NSString stringWithFormat:@"[Filter] regex is empty"];
        return;
    }
    
    _actionArray = [self attributeArrayWithKey:kLSActionObject proposedClass:[LSActionObject class]];
}

@end
