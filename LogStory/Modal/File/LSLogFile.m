//
//  LSLogFile.m
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSLogFile.h"
#import "LSError.h"

@implementation LSLogFile

-(instancetype)initWithURL:(NSURL *)fileURL error:(NSError *__autoreleasing *)outError
{
    if (self = [super init])
    {
        if (![self readFileFromURL:fileURL error:outError])
        {
            return nil;
        }
    }
    return self;
}

-(BOOL)readFileFromURL:(NSURL *)fileURL error:(NSError *__autoreleasing *)outError
{    
    NSStringEncoding encoding;
    _fileString = [NSString stringWithContentsOfURL:fileURL usedEncoding:&encoding error:outError];
    if (!_fileString)
    {
        return NO;
    }
    
    return YES;
}

@end
