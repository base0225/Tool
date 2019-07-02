//
//  NSTimer+ZJExtension.h
//  ZJTool
//
//  Created by zhujia on 2019/7/2.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (ZJExtension)

/**
 *  暂停计时器
 */
- (void)pauseTimer;

/**
 *  重启计时器
 */
- (void)resumeTimer;

/**
 *  多少时间后重启计时器
 *
 *  @param interval 间隔时间
 */
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end

NS_ASSUME_NONNULL_END
