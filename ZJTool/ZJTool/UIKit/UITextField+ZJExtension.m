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

- (void)zj_configDoneWithWidth:(CGFloat)width
{
    self.inputAccessoryView = [self zj_doneViewWithWidth:width];
}

- (UIView *)zj_doneViewWithWidth:(CGFloat)width
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 43.0f)];
    view.backgroundColor = [UIColor whiteColor];
    
    UIButton *doneButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80.0f, 43.0f)];
    [doneButton setTitle:@"完成" forState:UIControlStateNormal];
    [doneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    doneButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
//    doneButton.right = view.width;
    doneButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    doneButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    doneButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 9.0f);
    [doneButton addTarget:self action:@selector(tnh_doneClicked:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:doneButton];
    
    return view;
}

- (void)tnh_doneClicked:(id)sender
{
    [self endEditing:YES];
}


@end
