//
//  LSRegex.h
//  LogStory
//
//  Created by cynthia on 4/25/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSRegexProperty;

@interface LSRegex : NSObject

-(instancetype)initWithProperty:(LSRegexProperty *)property error:(NSError * __autoreleasing *)outError;

-(NSDictionary *)performRegexOnString:(NSString *)source range:(NSRange)range;

@end
