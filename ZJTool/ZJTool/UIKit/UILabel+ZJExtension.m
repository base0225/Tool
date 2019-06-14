//
//  UILabel+ZJExtension.m
//  ZJTool
//
//  Created by 朱佳 on 2019/6/14.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import "UILabel+ZJExtension.h"

@implementation UILabel (ZJExtension)

- (void)zj_autoResetHeightByWidth:(CGFloat)restWidth text:(NSString *)text
{
    self.numberOfLines = 0;
    self.lineBreakMode = NSLineBreakByCharWrapping;
    CGSize size = [self calculateLabelSizeWithTitle:text font:self.font constrainedToSize:CGSizeMake(restWidth, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
    size.height += 3;
    CGRect frame = self.frame;
    frame.size.height = size.height;
    self.frame = frame;
}

- (void)zj_autoResetHeightByWidth:(CGFloat)restWidth text:(NSString *)text miniHeight:(CGFloat)miniheight
{
    self.numberOfLines = 0;
    self.lineBreakMode = NSLineBreakByCharWrapping;
    CGSize size = [self calculateLabelSizeWithTitle:text font:self.font constrainedToSize:CGSizeMake(restWidth, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
    size.height += 3;
    if (size.height < miniheight + 3) {
        size.height = miniheight;
    }
    
    CGRect frame = self.frame;
    frame.size.height = size.height;
    self.frame = frame;
}

- (void)zj_autoResetHeightByWidth:(CGFloat)restWidth text:(NSString *)text oneLineHeight:(CGFloat )height
{
    self.numberOfLines = 0;
    self.lineBreakMode = NSLineBreakByCharWrapping;
    CGSize size = [self calculateLabelSizeWithTitle:text font:self.font constrainedToSize:CGSizeMake(restWidth, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
    CGRect frame = self.frame;
    frame.size.height = size.height * height / self.font.lineHeight;
    self.frame = frame;
}

- (CGFloat)zj_calculateHeightByWidth:(CGFloat)width text:(NSString *)text
{
    self.numberOfLines = 0;
    self.lineBreakMode = NSLineBreakByCharWrapping;
    CGSize size = [self calculateLabelSizeWithTitle:text font:self.font constrainedToSize:CGSizeMake(width, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
    return size.height;
}

- (void)zj_autoResetWidth
{
    self.lineBreakMode = NSLineBreakByCharWrapping;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGSize size = CGSizeMake(screenWidth,self.frame.size.height);
    NSString * textString = self.text;
    CGSize labelsize = [self calculateLabelSizeWithTitle:textString font:self.font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, labelsize.width, self.frame.size.height );
}

- (CGSize)calculateLabelSizeWithTitle:(NSString *)title font:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    if (title.length == 0) {
        return CGSizeZero;
    }
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = lineBreakMode;
    
    CGRect frame = [title boundingRectWithSize:size
                                       options:NSStringDrawingUsesLineFragmentOrigin
                                    attributes:@{
                                                 NSFontAttributeName:font,
                                                 NSParagraphStyleAttributeName:paragraph
                                                 }
                                       context:nil];
    return frame.size;
}
@end
