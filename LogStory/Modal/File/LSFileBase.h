//
//  LSFileBase.h
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSFileBase : NSObject

-(instancetype)initWithURL:(NSURL *)fileURL;

@property (nonatomic, readwrite, copy) NSString *errorMessage;

@end
