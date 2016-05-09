//
//  LSLog.m
//  LogStory
//
//  Created by cynthia on 4/20/16.
//  Copyright © 2016 Gordon Xin. All rights reserved.
//

#import "LSLog.h"

static NSString * const logTypeInfo  = @" Info";
static NSString * const logTypeError = @"Error";
static NSString * const logTypeWarn  = @" Warn";

@interface LSLogInternal : NSObject

@property (nonatomic, readwrite, strong) NSFileHandle *fileHandle;
@property (nonatomic, readwrite, strong) NSString *filePath;
@property (nonatomic, readwrite, strong) NSDateFormatter *dateFormatter;


@end

@implementation LSLogInternal

-(instancetype)init
{
    if (self = [super init])
    {
        _filePath = @"";
        _fileHandle = nil;
        
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:@"yyyy-MM-dd"];
        
        [self resetFilePath];
    }
    return self;
}

-(void)dealloc
{
    [self.fileHandle closeFile];
}

-(void)resetFilePath
{
    NSString *bundlePath = @"/temp";//[[[NSBundle mainBundle] bundlePath] stringByDeletingLastPathComponent];
    NSString *fileName = [NSString stringWithFormat:@"LogStory %@.log", [_dateFormatter stringFromDate:[NSDate date]]];
    NSString *newFilePath = [bundlePath stringByAppendingPathComponent:fileName];
    
    if (![self.filePath isEqualToString:newFilePath])
    {
        [self resetFileHandleWithPath:newFilePath];
        self.filePath = newFilePath;
    }
}

-(void)resetFileHandleWithPath:(NSString *)filePath
{
    if (self.fileHandle != nil)
    {
        [self.fileHandle closeFile];
        self.fileHandle = nil;
    }
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        [[NSFileManager defaultManager] createFileAtPath:filePath
                                                contents:nil
                                              attributes:@{}];
    }
    
    NSURL *fileURL = [NSURL fileURLWithPath:filePath isDirectory:NO];
    
    NSError *error = nil;
    self.fileHandle = [NSFileHandle fileHandleForUpdatingURL:fileURL error:&error];
    
    if (self.fileHandle == nil)
    {
        NSLog(@"Can't create File Handle!!!");
        self.filePath = @"";
    }
    else
    {
        [self.fileHandle seekToEndOfFile];
    }
}

-(void)log:(NSString *)logString
{
    [self resetFilePath];
    if (self.fileHandle)
    {
        [self.fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [self.fileHandle writeData:[logString dataUsingEncoding:NSUTF8StringEncoding]];
    }
}

@end

@implementation LSLog

static NSDateFormatter *_dateFormatter = nil;
+(NSString *)formatLogString:(NSString *)inputString type:(NSString *)typeString class:(NSString *)className selector:(NSString *)selectorName
{
    if (_dateFormatter == nil)
    {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    }
    
    NSString *logString = [NSString stringWithFormat:@"[%@][%@][%@][%@] %@", [_dateFormatter stringFromDate:[NSDate date]], typeString, className, selectorName, inputString];
    return logString;
}

static LSLogInternal *_logInstance = nil;
+(LSLogInternal *)logInstance
{
    if (_logInstance == nil)
    {
        _logInstance = [[LSLogInternal alloc] init];
    }
    return _logInstance;
}

+(void)logErrorWithClassName:(NSString *)className selector:(NSString *)selectorName messageFormat:(NSString *)format, ...
{
    va_list ap;
    va_start(ap, format);
    NSString *logString = [[NSString alloc] initWithFormat:format arguments:ap];
    va_end(ap);

    [[LSLog logInstance] log:[LSLog formatLogString:logString type:logTypeError class:className selector:selectorName]];
}

+(void)logWarnWithClassName:(NSString *)className selector:(NSString *)selectorName messageFormat:(NSString *)format, ...
{
    va_list ap;
    va_start(ap, format);
    NSString *logString = [[NSString alloc] initWithFormat:format arguments:ap];
    va_end(ap);
    
    [[LSLog logInstance] log:[LSLog formatLogString:logString type:logTypeWarn class:className selector:selectorName]];
}

+(void)logInfoWithClassName:(NSString *)className selector:(NSString *)selectorName messageFormat:(NSString *)format, ...
{
    va_list ap;
    va_start(ap, format);
    NSString *logString = [[NSString alloc] initWithFormat:format arguments:ap];
    va_end(ap);
    
    [[LSLog logInstance] log:[LSLog formatLogString:logString type:logTypeInfo class:className selector:selectorName]];
}

@end
