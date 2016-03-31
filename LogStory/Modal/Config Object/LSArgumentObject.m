//
//  LSArgumentObject.m
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSArgumentObject.h"
#import "LSTypeObject.h"

NSString * const kLSArgumentObject = @"LSArgument";

NSString * const kLSArgumentObjectTypeKey = @"Type";
NSString * const KLSArgumentObjectVauleKey = @"Value";

@implementation LSArgumentObject

+(NSString *)nodeName
{
    return kLSArgumentObject;
}

-(void)checkAttributes
{
    _type = (NSString *)[self attributeWithKey:kLSArgumentObjectTypeKey proposedClass:[NSString class]];
    if(![_type length])
    {
        self.errorMessage = [NSString stringWithFormat:@"Argument type is empty"];
        return;
    }
    
    if ([LSTypeObject isSupportedType:_type])
    {
        self.errorMessage = [NSString stringWithFormat:@"Argument type %@ is not supported", _type];
        return;
    }
    
    _value = (NSString *)[self attributeWithKey:KLSArgumentObjectVauleKey proposedClass:[NSString class]];
    if(![_type length])
    {
        self.errorMessage = [NSString stringWithFormat:@"Argument value is empty"];
        return;
    }
}

@end
