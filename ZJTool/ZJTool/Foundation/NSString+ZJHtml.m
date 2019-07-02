//
//  NSString+ZJHtml.m
//  ZJTool
//
//  Created by zhujia on 2019/7/2.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import "NSString+ZJHtml.h"

@implementation NSString (ZJHtml)


/**
 *  去除字符串里的h5标签
 *  从TTNCar移入
 */
+ (NSString *)zj_planTextWithHtml:(NSString *)html{
    
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    //    NSString * regEx = @"<([^>]*)>";
    //    html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    return html;
}

/**
 *  去除字符串里的h5标签 保留换行符
 *  从TTNCar移入
 */
+ (NSString *)zj_planTextAndLineFeedWithHtml:(NSString *)html{
    
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        if ([text isEqualToString:@"<br /"]) {
            html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@"\n"];
        } else {
            html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
        }
    }
    //    NSString * regEx = @"<([^>]*)>";
    //    html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    return html;
}


@end
