//
//  LSConfigFile.m
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSConfigFile.h"

@implementation LSConfigFile

-(instancetype)initWithURL:(NSURL *)fileURL
{
    if (self = [super initWithURL:fileURL])
    {
        if (self.errorMessage.length)
        {
            return self;
        }
        
        NSError *error = nil;
        _documentNode = [[NSXMLDocument alloc] initWithContentsOfURL:fileURL
                                                             options:NSXMLDocumentTidyXML
                                                               error:&error];
        
        if (!_documentNode)
        {
            self.errorMessage = [NSString stringWithFormat:@"[ConfigFile] Read file failed. %@ reason: %@", [error localizedDescription], [error localizedFailureReason]];
            return self;
        }
    }
    return self;
}

@end
