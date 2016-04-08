//
//  LSLineFormatFile.m
//  LogStory
//
//  Created by cynthia on 3/31/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSEventFormatFile.h"
#import "LSEventObject.h"

@implementation LSEventFormatFile

-(instancetype)initWithURL:(NSURL *)fileURL
{
    if (self = [super initWithURL:fileURL])
    {
        if (self.errorMessage.length)
        {
            return self;
        }
        
        [self readNodesFromRoot:(NSXMLElement *)self.documentNode.rootDocument];
    }
    return self;
}

-(void)readNodesFromRoot:(NSXMLElement *)root
{
    _event = [[LSEventObject alloc] initWithElementNode:root];
    if (_event.errorMessage.length)
    {
        self.errorMessage = [NSString stringWithFormat:@"[EventFile] Can't load event nodes because: %@", _event.errorMessage];
        return;
    }
}

@end
