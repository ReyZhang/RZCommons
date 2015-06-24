//
//  NSString+TrimmingAdditions.h
//  RZCommon
//
//  Created by Zhang Rey on 6/1/15.
//  Copyright (c) 2015 Zhang Rey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TrimmingAdditions)

- (NSString *)removeAllWhitespaces;
- (NSString *)stringByTrimmingTrailingSpaces;
- (NSString *)stringByTrimmingLeadingSpaces;
    
- (NSString *)stringByTrimmingLeadingCharactersInSet:(NSCharacterSet *)characterSet;
- (NSString *)stringByTrimmingTrailingCharactersInSet:(NSCharacterSet *)characterSet;

@end
