//
//  LSXMLHelper.h
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSXMLHelper : NSObject

// get node
+(NSInteger)numberOfElementWithName:(NSString *)name ofParent:(NSXMLElement *)parent;
+(NSXMLElement *)firtElementWithName:(NSString *)name ofParent:(NSXMLElement *)parent;
+(NSXMLElement *)elementWithName:(NSString *)name atIndex:(NSInteger)index ofParent:(NSXMLElement *)parent;

// get stringValue
+(NSString *)stringValueOfElementWithName:(NSString *)name atIndex:(NSInteger)index ofParent:(NSXMLElement *)parent;

@end
