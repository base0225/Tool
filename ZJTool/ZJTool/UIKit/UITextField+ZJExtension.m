//
//  UITextField+ZJExtension.m
//  ZJTool
//
//  Created by zhujia on 2019/8/9.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import "UITextField+ZJExtension.h"
#import <objc/runtime.h>

@implementation UITextField (ZJExtension)

- (void)zj_setPlaceholderColor:(UIColor *)color {
    if (color) {
        [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
    }
}

- (void)zj_setPlaceholderFont:(UIFont *)font {
    if (font) {
        [self setValue:font forKeyPath:@"_placeholderLabel.font"];
    }
}

- (ZJMenuItemDisabledType)menuItemDisabledType {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setMenuItemDisabledType:(ZJMenuItemDisabledType)menuItemDisabledType {
    objc_setAssociatedObject(self, @selector(menuItemDisabledType), @(menuItemDisabledType), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    
    if (self.isSecureTextEntry || (self.menuItemDisabledType & ZJMenuItemDisabledTypeAll)) {
        [UIMenuController sharedMenuController].menuVisible = NO;
        return NO;
    }
    else {
        if (action == @selector(cut:)
            && (self.menuItemDisabledType & ZJMenuItemDisabledTypeCut)) {
            return NO;
        }
        else if (action == @selector(copy:)
                 && (self.menuItemDisabledType & ZJMenuItemDisabledTypeCopy)) {
            return NO;
        }
        else if (action == @selector(paste:)
                 && (self.menuItemDisabledType & ZJMenuItemDisabledTypePaste)) {
            return NO;
        }
        else if (action == @selector(delete:)
                 && (self.menuItemDisabledType & ZJMenuItemDisabledTypeDelete)) {
            return NO;
        }
        else if (action == @selector(select:)
                 && (self.menuItemDisabledType & ZJMenuItemDisabledTypeSelect)) {
            return NO;
        }
        else if (action == @selector(selectAll:)
                 && (self.menuItemDisabledType & ZJMenuItemDisabledTypeSelectAll)) {
            return NO;
        }
    }
    return [super canPerformAction:action withSender:sender];
}



@end
