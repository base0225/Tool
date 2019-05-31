//
//  UIView+Toast.h
//  ZJTool
//
//  Created by 朱佳 on 2019/5/31.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Toast)

// each makeToast method creates a view and displays it as toast
- (void)makeToast:(NSString *)message;

/// 如果当前有显示的Toast 则不会出现新的

- (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position;
/// 会显示所有的Toast 依次展示

- (void)makeQueueToast:(NSString *)message duration:(CGFloat)interval position:(id)position;

- (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position title:(NSString *)title;

- (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position title:(NSString *)title image:(UIImage *)image;

- (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position image:(UIImage *)image;

// the showToast methods display any view as toast
- (void)showToast:(UIView *)toast;

- (void)showToast:(UIView *)toast duration:(CGFloat)interval position:(id)point;

@end

NS_ASSUME_NONNULL_END
