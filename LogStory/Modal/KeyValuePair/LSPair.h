//
//  LSPair.h
//  LogStory
//
//  Created by cynthia on 3/30/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSPair : NSObject

@property (nonatomic, readwrite, copy)   NSString *key;

@property (nonatomic, readwrite, strong) id        value;

-(instancetype)initWithValue:(id)value andKey:(NSString *)key;

-(LSPair *)copy;

@end
