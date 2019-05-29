//
//  UIColor+ZJExtension.m
//  ZJTool
//
//  Created by 朱佳 on 2019/5/29.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import "UIColor+ZJExtension.h"

@implementation UIColor (ZJExtension)

+ (UIColor *)zj_colorWithHex:(unsigned int)hex{
    return [UIColor zj_colorWithHex:hex alpha:1.0f];
}

+ (UIColor *)zj_colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/ 255.0
                                  green:((float)((hex & 0xFF00) >> 8)) / 255.0
                                  blue:((float)(hex & 0xFF)) /255.0
                           alpha:alpha];
}

// 根据16进制字符串设置颜色
+ (UIColor *)zj_colorwithHexString:(NSString *)hexString
{
    if (hexString.length == 0) {
        return [UIColor blackColor];
    }
    unsigned int hex = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&hex];
    return [UIColor zj_colorWithHex:hex];
}

+ (UIColor *)zj_colorwithHexString:(NSString *)hexString alpha:(CGFloat)alpha
{
    if (hexString.length == 0) {
        return [UIColor blackColor];
    }
    unsigned int hex = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&hex];
    return [UIColor zj_colorWithHex:hex alpha:alpha];
}

+ (UIColor *)zj_randomColor{
    NSInteger r = arc4random() % 255;
    NSInteger g = arc4random() % 255;
    NSInteger b = arc4random() % 255;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

+ (UIColor *)zj_gradientColorInageFromColors:(NSArray *)colors gradientType:(ZJGradietType)gradientType imgSize:(CGSize)imgSize{
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors){
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(imgSize, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    CGPoint start;
    CGPoint end;
    switch (gradientType) {
        case ZJGradietTypeTopToBottom:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
        case ZJGradietTypeLeftToRight:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, 0.0);
            break;
        case ZJGradietTypeUpLeftToLowRight:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, imgSize.height);
            break;
        case ZJGradietTypeUpRightToLowLeft:
            start = CGPointMake(imgSize.width, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
        default:
            break;
    }
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    
    UIColor *color = [UIColor colorWithPatternImage:image];
    return color;
    
}

- (UIImage *)zj_pureColorImage
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [self CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIColor *)zj_modifyColorElement:(UIColor *)originColor element:(NSDictionary *)element
{
    if (!originColor) {
        return nil;
    }
    UIColor *resultColor = originColor;
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL success = [originColor getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    if (success) {
        CGFloat resultHue = hue;
        if (element[@"hue"]) {
            resultHue = [element[@"hue"] floatValue];
        }
        CGFloat resultSat = saturation;
        if (element[@"saturation"]) {
            resultSat = [element[@"saturation"] floatValue];
        }
        CGFloat resultBright = brightness;
        if (element[@"brightness"]) {
            resultBright = [element[@"brightness"] floatValue];
        }
        CGFloat resultAlpha = alpha;
        if (element[@"alpha"]) {
            resultAlpha = [element[@"alpha"] floatValue];
        }
        resultColor = [UIColor colorWithHue:resultHue saturation:resultSat brightness:resultBright alpha:resultAlpha];
    }
    return resultColor;
}

+ (UIColor *)zj_averageColors:(NSArray<UIColor *> *)colors
{
    if (!colors || colors.count == 0) {
        return nil;
    }
    CGFloat reds = 0.0f;
    CGFloat greens = 0.0f;
    CGFloat blues = 0.0f;
    CGFloat alphas = 0.0f;
    NSInteger count = 0;
    for (UIColor *c in colors) {
        CGFloat red = 0.0f;
        CGFloat green = 0.0f;
        CGFloat blue = 0.0f;
        CGFloat alpha = 0.0f;
        BOOL success = [c getRed:&red green:&green blue:&blue alpha:&alpha];
        if (success) {
            reds += red;
            greens += green;
            blues += blue;
            alphas += alpha;
            count++;
        }
    }
    return [UIColor colorWithRed:reds/count green:greens/count blue:blues/count alpha:alphas/count];
}

@end
