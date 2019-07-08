//
//  NSString+ZJExtension.h
//  ZJTool
//
//  Created by zhujia on 2019/7/8.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NSString *MPHexStringFromBytes(void *bytes, NSUInteger len);

@interface NSString (ZJExtension)

/**
 *  判断字符串是否为空或nil，
 *
 *  @param str 字符串
 *
 *  @return 是／否
 */
+ (BOOL)isNilOrEmpty:(NSString *)str;

/**
 *  判断字符串是否只有空格
 *
 *  @return 是／否
 */
- (BOOL)isEmpty;

/**
 *  判断字符串是否只有空格，（根据是否忽略头尾）
 *
 *  @param ignoreWhitespace 是否忽略头尾空格
 *
 *  @return 是／否
 */
- (BOOL)isEmptyIgnoringWhitespace:(BOOL)ignoreWhitespace;

/**
 *  去除头尾空格
 *
 *  @return 字符串
 */
- (NSString *)stringByTrimmingWhitespace;

/**
 *  MD5编码
 *
 *  @return 字符串
 */
- (NSString *)MD5Hash;
/**
 *  SHA1编码
 *
 *  @return 字符串
 */
- (NSString *)SHA1Hash;
/**
 *  32位MD5编码
 *
 *  @return 字符串
 */
- (NSString *)MD5Hash32bit;
/**
 *  单词个数
 *
 *  @return 数目
 */
- (NSInteger)countWord;
/**
 *  计算字符串字节长度
 *
 *  @param strtemp 字符串
 *
 *  @return 长度
 */
- (NSInteger)convertToInt:(NSString*)strtemp;

@end

#pragma mark NSMutableString TNExtends
@interface NSMutableString(TNExtends)

/**
 *  去除某一部分字符
 *
 *  @param aCharacterSet 设置要去除的部分
 */
- (void)trimCharactersInSet:(NSCharacterSet *)aCharacterSet;


@end

NS_ASSUME_NONNULL_END
