//
//  LSXMLObject.h
//  LogStory
//
//  Created by cynthia on 4/8/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSXMLHelper.h"
#import "LSError.h"

#define THROW_ERROR(inFormat...) \
    if (outError) \
    { \
        *outError = LS_ERROR(inFormat) \
    } \

@interface LSXMLObject : NSObject

@property (nonatomic, readonly, strong) NSXMLElement *xmlNode;

-(instancetype)initFromXMLNode:(NSXMLElement *)xmlNode error:(NSError *__autoreleasing*)outError;

@end
