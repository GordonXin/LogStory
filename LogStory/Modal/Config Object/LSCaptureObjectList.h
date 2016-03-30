//
//  LSCaptureList.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSConfigObject.h"

@interface LSCaptureObjectList : LSConfigObject

@property (nonatomic, readonly, copy) NSArray *captureList;

@end

@interface LSCaptureObjectList (factoryMethod)

+(instancetype)captureListFromParentNode:(NSXMLElement *)element;

@end
