//
//  LSConfigObject.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSPairArray.h"
#import "LSXMLHelper.h"


@interface LSConfigObject : NSObject

+(BOOL)isValidElement:(NSXMLElement *)element;


//
//  init method
//
-(instancetype)initWithElementNode:(NSXMLElement *)element;


//
//  property
//
@property (nonatomic, readwrite, copy)      NSString     *errorMessage;
@property (nonatomic, readonly, strong)     NSXMLElement *elementSelf;

@end