//
//  UILabel+ZJExtension.h
//  ZJTool
//
//  Created by 朱佳 on 2019/6/14.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (ZJExtension)

/**
 *  通过Label宽度设置高度
 *
 *  @param restWidth 已知宽度
 *  @param text      文本内容
 */
- (void)zj_autoResetHeightByWidth:(CGFloat)restWidth text:(NSString *)text;

/**
 *  通过Label宽度设置高度, 并设置最低高度
 *
 *  @param restWidth  已知宽度
 *  @param text       文本内容
 *  @param miniheight 最低高度
 */
- (void)zj_autoResetHeightByWidth:(CGFloat)restWidth text:(NSString *)text miniHeight:(CGFloat)miniheight;

/**
 *  通过Label宽度设置高度, 并设置每一行高度
 *
 *  @param restWidth 已知宽度
 *  @param text      文本内容
 *  @param height    每行高度
 */
- (void)zj_autoResetHeightByWidth:(CGFloat)restWidth text:(NSString *)text oneLineHeight:(CGFloat )height;

/**
 *  计算已知文本内容与宽度的情况下，控件的高度
 *
 *  @param width 已知宽度
 *  @param text  文本内容
 *
 *  @return 高度
 */
- (CGFloat)zj_calculateHeightByWidth:(CGFloat)width text:(NSString *)text;

/**
 *  自定义宽度
 */
- (void)zj_autoResetWidth;

@end

NS_ASSUME_NONNULL_END
