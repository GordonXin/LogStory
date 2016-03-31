//
//  LSConfigObject.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSPairArray.h"


@interface LSConfigObject : NSObject

//
//  factory method
//
+(id)configObjectWithElement:(NSXMLElement *)element;

//
//  init method
//

-(instancetype)initWithElementNode:(NSXMLElement *)element;


//
//  property
//
@property (nonatomic, readonly,  copy)      NSString     *configName;
@property (nonatomic, readwrite, copy)      NSString     *errorMessage;


-(void)checkAttributes;
-(id)attributeWithKey:(NSString *)key proposedClass:(Class)className;
-(NSArray *)attributeArrayWithKey:(NSString *)key proposedClass:(Class)className;

@end