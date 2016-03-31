//
//  LSFileBase.m
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSFileBase.h"

@implementation LSFileBase

-(instancetype)initWithURL:(NSURL *)fileURL
{
    if (self = [super init])
    {
        _errorMessage = @"";
        
        BOOL isDirectory = YES;
        if (![[NSFileManager defaultManager] fileExistsAtPath:fileURL.path isDirectory:&isDirectory])
        {
            _errorMessage = [NSString stringWithFormat:@"[FileBase] file doesn't exist at path: %@", fileURL];
            return self;
        }
        if (isDirectory)
        {
            _errorMessage = [NSString stringWithFormat:@"URL %@ is a directory", fileURL];
            return self;
        }
    }
    return self;
}

@end
