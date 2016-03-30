//
//  LSCaptureObject.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSConfigObject.h"

@interface LSCaptureObject : LSConfigObject

@property (nonatomic, readonly, copy) NSString *objectName;

@property (nonatomic, readonly, copy) NSString *ObjectType;

@end

@interface LSCaptureObject (factoryMethod)

+(id)captureObjectWithElement:(NSXMLElement *)element;

+(NSArray *)captureObjectArrayWithParentElement:(NSXMLElement *)element;

@end
