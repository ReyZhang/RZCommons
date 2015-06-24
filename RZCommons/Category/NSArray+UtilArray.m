//
//  NSArray+UtilArray.m
//  RZCommon
//
//  Created by Zhang Rey on 6/1/15.
//  Copyright (c) 2015 Zhang Rey. All rights reserved.
//

#import "NSArray+UtilArray.h"

@implementation NSArray (UtilArray)

+ (BOOL)hasValues:(NSArray *)array{
    return (id)[NSNull null] != array && array && [array count] > 0;
}

+ (BOOL)isEmpty:(NSArray *)array{
    return (id)[NSNull null] == array || !array || [array count] == 0;
}

- (BOOL)containsObjectsFromArray:(NSArray *)array{
    BOOL contain = NO;
    for (id object in array) {
        contain = [self containsObject:object];
        if(contain) break;
    }
    return contain;
}


@end
