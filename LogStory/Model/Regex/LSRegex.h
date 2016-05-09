//
//  LSRegex.h
//  LogStory
//
//  Created by cynthia on 4/25/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSBaseObject.h"

typedef BOOL(^ProgressBlock)(NSInteger line);
typedef BOOL(^MatchBlock)(NSRange matchRange, NSDictionary *captures);
typedef void(^CompleteBlock)();

@interface LSRegex : LSBaseObject

-(void)enumerateMatchInString:(__weak NSString *)inString
                      inRange:(NSRange)inRange
                   matchBlock:(MatchBlock)matchBlock
                completeBlock:(CompleteBlock)completeBlock;

@end
