//
//  NSArray+ZJExtension.m
//  ZJTool
//
//  Created by 朱佳 on 2019/6/18.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import "NSArray+ZJExtension.h"
#import <objc/runtime.h>

@implementation NSArray (ZJExtension)

- (id)safeObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count)
        return nil;
    
    return [self objectAtIndex:index];
}

+ (BOOL)isNilorEmpty:(NSArray *)array{
    if (!array || ![array isKindOfClass:[NSArray class]] || array.count <1) {
        return YES;
    }
    return NO;
}

- (id)zj_objectAtIndex:(NSUInteger)index
{
    if (index >= self.count)
    {
        NSStringFromClass([self class]);
        NSStringFromSelector(_cmd);
        return nil;
    }
    
    return [self objectAtIndex:index];
}

+ (id)zj_arrayWithObjects:(const id [])objects count:(NSUInteger)cnt
{
    id validObjects[cnt];
    NSUInteger count = 0;
    for (NSUInteger i = 0; i < cnt; i++)
    {
        if (objects[i])
        {
            validObjects[count] = objects[i];
            count++;
        }
        else
        {
            NSStringFromClass([self class]);
            NSStringFromSelector(_cmd);
        }
    }
    
    return [self arrayWithObjects:validObjects count:count];
}

@end
