//
//  UITabBarController+HideTabBar.m
//  RZCommons
//
//  Created by Zhang Rey on 6/26/15.
//  Copyright (c) 2015 Zhang Rey. All rights reserved.
//

#import "UITabBarController+HideTabBar.h"
#define kAnimationDuration .3

CGRect tmpRect;
@implementation UITabBarController (HideTabBar)

-(BOOL) isTabBarHidden {
    CGRect viewFrame  = self.view.frame;
    CGRect tabBarFrame = self.tabBar.frame;
    return tabBarFrame.origin.y >= viewFrame.size.height;
}


-(void)setTabBarFrame {
    CGRect tabBarFrame  = self.tabBar.frame;
    tabBarFrame.origin.y = self.view.frame.size.height - tabBarFrame.size.height;
}

//////默认无动画效果
-(void)setTabBarHidden:(BOOL)tabBarHidden {
    [self setTabBarHidden:tabBarHidden animated:NO];
}

/////如果需要动画效果，调用这个方法
-(void)setTabBarHidden:(BOOL)tabBarHidden animated:(BOOL)animated {
    
    BOOL isHidden = self.tabBarHidden;
    
    //////获取所有的子控件，并反转它们的顺序，并取最后一个对象,这个对象是个“容器对象”
    UIView *transitionView  = [[[self.view.subviews reverseObjectEnumerator] allObjects] lastObject];
    
    /////如果当前不显示与传递的参数相同，不操作
    if (tabBarHidden == isHidden) {
        transitionView.frame = tmpRect;
        return;
    }
    
    if (transitionView == nil) {
        NSLog(@"could not found the container view");
        return;
    }
    
    CGRect viewFrame = self.view.frame;
    CGRect tabBarFrame = self.tabBar.frame;
    CGRect containerFrame = transitionView.frame;
    
    tabBarFrame.origin.y = viewFrame.size.height - (tabBarHidden ? 0 : tabBarFrame.size.height);
    
    /////调用容器对象的frame
    containerFrame.size.height  = viewFrame.size.height + (tabBarHidden ? tabBarFrame.size.height : 0 );
    tmpRect = containerFrame;
    
    if (animated) {
        [UIView animateWithDuration:kAnimationDuration
                         animations:^{
                             self.tabBar.frame = tabBarFrame;
                             transitionView.frame = containerFrame;
                         }];
    }else {
        self.tabBar.frame = tabBarFrame;
        transitionView.frame = containerFrame;
    }
    
}

@end
