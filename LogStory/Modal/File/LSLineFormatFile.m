//
//  LSLineFormatFile.m
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSLineFormatFile.h"
#import "LSError.h"
#import "LSLineObject.h"

@implementation LSLineFormatFile

-(instancetype)initWithURL:(NSURL *)fileURL error:(NSError *__autoreleasing *)outError
{
    if (self = [super initWithURL:fileURL error:outError])
    {
        NSXMLElement *rootNode = self.documentNode.rootElement;
        
        _lineObject = [[LSLineObject alloc] initWithElementNode:rootNode error:outError];
        if (!_lineObject)
        {
            return nil;
        }
    }
    return self;
}

@end
