//
//  ZJStepper.m
//  ZJTool
//
//  Created by zhujia on 2019/9/12.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import "ZJStepper.h"
#import "ZJKeyboardNumberPadReturnTextField.h"

#import "ZJ_UtilsMacro_h.h"
#import "UIView+Positioning.h"

#define kActionButtonSize CGSizeMake(35, 35)
#define KValueLabelSize CGSizeMake(40, 25)
static int const privateKVOContext;

@interface ZJStepper ()<UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *backgroundView;
@property (nonatomic, strong) UIButton *minusButton;
@property (nonatomic, strong) UIButton *plusButton;
@property (nonatomic, strong) UILabel *valueLabel;

@property (nonatomic, strong) ZJKeyboardNumberPadReturnTextField *valueTextField;

@end

@implementation ZJStepper

#pragma mark - Init & dealloc
- (void)commonInitWithIsCanManualInput:(BOOL)isCan
{
    _maximumValue = 0;
    _minimumValue = 0;
    _value = 0;
    _stepValue = 1;
    _isManualInput = isCan;
    self.backgroundColor = [UIColor clearColor];
    
    _minusButton = [[UIButton alloc] init];
    [_minusButton setImage:[UIImage imageNamed:@"base_number_picker_minus"]
                  forState:UIControlStateNormal];
    [_minusButton setImage:[UIImage imageNamed:@"base_number_picker_minus_disabled"] forState:UIControlStateDisabled];
    _minusButton.enabled = NO;
    [_minusButton addTarget:self
                     action:@selector(actionButtonClicked:)
           forControlEvents:UIControlEventTouchUpInside];
    _minusButton.contentMode = UIViewContentModeCenter;
    [self addSubview:_minusButton];
    
    _backgroundView = [[UIImageView alloc] init];
    _backgroundView.image = [UIImage imageNamed:@"base_number_container"];
    
    if (!_isManualInput) {
        _valueLabel = [[UILabel alloc] init];
        _valueLabel.backgroundColor = ZJ_COLOR_APP_BACKGROUND;
        _valueLabel.textAlignment = NSTextAlignmentCenter;
        _valueLabel.textColor = [UIColor blackColor];
        _valueLabel.font = [UIFont systemFontOfSize:14.0f];
        _valueLabel.text = [NSString stringWithFormat:@"%@", @(_value)];
        [self addSubview:_valueLabel];
    }
    
    //可以手动输入
    if (_isManualInput) {
        _valueTextField = [[ZJKeyboardNumberPadReturnTextField alloc] init];
        _valueTextField.text = [NSString stringWithFormat:@"%@", @(_value)];
        _valueTextField.delegate = self;
        _valueTextField.textAlignment = NSTextAlignmentCenter;
        _valueTextField.backgroundColor = [UIColor whiteColor];
        _valueTextField.keyboardType = UIKeyboardTypeNumberPad;
        _valueTextField.returnKeyType = UIReturnKeyDone;
        _valueTextField.textColor = [UIColor blackColor];
        _valueTextField.font = [UIFont systemFontOfSize:14.0f];
        [_valueTextField addTarget:self action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
        [self addSubview:_valueTextField];
    }
    
    _plusButton = [[UIButton alloc] init];
    [_plusButton setImage:[UIImage imageNamed:@"base_number_picker_plus"]
                 forState:UIControlStateNormal];
    [_plusButton setImage:[UIImage imageNamed:@"base_number_picker_plus_disabled"] forState:UIControlStateDisabled];
    _plusButton.enabled = NO;
    [_plusButton addTarget:self
                    action:@selector(actionButtonClicked:)
          forControlEvents:UIControlEventTouchUpInside];
    _plusButton.contentMode = UIViewContentModeCenter;
    [self addSubview:_plusButton];
    
    [self addObserver:self forKeyPath:@"value" options:0 context:(void *)&privateKVOContext];
    [self addObserver:self forKeyPath:@"maximumValue" options:0 context:(void *)&privateKVOContext];
    [self addObserver:self forKeyPath:@"minimumValue" options:0 context:(void *)&privateKVOContext];
}

- (id)initWithFrame:(CGRect)frame WithIsCanManualInput:(BOOL)isCan
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInitWithIsCanManualInput:isCan];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInitWithIsCanManualInput:NO];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self commonInitWithIsCanManualInput:NO];
    }
    return self;
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"value"];
    [self removeObserver:self forKeyPath:@"maximumValue"];
    [self removeObserver:self forKeyPath:@"minimumValue"];
}

