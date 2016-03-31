//
//  LSLineFormatFile.h
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSConfigFile.h"


@class LSLineObject;

@interface LSLineFormatFile : LSConfigFile

@property (nonatomic, readonly, strong) LSLineObject    *lineObject;

@end
