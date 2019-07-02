//
//  NSString+ZJHtml.h
//  ZJTool
//
//  Created by zhujia on 2019/7/2.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ZJHtml)

/**
 *  去除字符串里的h5标签
 *  从TTNCar移入
 */
+ (NSString *)zj_planTextWithHtml:(NSString *)html;

/**
 *  去除字符串里的h5标签 保留换行符
 *  从TTNCar移入
 */
+ (NSString *)zj_planTextAndLineFeedWithHtml:(NSString *)html;

@end

NS_ASSUME_NONNULL_END
