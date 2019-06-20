//
//  NSAttributedString+ZJExtension.m
//  ZJTool
//
//  Created by 朱佳 on 2019/6/19.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import "NSAttributedString+ZJExtension.h"
#import <CoreText/CoreText.h>


@implementation NSAttributedString (ZJExtension)

+ (instancetype)zj_attributedStringWithString:(NSString*)string
{
    if (string)
    {
        return [[self alloc] initWithString:string];
    }
    else
    {
        return nil;
    }
}

+ (instancetype)zj_attributedStringWithAttributedString:(NSAttributedString*)attrStr
{
    if (attrStr)
    {
        return [[self alloc] initWithAttributedString:attrStr];
    }
    else
    {
        return nil;
    }
}

- (instancetype)zj_initWithString:(NSString *)str
{
    str = str ? str : @"";
    return [self initWithString:str];
}

- (instancetype)zj_initWithString:(NSString *)str attributes:(NSDictionary<NSString *, id> *)attrs
{
    str = str ? str : @"";
    return [self initWithString:str attributes:attrs];
}

- (CGSize)zj_sizeConstrainedToSize:(CGSize)maxSize
{
    return [self zj_sizeConstrainedToSize:maxSize fitRange:NULL];
}

- (CGSize)zj_sizeConstrainedToSize:(CGSize)maxSize fitRange:(NSRange*)fitRange
{
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)self);
    CGSize sz = CGSizeMake(0.f, 0.f);
    if (framesetter)
    {
        CFRange fitCFRange = CFRangeMake(0,0);
        sz = CTFramesetterSuggestFrameSizeWithConstraints(framesetter,CFRangeMake(0,0),NULL,maxSize,&fitCFRange);
        sz = CGSizeMake( floor(sz.width+1) , floor(sz.height+1) ); // take 1pt of margin for security
        CFRelease(framesetter);
        
        if (fitRange)
        {
            *fitRange = NSMakeRange((NSUInteger)fitCFRange.location, (NSUInteger)fitCFRange.length);
        }
    }
    return sz;
}

@end


@implementation NSMutableAttributedString (EasyToUse)

 - (void)zj_setFont:(UIFont*)font
{
    [self zj_setFontName:font.fontName size:font.pointSize];
}

- (void)zj_setFontName:(NSString*)fontName size:(CGFloat)size
{
    [self zj_setFontName:fontName size:size range:NSMakeRange(0,[self length])];
}

- (void)zj_setFontName:(NSString*)fontName size:(CGFloat)size range:(NSRange)range
{
    [self removeAttribute:NSFontAttributeName range:range];
    [self addAttribute:NSFontAttributeName value:[UIFont fontWithName:fontName size:size] range:range];
}

- (void)zj_setTextColor:(UIColor*)color
{
    [self zj_setTextColor:color range:NSMakeRange(0,[self length])];
}

- (void)zj_setTextColor:(UIColor*)color range:(NSRange)range
{
    [self removeAttribute:NSForegroundColorAttributeName range:range];
    [self addAttribute:NSForegroundColorAttributeName value:color range:range];
}

- (void)zj_setTextStrikethroughStyle:(NSUnderlineStyle)style
{
    [self zj_setTextStrikethroughStyle:style range:NSMakeRange(0, self.length)];
}

- (void)zj_setTextStrikethroughStyle:(NSUnderlineStyle)style range:(NSRange)range
{
    [self removeAttribute:NSStrikethroughStyleAttributeName range:range];
    [self addAttribute:NSStrikethroughStyleAttributeName value:@(style) range:range];
}

- (void)zj_setTextUnderLineStyle:(NSUnderlineStyle)style
{
    [self zj_setTextUnderLineStyle:style range:NSMakeRange(0, self.length)];
}

- (void)zj_setTextUnderLineStyle:(NSUnderlineStyle)style range:(NSRange)range
{
    [self removeAttribute:NSUnderlineStyleAttributeName range:range];
    [self addAttribute:NSUnderlineStyleAttributeName value:@(style) range:range];
}

- (void)zj_modifyParagraphStylesWithBlock:(void (^)(NSMutableParagraphStyle *paragraphStyle))block
{
    [self zj_modifyParagraphStylesInRange:NSMakeRange(0, self.length) withBlock:block];
}

- (void)zj_modifyParagraphStylesInRange:(NSRange)range withBlock:(void (^)(NSMutableParagraphStyle *))block
{
    NSParameterAssert(block != nil);
    
    NSRangePointer rangePtr = &range;
    NSUInteger loc = range.location;
    [self beginEditing];
    while (NSLocationInRange(loc, range))
    {
        NSParagraphStyle *paraStyle = [self attribute:NSParagraphStyleAttributeName
                                              atIndex:loc
                                longestEffectiveRange:rangePtr
                                              inRange:range];
        if (!paraStyle)
        {
            paraStyle = [NSParagraphStyle defaultParagraphStyle];
        }
        NSMutableParagraphStyle *mutableParaStyle = [paraStyle mutableCopy];
        block(mutableParaStyle);
        [self zj_setParagraphStyle:mutableParaStyle range:*rangePtr];
        
        loc = NSMaxRange(*rangePtr);
    }
    [self endEditing];
}

- (void)zj_setParagraphStyle:(NSParagraphStyle *)paragraphStyle
{
    [self zj_setParagraphStyle:paragraphStyle range:NSMakeRange(0, self.length)];
}

- (void)zj_setParagraphStyle:(NSParagraphStyle *)paragraphStyle range:(NSRange)range
{
    [self removeAttribute:NSParagraphStyleAttributeName range:range];
    [self addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
}


@end
