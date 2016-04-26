//
//  LSCaptureObject.m
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSCaptureObject.h"
#import "LSError.h"

NSString * const kLSCaptureObject       = @"LSCapture";
NSString * const kLSCaptureObjectList   = @"LSCaptureList";

static NSString * const kNameNodeKey    = @"Name";
static NSString * const kTypeNodeKey    = @"Type";

@implementation LSCaptureObject

+(NSString *)xmlNodeName
{
    return @"LSCapture";
}

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
    NSString *nameString = [_attributes valueForKey:kNameNodeKey];
    if ([nameString length])
    {
        self.name = nameString;
    }
    else
    {
        RETURN_OUT_ERROR(@"Initialization failed, because '%@' node is empty", kNameNodeKey);
        return NO;
    }
    
    NSString *typeString = [_attributes valueForKey:kTypeNodeKey];
    if ([typeString length])
    {
        self.type = typeString;
    }
    else
    {
        RETURN_OUT_ERROR(@"Initialization failed, because '%@' node is empty", kNameNodeKey);
        return NO;
    }
    
    if (![LSCaptureType isleagalCaptureType:self.type])
    {
        RETURN_OUT_ERROR(@"Initialization failed, because %@ is not leagal capture type", self.type);
        return NO;
    }
    
    return YES;
}

-(void)setName:(NSString *)name
{
    if ([name length])
    {
        _name = [name copy];
        
        [self updateAttribute:self.name forKey:kNameNodeKey];
    }
}

-(void)setType:(NSString *)type
{
    if ([type length])
    {
        _type = [type copy];
        
        [self updateAttribute:self.type forKey:kTypeNodeKey];
    }
}

@end


@interface LSCaptureObjectList()

@property (nonatomic, readwrite, strong) NSMutableArray<LSCaptureObject *> *captureList;

@end


@implementation LSCaptureObjectList

+(NSString *)xmlNodeName
{
    return @"LSCaptureList";
}

-(instancetype)init
{
    if (self = [super init])
    {
        _captureList = [NSMutableArray array];
    }
    return self;
}

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
    NSArray *captures = [_attributes valuesForKey:[LSCaptureObject xmlNodeName]];
    if ([captures count])
    {
        _captureList = [NSMutableArray arrayWithArray:captures];
    }
    
    return YES;
}

-(NSInteger)count
{
    return [_captureList count];
}

-(LSCaptureObject *)captureObjectAtIndex:(NSInteger)index
{
    if (index >= 0 && index < self.count)
    {
        return [_captureList objectAtIndex:index];
    }
    return nil;
}

-(void)addCaptureObject:(LSCaptureObject *)captureObj
{
    [_captureList addObject:captureObj];
    
    [_attributes addPair:[[LSPair alloc] initWithValue:<#(id)#> andKey:<#(NSString *)#>]]
}

-(void)removeCaptureObject:(LSCaptureObject *)captureObj
{
    if (captureObj)
    {
        [_captureList removeObject:captureObj];
    }
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