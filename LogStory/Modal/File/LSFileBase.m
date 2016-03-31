//
//  LSFileBase.m
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSFileBase.h"
#import "LSError.h"

@implementation LSFileBase

-(instancetype)initWithURL:(NSURL *)fileURL error:(NSError *__autoreleasing *)outError;
{
    BOOL isDirectory = YES;
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileURL.path isDirectory:&isDirectory])
    {
        if (outError)
        {
            *outError = [LSError errorFromClass:self.class
                                       selector:_cmd
                                         format:@"file doesn't exist at path: %@", fileURL];
        }
        return nil;
    }
    if (isDirectory)
    {
        if (outError)
        {
            *outError = [LSError errorFromClass:self.class
                                       selector:_cmd
                                         format:@"URL %@ is a directory", fileURL];
        }
        return nil;
    }

    if (self = [super init])
    {
    }
    return self;
}

@end
