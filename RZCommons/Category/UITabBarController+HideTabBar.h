//
//  UITabBarController+HideTabBar.h
//  RZCommons
//
//  Created by Zhang Rey on 6/26/15.
//  Copyright (c) 2015 Zhang Rey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (HideTabBar)
@property (nonatomic,getter=isTabBarHidden) BOOL tabBarHidden;

-(void)setTabBarHidden:(BOOL)tabBarHidden animated:(BOOL)animated;
@end
