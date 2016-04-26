//
//  LSProperty.h
//  LogStory
//
//  Created by cynthia on 4/25/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSProperty : NSObject
{
    @protected
    NSXMLElement *_xmlNode;
}

-(instancetype)initWithElementNode:(NSXMLElement *)element
                             error:(NSError *__autoreleasing *)outError;

-(NSXMLElement *)xmlNdoe;

@end
