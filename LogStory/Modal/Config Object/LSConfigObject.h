//
//  LSConfigObject.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSConfigObject : NSObject

#pragma mark -
#pragma mark        XML loading
#pragma mark -

-(instancetype)initWithElementNode:(NSXMLElement *)elementNode;

#pragma mark -
#pragma mark        XML writing
#pragma mark -

-(instancetype)initWithAttributes:(NSDictionary *)attributes;

-(NSXMLElement *)element;

@end
