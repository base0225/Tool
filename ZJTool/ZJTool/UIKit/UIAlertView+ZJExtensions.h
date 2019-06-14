//
//  UIAlertView+ZJExtensions.h
//  ZJTool
//
//  Created by 朱佳 on 2019/6/14.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertView (ZJExtensions)<UIAlertViewDelegate>

/**
 *  显示AlertView
 *
 *  @param title             主题
 *  @param message           内容
 *  @param cancelButtonTitle 取消按钮内容
 *  @param otherButton       其他按钮
 *
 *  @return alertView
 */
+ (UIAlertView *)zj_showAlertViewWithTitle:(NSString *)title
                                   message:(NSString *)message
                         cancelButtonTitle:(NSString *)cancelButtonTitle
                          otherButtonTitle:(NSString *)otherButton;

/**
 *  显示AlertView
 *
 *  @param title             主题
 *  @param message           内容
 *  @param cancelButtonTitle 取消按钮内容
 *  @param otherButton       其他按钮
 *  @param cancelled         取消操作完成后动作
 *  @param dismissed         alertView消失后动作
 *
 *  @return alertView
 */
+ (UIAlertView *)zj_showAlertViewWithTitle:(NSString *)title
                                   message:(NSString *)message
                         cancelButtonTitle:(NSString *)cancelButtonTitle
                          otherButtonTitle:(NSString *)otherButton
                                  onCancel:(void (^)(void))cancelled
                                 onDismiss:(void (^)(NSInteger buttonIndex))dismissed;

/**
 *  显示AlertView
 *
 *  @param title             主题
 *  @param message           内容
 *  @param cancelButtonTitle 取消按钮内容
 *  @param otherButtons      其他按钮(NSArray，可包含多个)
 *
 *  @return alertView
 */
+ (UIAlertView *)zj_showAlertViewWithTitle:(NSString *)title
                                   message:(NSString *)message
                         cancelButtonTitle:(NSString *)cancelButtonTitle
                         otherButtonTitles:(NSArray *)otherButtons;

/**
 *  显示AlertView
 *
 *  @param title             主题
 *  @param message           内容
 *  @param cancelButtonTitle 取消按钮内容
 *  @param cancelled         取消操作完成后动作
 *  @param dismissed         alertView消失后动作
 *
 *  @return alertView
 */
+ (UIAlertView *)zj_showAlertViewWithTitle:(NSString *)title
                                   message:(NSString *)message
                         cancelButtonTitle:(NSString *)cancelButtonTitle
                         otherButtonTitles:(NSArray *)otherButtons
                                  onCancel:(void (^)(void))cancelled
                                 onDismiss:(void (^)(NSInteger buttonIndex))dismissed;


@end

NS_ASSUME_NONNULL_END
