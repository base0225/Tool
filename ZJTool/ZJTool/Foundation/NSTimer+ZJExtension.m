//
//  NSTimer+ZJExtension.m
//  ZJTool
//
//  Created by zhujia on 2019/7/2.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import "NSTimer+ZJExtension.h"


@implementation NSTimer (ZJExtension)

-(void)pauseTimer
{
    if (![self isValid]) {
        return ;
        
    }
    [self setFireDate:[NSDate distantFuture]];
}

-(void)resumeTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate date]];
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

@end
