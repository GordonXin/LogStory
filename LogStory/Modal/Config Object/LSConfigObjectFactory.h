//
//  LSConfigObjectFactory.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSConfigObjectFactory : NSObject

+(id)configObjectWithElement:(NSXMLElement *)element;

@end
