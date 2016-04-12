//
//  LSCapture.h
//  LogStory
//
//  Created by cynthia on 4/8/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSXMLObject.h"

@class LSCaptureValue;

@interface LSCapture : LSXMLObject

-(NSDictionary<LSCaptureValue*, NSString*>*)captureValueDictionaryFromSource:(NSString*)sourceString
                                                                 matchResult:(NSTextCheckingResult*)matchResult;

@end

@interface LSCaptureValue : NSObject

@property (nonatomic, readonly, copy) NSString *name;

@property (nonatomic, readonly, copy) NSString *type;

@property (nonatomic, readonly, copy) NSString *dataValue;

@end
