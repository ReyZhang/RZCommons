//
//  NSString+UtilString.m
//  RZCommon
//
//  Created by Zhang Rey on 6/1/15.
//  Copyright (c) 2015 Zhang Rey. All rights reserved.
//

#import "NSString+UtilString.h"

@implementation NSString (UtilString)


+ (BOOL)isEmpty:(NSString *)string
{
    if (!string || [string isKindOfClass:[NSNull class]] || ![string isKindOfClass:[NSString class]] || string.length == 0) {
        return YES;
    }
    
    if (![[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isNotEmpty:(NSString *)string {
    return ![NSString isEmpty:string];
}

- (BOOL)isValidEmail {
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"] evaluateWithObject:self];
}

+ (BOOL)isHtmlEmpty:(NSString *)htmlContent {
    NSString * regex = @"[(&nbsp;)\\s]+";
    NSPredicate * predicator = [NSPredicate predicateWithFormat:@"%@ MATCHES %@",htmlContent, regex];
    
    return [predicator evaluateWithObject:self];
}

/**
 *  Encodes the URL
 *
 *  @return the URL encoded
 *
 */
- (NSString *)URLEncoded
{
    NSString * lastPathComponent = [[NSURL URLWithString:self] lastPathComponent];
    
    if ([NSString isEmpty:lastPathComponent]) {
        return self;
    }
    
    NSRange lastPathComponentRange = [[self URLDecoded:self] rangeOfString:lastPathComponent options:NSBackwardsSearch];
    NSRange urlRange = NSMakeRange(lastPathComponentRange.location + 1, self.length - lastPathComponentRange.location - 1);
    
    if (urlRange.length > 1) {
        NSString * substringToEncode = [self substringWithRange:urlRange];
        NSString * substringEncoded = (NSString *) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (__bridge CFStringRef) substringToEncode, NULL, CFSTR("!*'();:@&=+$,/?%#[]\" "), kCFStringEncodingUTF8));
        
        return [NSString stringWithFormat:@"%@%@", [self substringToIndex:urlRange.location], substringEncoded];
    }
    
    return self;
}

/**
 *  Decodes the URL
 *
 *  @return the URL decoded
 *
 */
- (NSString *)URLDecoded
{
    return (NSString *) CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (CFStringRef) self, CFSTR(""), kCFStringEncodingUTF8));
}

- (NSString *)URLDecoded:(NSString *)string
{
    return (NSString *) CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (CFStringRef) string, CFSTR(""), kCFStringEncodingUTF8));
}

- (NSString *)stringTruncateToFit:(CGRect)rect withAttributes:(NSDictionary *)attributes {
    NSString *result = [self copy];
    CGSize maxSize = CGSizeMake(rect.size.width, FLT_MAX);
    
    CGRect boundingRect = [result boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    CGSize size = boundingRect.size;
    
    if (rect.size.height < size.height) {
        while (rect.size.height < size.height) {
            result = [result substringToIndex:result.length - 1];
            CGRect boundingRect = [result boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
            size = boundingRect.size;
        }
    }
    
    return result;
}

@end
