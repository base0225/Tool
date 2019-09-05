//
//  UITextField+ZJExtension.h
//  ZJTool
//
//  Created by zhujia on 2019/8/9.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSInteger, ZJMenuItemDisabledType) {
    ZJMenuItemDisabledTypeCut       = 1 << 0,
    ZJMenuItemDisabledTypeCopy      = 1 << 1,
    ZJMenuItemDisabledTypePaste     = 1 << 2,
    ZJMenuItemDisabledTypeDelete    = 1 << 3,
    ZJMenuItemDisabledTypeSelect    = 1 << 4,
    ZJMenuItemDisabledTypeSelectAll = 1 << 5,
    ZJMenuItemDisabledTypeAll       = 0xFF,
};

@interface UITextField (ZJExtension)

/// 设置placeholder 颜色
- (void)zj_setPlaceholderColor:(UIColor *)color;

/// 设置placeholder 字体
- (void)zj_setPlaceholderFont:(UIFont *)font;

- (void)zj_configDoneWithWidth:(CGFloat)width;

/// 禁用menu item类型 [如果是密码输入框, 默认禁用所有]
@property (nonatomic, assign) ZJMenuItemDisabledType menuItemDisabledType;

@end

NS_ASSUME_NONNULL_END
