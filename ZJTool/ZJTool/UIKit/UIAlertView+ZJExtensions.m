//
//  UIAlertView+ZJExtensions.m
//  ZJTool
//
//  Created by 朱佳 on 2019/6/14.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import "UIAlertView+ZJExtensions.h"

static void(^_dismissBlock)(NSInteger buttonIndex);
static void(^_cancelBlock)(void);

@implementation UIAlertView (ZJExtensions)

+ (UIAlertView *)zj_showAlertViewWithTitle:(NSString *)title
                                   message:(NSString *)message
                         cancelButtonTitle:(NSString *)cancelButtonTitle
                          otherButtonTitle:(NSString *)otherButton
{
    NSArray *buttons;
    if (otherButton) {
        buttons = @[otherButton];
    }
    else {
        buttons = [NSArray array];
    }
    UIAlertView *alert = [UIAlertView zj_showAlertViewWithTitle:title message:message cancelButtonTitle:cancelButtonTitle otherButtonTitles:buttons onCancel:nil onDismiss:nil];
    return alert;
}

+ (UIAlertView *)zj_showAlertViewWithTitle:(NSString *)title
                                   message:(NSString *)message
                         cancelButtonTitle:(NSString *)cancelButtonTitle
                          otherButtonTitle:(NSString *)otherButton
                                  onCancel:(void (^)(void))cancelled
                                 onDismiss:(void (^)(NSInteger))dismissed
{
    NSArray *buttons;
    if (otherButton) {
        buttons = @[otherButton];
    }
    else {
        buttons = [NSArray array];
    }
    UIAlertView *alert = [UIAlertView zj_showAlertViewWithTitle:title message:message cancelButtonTitle:cancelButtonTitle otherButtonTitles:buttons onCancel:cancelled onDismiss:dismissed];
    return alert;
}

+ (UIAlertView *)zj_showAlertViewWithTitle:(NSString *)title
                                   message:(NSString *)message
                         cancelButtonTitle:(NSString *)cancelButtonTitle
                         otherButtonTitles:(NSArray *)otherButtons
{
    
    UIAlertView *alert = [UIAlertView zj_showAlertViewWithTitle:title message:message cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtons  onCancel:nil onDismiss:nil];
    return alert;
}


+ (UIAlertView *)zj_showAlertViewWithTitle:(NSString *)title
                                   message:(NSString *)message
                         cancelButtonTitle:(NSString *)cancelButtonTitle
                         otherButtonTitles:(NSArray *)otherButtons
                                  onCancel:(void (^)(void))cancelled
                                 onDismiss:(void (^)(NSInteger))dismissed
{
    if (cancelled) {
        _cancelBlock  = [cancelled copy];
    }
    
    if (dismissed) {
        _dismissBlock  = [dismissed copy];
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles:nil];
    
    for(NSString *buttonTitle in otherButtons) {
        [alert addButtonWithTitle:buttonTitle];
    }
    
    [alert show];
    return alert;
}

@end
