//
//  NSArray+ZJExtension.h
//  ZJTool
//
//  Created by 朱佳 on 2019/6/18.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (ZJExtension)

/**
 *  ＊＊安全＊＊ 根据索引获取数组中元素
 *
 *  @param index 索引
 *
 *  @return 元素（对象）
 */
- (id)safeObjectAtIndex:(NSUInteger)index;

/**
 *  判断数组是否为空
 *
 *  @param array 数组
 *
 *  @return 是／否
 */
+ (BOOL)isNilorEmpty:(NSArray*)array;

//objectAtIndex:index 防护方法
- (id)zj_objectAtIndex:(NSUInteger)index;
//arrayWithObjects:count 防护方法
+ (id)zj_arrayWithObjects:(const id _Nonnull [])objects count:(NSUInteger)cnt;

@end

NS_ASSUME_NONNULL_END
