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

NSString * const kLSCaptureObject       = @"LSCapture";
NSString * const kLSCaptureObjectList   = @"LSCaptureList";

static NSString * const kNameNodeKey    = @"Name";
static NSString * const kTypeNodeKey    = @"Type";

@implementation LSCaptureObject

-(instancetype)initWithElementNode:(NSXMLElement *)element error:(NSError * __autoreleasing *)outError
{
    if (self = [super initWithElementNode:element error:outError])
    {
        if (![self readElement:element error:outError])
        {
            return nil;
        }
    }
    return self;
}

-(BOOL)readElement:(NSXMLElement *)element error:(NSError * __autoreleasing *)outError
{
    // check
    if (![element.name isEqualToString:kLSCaptureObject])
    {
        if (outError)
        {
            *outError = [LSError errorFromClass:self.class
                                       selector:_cmd
                                         format:@"Initialization failed, because input element with wrong name:%@", element.name];
        }
        return NO;
    }
    
    // read <Name></Name>
    NSXMLElement *nameNode = [LSXMLHelper firtElementWithName:kNameNodeKey ofParent:element];
    if (!nameNode)
    {
        if (outError)
        {
            *outError = [LSError errorFromClass:self.class
                                       selector:_cmd
                                         format:@"Initialization failed, because can't find %@ element in input element:%@", kNameNodeKey, element.name];
        }
        return NO;
    }
    _name = [nameNode stringValue];
    if (![_name length])
    {
        if (outError)
        {
            *outError = [LSError errorFromClass:self.class
                                       selector:_cmd
                                         format:@"Initialization failed, because %@ value is empty", kNameNodeKey];
        }
        return NO;
    }
    
    // read <Type></Type>
    NSXMLElement *typeNode = [LSXMLHelper firtElementWithName:kTypeNodeKey ofParent:element];
    if (!typeNode)
    {
        if (outError)
        {
            *outError = [LSError errorFromClass:self.class
                                       selector:_cmd
                                         format:@"Initialization failed, because can't find %@ element in input element:%@", kNameNodeKey, element.name];
        }
        return NO;
    }
    _type = [typeNode stringValue];
    if (![_type length])
    {
        if (outError)
        {
            *outError = [LSError errorFromClass:self.class
                                       selector:_cmd
                                         format:@"Initialization failed, because %@ value is empty", kNameNodeKey];
        }
        return NO;
    }
    if (![LSCaptureType isleagalCaptureType:_type])
    {
        if (outError)
        {
            *outError = [LSError errorFromClass:self.class
                                       selector:_cmd
                                         format:@"Initialization failed, because %@ is not leagal capture type", _type];
        }
        return NO;
    }
    
    return YES;
}

@end

@implementation LSCaptureObjectList

-(instancetype)initWithElementNode:(NSXMLElement *)element error:(NSError * __autoreleasing *)outError
{
    if (self = [super initWithElementNode:element error:outError])
    {
        _captureObjects = [self readElement:element error:outError];
        if (!_captureObjects)
        {
            return nil;
        }
    }
    return self;
}

-(NSArray *)readElement:(NSXMLElement *)element error:(NSError * __autoreleasing *)outError
{
    // check
    if (![element.name isEqualToString:kLSCaptureObjectList])
    {
        if (outError)
        {
            *outError = [LSError errorFromClass:self.class
                                       selector:_cmd
                                         format:@"Initialization failed, because input element with wrong name:%@", element.name];
        }
        return nil;
    }
    
    NSMutableArray *array = [NSMutableArray array];
    NSArray *nodeList = [element elementsForName:kLSCaptureObject];
    
    if ([nodeList count])
    {
        for (NSXMLElement *child in nodeList)
        {
            if (!child) continue;
            if (![child.name isEqualToString:kLSCaptureObject]) continue;
            
            LSCaptureObject *obj = [[LSCaptureObject alloc]initWithElementNode:child error:outError];
            if (!obj)
            {
                return nil;
            }
            [array addObject:obj];
        }
    }
    
    return [NSArray arrayWithArray:array];
}

@end


@implementation LSCaptureType

static NSArray *_captureTypeList = nil;
+(NSArray *)leagalCaptureType
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

+(BOOL)isleagalCaptureType:(NSString *)type
{
    NSArray *leagalTypes = [self leagalCaptureType];
    
    if ([leagalTypes containsObject:type])
    {
        return YES;
    }
    return NO;
}

@end