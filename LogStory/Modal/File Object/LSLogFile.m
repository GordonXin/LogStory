//
//  LSLogFile.m
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSLogFile.h"

@implementation LSLogFile

-(instancetype)initWithURL:(NSURL *)fileURL
{
    if (self = [super init])
    {
        if (self.errorMessage.length)
        {
            return self;
        }
        
        [self readFileFromURL:fileURL];
    }
    return self;
}

-(void)readFileFromURL:(NSURL *)fileURL
{    
    NSStringEncoding encoding;
    NSError *error = nil;
    
    _fileString = [NSString stringWithContentsOfURL:fileURL usedEncoding:&encoding error:&error];
    if (!_fileString)
    {
        self.errorMessage = [NSString stringWithFormat:@"[LogFile] Read file failed. %@, reason: %@", [error localizedDescription], [error localizedFailureReason]];
        return;
    }
}

@end
