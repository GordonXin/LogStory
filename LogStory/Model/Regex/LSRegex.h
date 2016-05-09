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
typedef BOOL(^ErrorBlock)(NSError *error);

@interface LSRegex : LSBaseObject

-(NSDictionary *)firstMatchInString:(__weak NSString *)inString
                            inRange:(NSRange)inRange
                         errorBlock:(ErrorBlock)errorBlock;

-(void)enumerateMatchInString:(__weak NSString *)inString
                      inRange:(NSRange)inRange
                   matchBlock:(MatchBlock)matchBlock
                completeBlock:(CompleteBlock)completeBlock
                   errorBlock:(ErrorBlock)errorBlock;

@end
