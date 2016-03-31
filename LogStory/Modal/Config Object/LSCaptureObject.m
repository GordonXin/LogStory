//
//  LSCaptureObject.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSCaptureObject.h"
#import "LSTypeObject.h"

NSString * const kLSCaptureObject           = @"LSCapture";

NSString * const kLSCaptureObjectNameKey    = @"Name";
NSString * const kLSCaptureObjectTypeKey    = @"Type";

@implementation LSCaptureObject

+(NSString *)nodeName
{
    return kLSCaptureObject;
}

+(LSCaptureObject *)captureObjecWithName:(NSString *)name inArray:(NSArray<LSCaptureObject *>*)array
{
    if ([array count])
    {
        for (LSCaptureObject *obj in array)
        {
            if ([[obj name] isEqualToString:name])
            {
                return obj;
            }
        }
    }
    return nil;
}

-(void)checkAttributes
{
    _name = (NSString *)[self attributeWithKey:kLSCaptureObjectNameKey proposedClass:[NSString class]];
    if(![_name length])
    {
        self.errorMessage = [NSString stringWithFormat:@"Capture name is empty"];
        return;
    }
    
    _type = (NSString *)[self attributeWithKey:kLSCaptureObjectTypeKey proposedClass:[NSString class]];
    if (![_type length])
    {
        self.errorMessage = [NSString stringWithFormat:@"Capture type is empty"];
        return;
    }
    
    if ([LSTypeObject isSupportedType:_type])
    {
        self.errorMessage = [NSString stringWithFormat:@"Capture type %@ is not supported", _type];
        return;
    }
}

@end
