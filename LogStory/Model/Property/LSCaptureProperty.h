//
//  LSCaptureProperty.h
//  LogStory
//
//  Created by cynthia on 4/25/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSProperty.h"

@interface LSCaptureProperty : LSProperty

+(NSString *)xmlNodeName;

@property (nonatomic, readwrite, copy) NSString *name;
@property (nonatomic, readwrite, copy) NSString *type;

@end
