//
//  XTOnePixelLine.h
//  ZJTool
//
//  Created by zhujia on 2019/7/16.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XTLinePosition)
{
    GSLinePositionTop = 0,
    GSLinePositionLeft = 1,
    GSLinePositionRight = 2,
    GSLinePositionBottom = 3
};

#define SINGLE_LINE_WIDTH (1/[UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET ((1/[UIScreen mainScreen].scale)/2)

NS_ASSUME_NONNULL_BEGIN

@interface XTOnePixelLine : UIView

@property (strong, nonatomic) UIColor *lineColor;
// IBInspectable 不支持枚举类型，所以用Integer代替
@property (assign, nonatomic) NSInteger linePosition;

@end

NS_ASSUME_NONNULL_END
