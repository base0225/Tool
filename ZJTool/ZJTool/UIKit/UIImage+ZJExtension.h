//
//  UIImage+ZJExtension.h
//  ZJTool
//
//  Created by 朱佳 on 2019/6/10.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ZJExtension)

/**
 *  裁剪图片
 *
 *  @param rect 裁剪尺寸
 *  @return 裁剪后的图片
 */
- (UIImage *)zj_slicedImageWithRect:(CGRect)rect;
/**
 *  压缩拉伸图片
 *
 *  @param size 压缩拉伸尺寸
 *  @return 压缩拉伸后的图片
 */
- (UIImage *)zj_scaledImageWithSize:(CGSize)size;
/**
 *  压缩拉升图片后裁剪图片
 *
 *  @param targetSize 目标尺寸
 *
 *  @return 处理后的图片
 */
- (UIImage*)zj_scaleAndCropImageWithSize:(CGSize)targetSize;

/**
 *  返回基本接近固定字节长度的图片 图片的尺寸有可能改变
 *  ！！！在图片本身大小与制定的大小相差较大的时候 会改变尺寸
 *
 *  @param length 字节长度
 *  @return 固定字节长度的图片
 */
- (UIImage *)zj_imageSizeConstraintToByteLength:(long long)length;

/**
 *  修正图片方向
 *
 *  @return 处理后的图片
 */
- (UIImage *)zj_fixOrientation;

/**
 *  圆形图片
 *
 *  @param image 待处理图片
 *
 *  @return 处理过的图片
 */
+ (UIImage *)zj_circleImage:(UIImage *)image;

/**
 *  圆形图片
 *
 *  @param image       待处理图片
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 *
 *  @return 处理过的图片
 */
+ (UIImage *)tn_circleImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**
 *  图片边框
 *
 *  @param image        待处理图片
 *  @param borderWidth  边框宽度
 *  @param borderColor  边框颜色
 *  @param cornerRadius 边框弧度
 *
 *  @return 处理过的图片
 */
+ (UIImage *)zj_imageCorner:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius;

@end

NS_ASSUME_NONNULL_END
