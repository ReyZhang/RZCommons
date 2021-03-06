//
//  NSString+UtilString.h
//  RZCommon
//
//  Created by Zhang Rey on 6/1/15.
//  Copyright (c) 2015 Zhang Rey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (UtilString)

+ (BOOL)isEmpty:(NSString *)string;
+ (BOOL)isNotEmpty:(NSString *)string;
- (BOOL)isValidEmail;
+ (BOOL)isHtmlEmpty:(NSString *)htmlContent;
- (NSString *)URLEncoded;
- (NSString *)URLDecoded;
- (NSString *)stringTruncateToFit:(CGRect)rect withAttributes:(NSDictionary *)attributes;

@end
