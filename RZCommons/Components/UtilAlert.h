//
//  UtilAlert.h
//  RZCommon
//
//  Created by Zhang Rey on 6/1/15.
//  Copyright (c) 2015 Zhang Rey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UtilAlert : NSObject

+ (void) alert:(NSString *)msg;

+ (UIAlertView *)showInputBox:(NSString *)question forTarget:(UIViewController<UIAlertViewDelegate> *)target withInitialValue:(NSString*)initialValue andTag:(NSInteger)tag;

+ (UIAlertView *)showInputBox:(NSString *)question forTarget:(UIViewController<UIAlertViewDelegate> *)target placeHolder:(NSString*)placeHolder andCapitalize:(BOOL)capitalize;

+ (UIAlertView *)showInputBox:(NSString *)question forTarget:(UIViewController<UIAlertViewDelegate> *)target placeHolder:(NSString*)placeHolder andTag:(NSInteger)tag andCapitalize:(BOOL)capitalize;

+ (UIAlertView *)showLoadingMessageWithTitle:(NSString *)title;

+ (NSInteger)showErrorMessageWithTitle:(NSString *)title
                               message:(NSString*)message
                              delegate:(id)delegate ;

+ (void)showErrorMessageWithTitle:(NSString *)title
                          message:(NSString*)message ;

+ (UIAlertView *)showLoadingMessageWithTitle;


// QUESTION BOX
+ (UIAlertView *)showQuestionBoxWithTitle:(NSString *)title question:(NSString *)question forTarget:(UIViewController<UIAlertViewDelegate> *)target andTag:(NSInteger)tag;
+ (UIAlertView *)showQuestionBoxWithTitle:(NSString *)title question:(NSString *)question target:(UIViewController<UIAlertViewDelegate> *)target;
+ (UIAlertView *)showQuestionBox:(NSString *)question forTarget:(UIViewController<UIAlertViewDelegate> *)target andTag:(NSInteger)tag;
+ (UIAlertView *)showQuestionBox:(NSString *)question forTarget:(UIViewController<UIAlertViewDelegate> *)target;

// OK CANCEL STYLE

+ (UIAlertView *)showOkCancelDialogWithTitle:(NSString *)title message:(NSString *)message delegate:(id<UIAlertViewDelegate>)delegate;
+ (UIAlertView *)showOkCancelDialogWithTitle:(NSString *)title delegate:(id<UIAlertViewDelegate>)delegate tag:(NSInteger)tag;
+ (UIAlertView *)showOkCancelDialogWithTitle:(NSString *)title delegate:(id<UIAlertViewDelegate>)delegate;
+ (UIAlertView *)showOkCancelDialogWithTitle:(NSString *)title message:(NSString *)message delegate:(id<UIAlertViewDelegate>)delegate tag:(NSInteger)tag;
+ (UIAlertView *)showOkCancelInputFieldDialogWithTitle:(NSString *)title delegate:(id<UIAlertViewDelegate>)delegate tag:(NSInteger)tag;

@end
