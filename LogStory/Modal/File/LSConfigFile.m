//
//  LSConfigFile.m
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSConfigFile.h"
#import "LSException.h"

@implementation LSConfigFile

-(instancetype)initWithURL:(NSURL *)fileURL error:(NSError *__autoreleasing *)outError
{
    if (self = [super initWithURL:fileURL error:outError])
    {
        _documentNode = [[NSXMLDocument alloc] initWithContentsOfURL:fileURL
                                                             options:NSXMLDocumentTidyXML
                                                               error:outError];
        
        if (!_documentNode)
        {
            return nil;
        }
    }
    return self;
}

@end
