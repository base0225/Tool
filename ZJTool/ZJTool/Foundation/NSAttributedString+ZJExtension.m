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
