//
//  UIColor+ZJExtension.h
//  ZJTool
//
//  Created by 朱佳 on 2019/5/29.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,ZJGradietType) {
    ZJGradietTypeTopToBottom = 0, //从上到下
    ZJGradietTypeLeftToRight = 1, //从左到右
    ZJGradietTypeUpLeftToLowRight = 2, //从左上到右下
    ZJGradietTypeUpRightToLowLeft = 3,  //从右上到左下
};

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ZJExtension)

/**
 *  根据16进制数设置颜色(默认alpha为1.0)
 *
 *  @param hex 16进制数字(例如0xff0000)
 *
 *  @return 32位真彩色
 */
+ (UIColor *)zj_colorWithHex:(unsigned int)hex;
/**
 *  根据16进制数设置颜色
 *
 *  @param hex   16进制数字(例如0xff0000)
 *  @param alpha 透明度
 *
 *  @return 32位真彩色
 */
+ (UIColor *)zj_colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha;

/**
 *  根据16进制字符串设置颜色
 *
 *  @param hexString 16进制字符串(例如@"#ff0000"),hexString为空，默认返回黑色
 *
 *  @return 32位真彩色
 */
+ (UIColor *)zj_colorwithHexString:(NSString *)hexString;

/**
 *  根据16进制字符串设置颜色
 *
 *  @param hexString 16进制字符串(例如@"#ff0000"),hexString为空，默认返回黑色
 *  @param alpha     透明度
 *  @return 32位真彩色
 */
+ (UIColor *)zj_colorwithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

/**
 *  获取随机颜色
 *
 *  @return 随机颜色
 */
+ (UIColor *)zj_randomColor;

/**
 *  生成渐变颜色
 *
 *  @param colors       颜色
 *  @param gradientType 类型
 *  @param imgSize      size
 *  @return 渐变色
 */
+ (UIColor *)zj_gradientColorInageFromColors:(NSArray *)colors gradientType:(ZJGradietType)gradientType imgSize:(CGSize)imgSize;

/*
 * 生成纯色的img图片
 * [HEXCOLOR(0xE2E7EF) zj_pureColorImage]
 */
- (UIImage *)zj_pureColorImage;

/*
 * 修改颜色的色相、饱和度、亮度和透明度
 * 入参 dic = {@"hue":@(0.6),@"saturation":@(0.6),@"brightness":(0.6),@"alpha":@(1)}
 * 不需要修改的参数，不用传相应的key
 * return color
 */
+ (UIColor *)zj_modifyColorElement:(UIColor *)originColor element:(NSDictionary *)element;

/*
 * 获取颜色的均值
 */
+ (UIColor *)zj_averageColors:(NSArray<UIColor *> *)colors;

@end

NS_ASSUME_NONNULL_END
