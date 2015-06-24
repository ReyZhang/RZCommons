//
//  NSFileManager+Utils.m
//  RZCommon
//
//  Created by Zhang Rey on 6/1/15.
//  Copyright (c) 2015 Zhang Rey. All rights reserved.
//

#import "NSFileManager+Utils.h"

@implementation NSFileManager (Utils)


+ (BOOL)createFileWithName:(NSString *)fileName content:(NSData *)content{
    return [NSFileManager createFileWithName:fileName content:content inDictionary:NSDocumentDirectory];
}

+ (BOOL)cacheFileWithName:(NSString *)fileName content:(NSData *)content{
    return [NSFileManager createFileWithName:fileName content:content inDictionary:NSCachesDirectory];
}

+ (BOOL)existsFileWithName:(NSString *)fileName{
    return [NSFileManager existsFileWithName:fileName inDictionary:NSDocumentDirectory];
}

+ (BOOL)existsCachedFileWithName:(NSString *)fileName{
    return [NSFileManager existsFileWithName:fileName inDictionary:NSCachesDirectory];
}

+ (BOOL)createDictionaryWithName:(NSString *)dictionaryWithName{
    NSString *path = [NSFileManager getPathForDictionary:NSDocumentDirectory];
    path = [path stringByAppendingPathComponent:dictionaryWithName];
    
    BOOL success = NO;
    if(![[NSFileManager defaultManager] fileExistsAtPath:path]){
        success = [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:NULL];
    }
    
    return NO;
}

+ (NSData *)loadFileWithName:(NSString *)fileName{
    NSData *data = nil;
    if([NSFileManager existsFileWithName:fileName]){
        NSString *path = [NSFileManager getPathForDictionary:NSDocumentDirectory];
        path = [path stringByAppendingPathComponent:fileName];
        data = [[NSData alloc] initWithContentsOfFile:path];
    }
    return data;
}

+ (NSData *)loadCachedFileWithName:(NSString *)fileName{
    NSData *data = nil;
    if([NSFileManager existsFileWithName:fileName]){
        NSString *path = [NSFileManager getPathForDictionary:NSCachesDirectory];
        path = [path stringByAppendingPathComponent:fileName];
        data = [[NSData alloc] initWithContentsOfFile:path];
    }
    return data;
}

#pragma mark - PRIVATE

+ (NSString *)getPathForDictionary:(NSSearchPathDirectory)dictionary{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(dictionary, NSUserDomainMask, YES);
    return [paths firstObject];
}

/*
 Verify if file exists in the dictionary
 */
+ (BOOL)existsFileWithName:(NSString *)fileName inDictionary:(NSSearchPathDirectory)dictionary{
    NSString *path = [[NSFileManager getPathForDictionary:dictionary] stringByAppendingPathComponent:fileName];
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

/*
 Create file in a specified dictionary
 */
+ (BOOL)createFileWithName:(NSString *)fileName content:(NSData *)content inDictionary:(NSSearchPathDirectory)dictionary{
    NSString *path = [[NSFileManager getPathForDictionary:dictionary] stringByAppendingPathComponent:fileName];
    
    BOOL success = NO;
    if(![[NSFileManager defaultManager] fileExistsAtPath:path]){
        
        // create the actual file
        success = [[NSFileManager defaultManager] createFileAtPath:path contents:content attributes:nil];
    }
    return success;
}

+ (NSURL *)createURLPathForFileName:(NSString *)fileName{
    NSString *path = [[NSFileManager getPathForDictionary:NSDocumentDirectory] stringByAppendingPathComponent:fileName];
    return [NSURL fileURLWithPath:path];
}

@end