#pragma mark - layout

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.minusButton.x = -5;
    self.minusButton.y = -5;
    self.minusButton.size = kActionButtonSize;
    
    if (!_isManualInput) {
        self.valueLabel.x = self.minusButton.right-5;
        self.valueLabel.y = 0;
        self.valueLabel.size = KValueLabelSize;
    }
    
    if (_isManualInput) {
        self.valueTextField.x = self.minusButton.right-5;
        self.valueTextField.y = 0;
        self.valueTextField.size = KValueLabelSize;
    }
    
    self.backgroundView.frame = _isManualInput?self.valueTextField.frame:self.valueLabel.frame;
    
    self.plusButton.x = _isManualInput?self.valueTextField.right-5:self.valueLabel.right-5;
    self.plusButton.y = -5;
    self.plusButton.size = kActionButtonSize;
    
    self.width = self.plusButton.right;
    self.height = 25;
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context != &privateKVOContext)
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    if (object != self)
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    if (![keyPath isEqualToString:@"value"]
        && ![keyPath isEqualToString:@"maximumValue"]
        && ![keyPath isEqualToString:@"minimumValue"])
    {
        return;
    }
    // value改变后，强制恢复最初默认的步长，只有在点击加减号的时候，根据特殊需求临时性的改变步长
    if (self.delegate && [self.delegate respondsToSelector:@selector(resumStepvalueAfterStepperValueChanged:)]) {
        [self.delegate resumStepvalueAfterStepperValueChanged:self];
    }
    
    if ([keyPath isEqualToString:@"value"])
    {
        if (!_isManualInput) {
            self.valueLabel.text = [NSString stringWithFormat:@"%@", @(self.value)];
        }
        else{
            self.valueTextField.text = [NSString stringWithFormat:@"%@", @(self.value)];
        }
    }
    
    self.plusButton.enabled = !(self.value + self.stepValue > self.maximumValue);
    
    if (_isManualInput) {
        self.minusButton.enabled = !(self.value - self.stepValue < self.minimumValue);
    }
    else{
        self.minusButton.enabled = !(self.value - self.stepValue < self.minimumValue);
    }
}

#pragma mark ----UITextFieldDelegate
- (void)textFieldDidChanged:(id)sender
{
    UITextField *textField = (UITextField *)sender;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TextFieldUnReasonableVauleNotification" object:nil userInfo:[NSDictionary dictionaryWithObject:textField.text forKey:@"textFieldValue"]];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.valueTextField){
        self.value = [textField.text integerValue];
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

#pragma mark - Button action
- (void)actionButtonClicked:(id)sender
{
    ZJSTEPPER_BTN_TYPE btnType = ZJSTEPPER_BTN_TYPE_PLUS;
    if (self.minusButton == sender) {
        btnType = ZJSTEPPER_BTN_TYPE_MINUS;
    } else if (self.plusButton == sender) {
        btnType = ZJSTEPPER_BTN_TYPE_PLUS;
    }
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(stepper:plusOrMinusButtonDidClicked:)]){
        [self.delegate stepper:self plusOrMinusButtonDidClicked:btnType];
    }
    
    if (self.minusButton == sender)
    {
        self.value -= self.stepValue;
    }
    else if (self.plusButton == sender)
    {
        self.value += self.stepValue;
    }
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)inputBecomeFirstResponder
{
    [_valueTextField becomeFirstResponder];
}

- (BOOL)inputIsFirstResponder
{
    if ([_valueTextField isFirstResponder]) {
        return YES;
    }
    
    return NO;
}

- (void)inputResignFirstResponder
{
    if ([_valueTextField isFirstResponder]) {
        [_valueTextField resignFirstResponder];
    }
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    if (enabled == YES) {
        self.plusButton.enabled = (self.value == self.maximumValue) ? NO : YES;
        self.minusButton.enabled = (self.value == self.minimumValue) ? NO : YES;
    } else {
        self.plusButton.enabled = NO;
        self.minusButton.enabled = NO;
    }
    self.valueTextField.enabled = enabled;
}

@end
