//
//  ZJFileCacheManager.m
//  ZJTool
//
//  Created by zhujia on 2019/8/23.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import "ZJFileCacheManager.h"

static NSDictionary *gradeNameMap = nil;
static NSDictionary *businessMap = nil;

@implementation ZJFileCacheManager

/*
 *  根据 业务类型(business) 以及对应的 缓存等级 (gradeType)
 *  生成对应的文件存储路径 如：Doucoment/lowGradeCache/hotel
 */
+ (NSString *)fileCachePath:(ZJFileCacheGrade)gradeType business:(ZJFileCacheBusinessType)business {
    [ZJFileCacheManager prepareMap];
    NSString *path = @"";
    NSString *documentFilePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *gradePath = gradeNameMap[@(gradeType)] ? : @"low";
    NSString *businessPath = businessMap[@(business)] ? : @"";
    path = [NSString stringWithFormat:@"%@/%@/%@",documentFilePath, gradePath, businessPath];
    NSError *error = nil;
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    return  error ? nil : path;
}

///清除对应级别的文件缓存 不会清除high等级的缓存
+ (void)clearFileCache:(ZJFileCacheGrade)gradeType complete:(void(^)(BOOL complete))complete {
    NSError *error = nil;
    if (gradeType != ZJFileCacheGradeHigh) { //不清最高级别
        [ZJFileCacheManager prepareMap];
        NSString *documentFilePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        NSString *gradePath = gradeNameMap[@(gradeType)];
        if (gradePath && gradePath.length > 0) {
            NSString *path = [NSString stringWithFormat:@"%@/%@",documentFilePath, gradePath];
            if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
            }
        }
    }
    
    if (complete) {
        BOOL isDone = !error;
        complete(isDone);
    }
}

+ (void)prepareMap {
    if (!gradeNameMap) {
        gradeNameMap = @{@(ZJFileCacheGradeLow) : @"lowGradeCache",
                         @(ZJFileCacheGradeMedium) : @"mediumGradeCache",
                         @(ZJFileCacheGradeHigh) : @"highGradeCache",
                         };
    }
    
    if (!businessMap) {
        businessMap = @{@(ZJFileCacheBusinessCommon) : @"common",
                        @(ZJFileCacheBusinessTravel) : @"travel",
                        @(ZJFileCacheBusinessDetail) : @"detail",
                        @(ZJFileCacheBusinessHotel) : @"hotel",
                        @(ZJFileCacheBusinessTraffic) : @"traffic",
                        @(ZJFileCacheBusinessAirPlane) : @"airplane",
                        };
    }
}

@end
