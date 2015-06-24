//
//  NSArray+UtilArray.h
//  RZCommon
//
//  Created by Zhang Rey on 6/1/15.
//  Copyright (c) 2015 Zhang Rey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (UtilArray)

+ (BOOL)hasValues:(NSArray *)array;
+ (BOOL)isEmpty:(NSArray *)array;

- (BOOL)containsObjectsFromArray:(NSArray *)array;

@end
