//
//  LSXMLHelper.h
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSXMLHelper : NSObject

+(nullable NSXMLElement *)firtElementWithName:(nonnull NSString *)name ofParent:(nonnull NSXMLElement *)parent;

@end
