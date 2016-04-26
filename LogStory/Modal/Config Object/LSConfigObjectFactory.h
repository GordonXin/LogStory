//
//  LSConfigObjectFactory.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSPair.h"

@interface LSConfigObjectFactory : NSObject

+(LSPair *)configObjectWithElement:(NSXMLElement *)element;

@end
