//
//  ZJStepper.h
//  ZJTool
//
//  Created by zhujia on 2019/9/12.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM (NSInteger, ZJSTEPPER_BTN_TYPE){
    ZJSTEPPER_BTN_TYPE_PLUS,   // 加
    ZJSTEPPER_BTN_TYPE_MINUS,  // 减
};

@class ZJStepper;

@protocol ZJStepperDelegate <NSObject>

@optional
- (void)stepper:(ZJStepper *)stepper plusOrMinusButtonDidClicked:(ZJSTEPPER_BTN_TYPE)btnType;
- (void)resumStepvalueAfterStepperValueChanged:(ZJStepper *)stepper;

@end

@interface ZJStepper : UIControl

/**
 *  Default is NO;
 */
@property (nonatomic, assign) BOOL isManualInput;

/**
 *  最大值
 */
@property (nonatomic, assign) NSInteger maximumValue;

/**
 *  最小值
 */
@property (nonatomic, assign) NSInteger minimumValue;

/**
 *  步长
 */
@property (nonatomic, assign) NSInteger stepValue;

/**
 *  当前值
 */
@property (nonatomic, assign) NSInteger value;

/**
 *  代理对象
 */
@property (nonatomic, weak) id<ZJStepperDelegate> delegate;

/**
 *  是否可以手动输入部件的值
 *
 *  @param frame
 *  @param isCan
 *
 *  @return
 */
- (id)initWithFrame:(CGRect)frame WithIsCanManualInput:(BOOL)isCan;
- (BOOL)inputIsFirstResponder;
- (void)inputBecomeFirstResponder;
- (void)inputResignFirstResponder;

@end

NS_ASSUME_NONNULL_END
