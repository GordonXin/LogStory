//
//  LSTimeObject.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSTimeObject.h"

#import "LSError.h"
#import "LSXMLHelper.h"

NSString * const kLSTimeObject = @"LSTime";

NSString * const kFormatKey = @"Format";

@implementation LSTimeObject

-(instancetype)initWithElementNode:(NSXMLElement *)element error:(NSError *__autoreleasing *)outError
{
    if (self = [super init])
    {
        if (![self readNode:element error:outError])
        {
            return nil;
        }
    }
    return self;
}

-(BOOL)readNode:(NSXMLElement *)element error:(NSError * __autoreleasing *)outError
{
    // check
    if (![element.name isEqualToString:kLSTimeObject])
    {
        if (outError)
        {
            *outError = [LSError errorFromClass:self.class
                                       selector:_cmd
                                         format:@"Initialization failed, because input element with wrong name:%@", element.name];
        }
        return NO;
    }
    
    // read <Expression></Expression>
    NSXMLElement *formatNode = [LSXMLHelper firtElementWithName:kFormatKey ofParent:element];
    if (!formatNode)
    {
        if (outError)
        {
            *outError = [LSError errorFromClass:self.class
                                       selector:_cmd
                                         format:@"Initialization failed, because can't find %@ element in input element:%@", kFormatKey, element.name];
        }
        return NO;
    }
    _formatString = [formatNode stringValue];
    if (![_formatString length])
    {
        if (outError)
        {
            *outError = [LSError errorFromClass:self.class
                                       selector:_cmd
                                         format:@"Initialization failed, because %@ value is empty", kFormatKey];
        }
        return NO;
    }

    return YES;
}

@end
