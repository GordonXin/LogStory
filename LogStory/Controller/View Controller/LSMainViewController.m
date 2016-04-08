//
//  LSMainViewController.m
//  LogStory
//
//  Created by cynthia on 4/5/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSMainViewController.h"
#import "LSLogFile.h"
#import "LSEventFormatFile.h"
#import "LSWorkObject.h"

@interface LSMainViewController ()

@end

@implementation LSMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do view setup here.
}

-(IBAction)buttonClicked:(id)sender
{
    NSURL *fileURL = [NSURL fileURLWithPath:@"/Users/cynthia/Desktop/Test.log" isDirectory:NO];
    NSURL *formatURL = [NSURL fileURLWithPath:@"/Users/cynthia/Desktop/FileFormat.xml" isDirectory:NO];
    
    LSLogFile *file = [[LSLogFile alloc] initWithURL:fileURL];
    LSEventFormatFile *format = [[LSEventFormatFile alloc] initWithURL:formatURL];
    
    if (file)
    {
        
    }
    if (format)
    {
    
    }
    
    LSWorkObject *workObj = [[LSWorkObject alloc] init];
    workObj.format = format;
    
    [workObj startWorkOnString:file.fileString];
}

@end
