//
//  LSCaptureObject.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSCaptureObject.h"

#import "LSXMLHelper.h"
#import "LSError.h"

NSString * const kLSCaptureObject           = @"LSCapture";

NSString * const kLSCaptureObjectNameKey    = @"Name";
NSString * const kLSCaptureObjectTypeKey    = @"Type";

@implementation LSCaptureObject

+(NSString *)nodeName
{
    return kLSCaptureObject;
}

static NSArray *_captureTypeList = nil;
+(NSArray *)captureTypeList
{
    if (_captureTypeList == nil)
    {
        _captureTypeList = @[
                             @"Integer",
                             @"String",
                             @"Float",
                             ];
    }
    return _captureTypeList;
}

+(BOOL)islegalCaptureType:(NSString *)type
{
    NSArray *legalTypes = [self captureTypeList];
    
    if ([legalTypes containsObject:type])
    {
        return YES;
    }
    return NO;
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
    
    if ([LSCaptureObject islegalCaptureType:_type])
    {
        self.errorMessage = [NSString stringWithFormat:@"Capture type is not supported"];
        return;
    }
}

@end
