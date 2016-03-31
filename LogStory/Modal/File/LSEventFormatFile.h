//
//  LSLineFormatFile.h
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSConfigFile.h"


@class LSEventObject;

@interface LSLineFormatFile : LSConfigFile

@property (nonatomic, readonly, strong) LSEventObject    *event;

@end
