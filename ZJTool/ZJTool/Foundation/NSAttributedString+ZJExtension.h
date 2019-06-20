//
//  NSAttributedString+ZJExtension.h
//  ZJTool
//
//  Created by 朱佳 on 2019/6/19.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (ZJExtension)

/**
 *  以NSString字符串初始化对象的构造器方法
 *
 *  @param string 字符串
 *
 *  @return NSAttributedString对象
 */
+ (instancetype)zj_attributedStringWithString:(NSString *)string;

/**
 *  以NSAttributedString对象初始化对象的构造器方法
 *
 *  @param attrStr NSAttributedString对象
 *
 *  @return NSAttributedString对象
 */
+ (instancetype)zj_attributedStringWithAttributedString:(NSAttributedString *)attrStr;

/**
 *  ＊＊安全＊＊ 初始化attributedString
 *
 *  @param str 字符串
 *
 *  @return 富文本
 */
- (instancetype)zj_initWithString:(NSString *)str;

/**
 *  ＊＊安全＊＊ 初始化attributedString
 *
 *  @param str   字符串
 *  @param attrs 格式
 *
 *  @return 富文本
 */
- (instancetype)zj_initWithString:(NSString *)str attributes:(NSDictionary<NSString *, id> *)attrs;

/**
 *  计算NSAttributedString对象占据的尺寸
 *
 *  @param maxSize 设置默认最大尺寸
 *
 *  @return 实际尺寸
 */
- (CGSize)zj_sizeConstrainedToSize:(CGSize)maxSize;

/**
 *  计算某一范围内NSAttributedString对象占据的尺寸
 *
 *  @param maxSize  设置默认最大尺寸
 *  @param fitRange 范围
 *
 *  @return 实际尺寸
 */
- (CGSize)zj_sizeConstrainedToSize:(CGSize)maxSize fitRange:(NSRange *)fitRange;

@end



@interface NSMutableAttributedString (ZJExtension)

/**
 *  设置字体
 *
 *  @param font 字体类型
 */
- (void)zj_setFont:(UIFont *)font;
/**
 *  设置字体，并确定字体适用范围
 *
 *  @param font  字体
 *  @param range 范围
 */
- (void)zj_setFont:(UIFont *)font range:(NSRange)range;
/**
 *  设置字体，通过字体名称及字体大小
 *
 *  @param fontName 字体名称
 *  @param size     字体大小
 */
- (void)zj_setFontName:(NSString *)fontName size:(CGFloat)size;
/**
 *  设置字体，通过字体名称及字体大小,并设置字体适用范围
 *
 *  @param fontName 字体名称
 *  @param size     字体大小
 *  @param range    适用范围
 */
- (void)zj_setFontName:(NSString *)fontName size:(CGFloat)size range:(NSRange)range;
/**
 *  设置字体颜色
 *
 *  @param color 颜色
 */
- (void)zj_setTextColor:(UIColor *)color;
/**
 *  设置字体颜色，并确定适用范围
 *
 *  @param color 颜色
 *  @param range 适用范围
 */
- (void)zj_setTextColor:(UIColor*)color range:(NSRange)range;

/**
 *  设置下划线
 *
 *  @param style 下划线类型
 */
- (void)zj_setTextStrikethroughStyle:(NSUnderlineStyle)style;

/**
 *  设置下划线, 并确定适用范围
 *
 *  @param style 下划线类型
 *  @param range 适用范围
 */
- (void)zj_setTextStrikethroughStyle:(NSUnderlineStyle)style range:(NSRange)range;
/**
 *  设置下划线类型
 *
 *  @param style 下划线类型
 */
- (void)zj_setTextUnderLineStyle:(NSUnderlineStyle)style;
/**
 *  设置下划线类型，并设置适用范围
 *
 *  @param style 下划线类型
 *  @param range 适用范围
 */
- (void)zj_setTextUnderLineStyle:(NSUnderlineStyle)style range:(NSRange)range;
/**
 *  设置段落样式
 *
 *  @param block 回传样式信息
 */
- (void)zj_modifyParagraphStylesWithBlock:(void (^)(NSMutableParagraphStyle *paragraphStyle))block;

/**
 *  设置段落样式
 *
 *  @param paragraphStyle 样式
 */
- (void)zj_setParagraphStyle:(NSParagraphStyle *)paragraphStyle;

/**
 *  设置段落样式
 *
 *  @param paragraphStyle 样式
 *  @param range          范围
 */
- (void)zj_setParagraphStyle:(NSParagraphStyle *)paragraphStyle range:(NSRange)range;

@end

NS_ASSUME_NONNULL_END
