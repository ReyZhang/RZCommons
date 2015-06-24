//
//  UtilAlert.m
//  RZCommon
//
//  Created by Zhang Rey on 6/1/15.
//  Copyright (c) 2015 Zhang Rey. All rights reserved.
//

#define ERROR_TAG 100

#import "UtilAlert.h"

@implementation UtilAlert

+ (UIAlertView *)showOkCancelInputFieldDialogWithTitle:(NSString *)title delegate:(id<UIAlertViewDelegate>)delegate tag:(NSInteger)tag{
    return [UtilAlert showOkCancelDialogWithTitle:title message:nil delegate:delegate tag:tag withInpuText:YES];
}

+ (UIAlertView *)showOkCancelDialogWithTitle:(NSString *)title message:(NSString *)message delegate:(id<UIAlertViewDelegate>)delegate{
    return [UtilAlert showOkCancelDialogWithTitle:title message:message delegate:delegate tag:NSNotFound withInpuText:NO];
}

+ (UIAlertView *)showOkCancelDialogWithTitle:(NSString *)title message:(NSString *)message delegate:(id<UIAlertViewDelegate>)delegate tag:(NSInteger)tag{
    return [UtilAlert showOkCancelDialogWithTitle:title message:message delegate:delegate tag:tag withInpuText:NO];
}

+ (UIAlertView *)showOkCancelDialogWithTitle:(NSString *)title delegate:(id<UIAlertViewDelegate>)delegate tag:(NSInteger)tag{
    return [UtilAlert showOkCancelDialogWithTitle:title message:nil delegate:delegate tag:tag withInpuText:NO];
}

+ (UIAlertView *)showOkCancelDialogWithTitle:(NSString *)title delegate:(id<UIAlertViewDelegate>)delegate{
    return [UtilAlert showOkCancelDialogWithTitle:title message:nil delegate:delegate tag:NSNotFound withInpuText:NO];
}

+ (UIAlertView *)showOkCancelDialogWithTitle:(NSString *)title message:(NSString *)message delegate:(id<UIAlertViewDelegate>)delegate tag:(NSInteger)tag withInpuText:(BOOL)withInput{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:NSLocalizedString(@"Cancel", nil) otherButtonTitles:@"Ok", nil];
    [alertView setTag:tag];
    if(withInput){
        alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    }
    [alertView show];
    return alertView;
}


+ (void)alert:(NSString *) msg{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Alert", nil) message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

+ (UIAlertView *)showInputBox:(NSString *)question forTarget:(UIViewController<UIAlertViewDelegate> *)target withInitialValue:(NSString*)initialValue andTag:(NSInteger)tag{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:question message:@"" delegate:target cancelButtonTitle:NSLocalizedString(@"Cancel", nil) otherButtonTitles:@"Ok", nil];
    
    alert.tag = tag;
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    // initial configuration
    UITextField *textField = [alert textFieldAtIndex:0];
    if(!initialValue){
        textField.placeholder = NSLocalizedString(@"Insert here...", nil);
    } else {
        textField.text = initialValue;
    }
    [alert show];
    return alert;
}

+ (UIAlertView *)showInputBox:(NSString *)question forTarget:(UIViewController<UIAlertViewDelegate> *)target placeHolder:(NSString*)placeHolder andCapitalize:(BOOL)capitalize {
    return [UtilAlert showInputBox:question forTarget:target placeHolder:placeHolder andTag:0 andCapitalize:capitalize];
}

+ (UIAlertView *)showInputBox:(NSString *)question forTarget:(UIViewController<UIAlertViewDelegate> *)target placeHolder:(NSString*)placeHolder andTag:(NSInteger)tag andCapitalize:(BOOL)capitalize {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:question message:@"" delegate:target cancelButtonTitle:NSLocalizedString(@"Cancel", nil) otherButtonTitles:@"Ok", nil];
    
    alert.tag = tag;
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    // initial configuration
    UITextField *textField = [alert textFieldAtIndex:0];
    textField.placeholder = placeHolder;
    if (capitalize) {
        [textField setAutocapitalizationType:UITextAutocapitalizationTypeWords];
    }
    [alert show];
    return alert;
}

#pragma mark - QUESTION BOX

+ (UIAlertView *)showQuestionBoxWithTitle:(NSString *)title question:(NSString *)question forTarget:(UIViewController<UIAlertViewDelegate> *)target andTag:(NSInteger)tag{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:question delegate:target cancelButtonTitle:NSLocalizedString(@"No", nil) otherButtonTitles:NSLocalizedString(@"Yes", nil), nil];
    alert.tag = tag;
    [alert show];
    return alert;
}

+ (UIAlertView *)showQuestionBoxWithTitle:(NSString *)title question:(NSString *)question target:(UIViewController<UIAlertViewDelegate> *)target{
    return [UtilAlert showQuestionBoxWithTitle:title question:question forTarget:target andTag:-1];
}

+ (UIAlertView *)showQuestionBox:(NSString *)question forTarget:(UIViewController<UIAlertViewDelegate> *)target{
    return [UtilAlert showQuestionBox:question forTarget:target andTag:-1];
}

+ (UIAlertView *)showQuestionBox:(NSString *)question forTarget:(UIViewController<UIAlertViewDelegate> *)target andTag:(NSInteger)tag{
    return [UtilAlert showQuestionBoxWithTitle:NSLocalizedString(@"Alert", nil) question:question forTarget:target andTag:tag];
}

#pragma mark - loading and error handling

+ (UIAlertView *)showLoadingMessageWithTitle:(NSString *)title{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:nil
                                          otherButtonTitles:nil];
    UIActivityIndicatorView *progress = 
    [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(125, 50, 30, 30)];
    progress.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [alert addSubview:progress];
    [progress startAnimating];
    [alert show];
    return alert;
}

+ (UIAlertView *)showLoadingMessageWithTitle{    
    return [UtilAlert showLoadingMessageWithTitle:nil];
}

+ (NSInteger)showErrorMessageWithTitle:(NSString *)title
                               message:(NSString*)message
                              delegate:(id)delegate {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:delegate
                                          cancelButtonTitle:NSLocalizedString(@"Dismiss", nil)
                                          otherButtonTitles:NSLocalizedString(@"Retry", nil), nil];
    [alert setTag:ERROR_TAG];
    [alert show];
    return alert.tag;
}

+ (void)showErrorMessageWithTitle:(NSString *)title
                          message:(NSString*)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles: nil];
    [alert show];
}


@end
