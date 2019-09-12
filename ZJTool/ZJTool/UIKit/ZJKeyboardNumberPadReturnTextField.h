//
//  ZJKeyboardNumberPadReturnTextField.h
//  ZJTool
//
//  Created by zhujia on 2019/9/12.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KeyboardDoneTappedDelegate <NSObject>

@optional
- (void)doneTapped:(id)sender;

@end

@interface ZJKeyboardNumberPadReturnTextField : UITextField

{
    UIButton *_doneButton;
    id <KeyboardDoneTappedDelegate> __unsafe_unretained _doneButtonDelegate;
}

@property (nonatomic, strong) UIButton *doneButton;

@property (nonatomic, unsafe_unretained) id <KeyboardDoneTappedDelegate> doneButtonDelegate;

@end

NS_ASSUME_NONNULL_END
