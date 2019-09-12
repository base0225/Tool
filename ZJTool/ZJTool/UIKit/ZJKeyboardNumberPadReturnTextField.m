//
//  ZJKeyboardNumberPadReturnTextField.m
//  ZJTool
//
//  Created by zhujia on 2019/9/12.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import "ZJKeyboardNumberPadReturnTextField.h"
#import "ZJ_UtilsMacro_h.h"
#import "UIView+Positioning.h"

@implementation ZJKeyboardNumberPadReturnTextField

@synthesize doneButton = _doneButton;
@synthesize doneButtonDelegate = _doneButtonDelegate;

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(keyboardDidShow:) object:nil];
    
    _doneButton = nil;
}

- (UIButton *)doneButton
{
    if (_doneButton == nil)
    {
        _doneButton = [[UIButton alloc] init];
        
        _doneButton.frame = CGRectMake(0, 163, 414/3, 54);
        
        _doneButton.adjustsImageWhenHighlighted = NO;
        
        _doneButton.hidden = NO;
        [_doneButton setTitle:@"完成" forState:UIControlStateNormal];
        if (iPhone6) {
            _doneButton.titleEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
        }
        
        if (iPhone6p) {
            _doneButton.titleEdgeInsets = UIEdgeInsetsMake(15, 0, 0, 0);
        }
        if (iPhone5 || iPhone4s) {
            _doneButton.titleEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
        }
        [_doneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        _doneButton.userInteractionEnabled = YES;
        
        [_doneButton addTarget:self action:@selector(doneButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneButton;
}

- (void)setup
{
    self.keyboardType = UIKeyboardTypeNumberPad;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
}

- (void)setKeyboardType:(UIKeyboardType)keyboardType
{
    [super setKeyboardType:UIKeyboardTypeNumberPad];
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self setup];
    }
    return self;
}

- (void)addDoneButtonToKeyboard
{
    UIWindow *tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
    
    for (UIView *keyboard in tempWindow.subviews)
    {
        NSString *keyboardStr = [keyboard description];
        if ([keyboardStr hasPrefix:@"<UI"]) {
            keyboardStr = [keyboardStr substringFromIndex:3];
            NSString *perStr = @"Peripheral";
            NSString *perHostStr = [perStr stringByAppendingString:@"HostView"];
            if ([[keyboard description] hasPrefix:perStr] ||
                [[keyboard description] hasPrefix:perHostStr] ||
                [[keyboard description] hasPrefix:@"InputSetContainerView"])
            {
                self.doneButton.bottom = keyboard.height;
                [keyboard addSubview:self.doneButton];
            }
        }
    }
}

- (void)keyboardDidShow:(NSNotification *)note
{
    //create custom button
    if ([self isFirstResponder])
    {
        [self addDoneButtonToKeyboard];
    }
}

- (void)keyboardWillShow:(NSNotification *)note
{
    if (![self isFirstResponder] && self.doneButton.superview != nil)
    {
        [self.doneButton removeFromSuperview];
    }
}

- (void)doneButtonPressed:(id)sender
{
    if ([_doneButtonDelegate conformsToProtocol:@protocol(KeyboardDoneTappedDelegate)])
    {
        if ([_doneButtonDelegate respondsToSelector:@selector(doneTapped:)])
        {
            [_doneButtonDelegate doneTapped:(id)sender];
        }
        else
        {
            [self resignFirstResponder];
        }
    }
    else
    {
        [self resignFirstResponder];
    }
}

- (BOOL)canBecomeFirstResponder
{
    NSArray *windows = [[UIApplication sharedApplication] windows];
    
    if ([windows count] < 2) {
        
        if ([self.delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
            return [self.delegate textFieldShouldBeginEditing:self];
        }
        return YES;
    }
    
    [self performSelector:@selector(keyboardDidShow:) withObject:nil afterDelay:0.02];
    
    if ([self.delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [self.delegate textFieldShouldBeginEditing:self];
    }
    return YES;
}

- (BOOL)canResignFirstResponder
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(keyboardDidShow:) object:nil];
    [self.doneButton removeFromSuperview];
    
    return YES;
}

@end
