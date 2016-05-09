//
//  LSCreator.h
//  LogStory
//
//  Created by cynthia on 4/28/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSError.h"
#import "LSException.h"

@interface LSConfiguration : NSObject

/*
 * property for xml node storage
 */
@property (nonatomic, readonly, strong) NSXMLElement *xmlConfig;

/*
 * indicates whether allows changes configurations
 */
@property (nonatomic, readonly, assign) BOOL isConfigable;

/*
 * init method
 */
-(instancetype)initWithConfig:(NSXMLElement *)xmlConfig error:(LSError*__autoreleasing*)outError;

/*
 * create object method.
 * should be derived by subclasses
 */
-(id)createObject;

/*
 * create xml node.
 * should be derived by subclasses
 */
-(NSXMLElement *)createXmlNode;

/*
 * convinient method for xml reading
 */
-(NSXMLElement *) firstConfigNodeWithName:(NSString *)name;

-(NSString *)     firstConfigNodeStringValueWithName:(NSString *)name;

@end
