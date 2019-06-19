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

NS_ASSUME_NONNULL_END
