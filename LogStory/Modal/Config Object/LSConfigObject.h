//
//  LSConfigObject.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSPairArray.h"

@interface LSConfigObject : NSObject
{
@protected
    LSPairArray  *_attributes;
    NSXMLElement *_xmlNode;
}

+(NSString *)xmlNodeName;

-(instancetype)init;

-(instancetype)initWithElementNode:(NSXMLElement *)element
                             error:(NSError *__autoreleasing *)outError;

-(NSXMLElement *)generateXMLNode;

-(void)updateAttribute:(id)newValue forKey:(NSString *)key;

@end