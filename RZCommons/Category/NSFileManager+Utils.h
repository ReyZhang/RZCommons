//
//  NSFileManager+Utils.h
//  RZCommon
//
//  Created by Zhang Rey on 6/1/15.
//  Copyright (c) 2015 Zhang Rey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Utils)

/*
 Create URL for file
 */
+ (NSURL *)createURLPathForFileName:(NSString *)fileName;

/*
 Create file in NSDocument Dictionary
 */
+ (BOOL)createFileWithName:(NSString *)fileName content:(NSData *)content;

/*
 Create file in NSCachesDirectory
 */
+ (BOOL)cacheFileWithName:(NSString *)fileName content:(NSData *)content;

/*
 Verify if file exists
 */
+ (BOOL)existsFileWithName:(NSString *)fileName;

/*
 Verify if cached value
 */
+ (BOOL)existsCachedFileWithName:(NSString *)fileName;

/*
 Create dictionary
 */
+ (BOOL)createDictionaryWithName:(NSString *)dictionaryWithName;

/*
 Load file
 */
+ (NSData *)loadFileWithName:(NSString *)fileName;

/*
 Load cached file
 */
+ (NSData *)loadCachedFileWithName:(NSString *)fileName;

@end
