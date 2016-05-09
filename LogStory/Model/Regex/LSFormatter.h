//
//  LSFormatter.h
//  LogStory
//
//  Created by cynthia on 4/29/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSBaseObject.h"
#import "LSRegex.h"

@interface LSFormatter : LSBaseObject

@property (nonatomic, readwrite, copy) NSString *name;

@property (nonatomic, readonly, strong) NSDateFormatter *timeFormat;

-(void)enumerateEventInString:(__weak NSString *)inString
                      inRange:(NSRange)inRange
                   matchBlock:(MatchBlock)matchBlock
                completeBlock:(CompleteBlock)completeBlock;

@end

@interface LSFormatterManager : NSObject

@property (nonatomic, readonly, copy) NSArray *formatterArray;

@property (nonatomic, readonly, copy) NSDictionary *formatterDictionary;

+(LSFormatterManager *)defaultManager;

-(LSFormatter *)formatterWithName:(NSString *)name;

@end
