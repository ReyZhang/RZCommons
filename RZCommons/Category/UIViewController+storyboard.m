//
//  UIViewController+storyboard.m
//  AddressBook
//
//  Created by Zhang Rey on 6/1/15.
//  Copyright (c) 2015 Zhang Rey. All rights reserved.
//

#import "UIViewController+storyboard.h"

@implementation UIViewController (storyboard)


+(instancetype)createInstance {
    const char *class_name = object_getClassName(self);
    NSString *identifier = [NSString stringWithCString:class_name encoding:NSUTF8StringEncoding];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    if (viewController)
        return viewController;
    return nil;
}



@end
