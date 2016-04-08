//
//  LSWorkObject.h
//  LogStory
//
//  Created by cynthia on 4/5/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSLogFile;
@class LSEventFormatFile;

@interface LSWorkObject : NSObject

@property (nonatomic, readwrite, strong) LSEventFormatFile *format;

-(void)startWorkOnString:(NSString *)fileString;

@end
