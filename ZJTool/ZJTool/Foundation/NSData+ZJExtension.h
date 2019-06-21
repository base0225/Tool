//
//  NSData+ZJExtension.h
//  ZJTool
//
//  Created by 朱佳 on 2019/6/21.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (ZJExtension)
/**
 *  base64编码
 *
 *  @param string 字符串
 *
 *  @return 二进制数据
 */
+ (NSData *)zj_dataWithBase64EncodedString:(NSString *)string;
/**
 *  固定宽度base64编码
 *
 *  @param wrapWidth 宽度
 *
 *  @return 字符串
 */
- (NSString *)zj_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;

/**
 *  base64编码
 *
 *  @return 字符串
 */
- (NSString *)zj_base64EncodedString;

@end

NS_ASSUME_NONNULL_END
