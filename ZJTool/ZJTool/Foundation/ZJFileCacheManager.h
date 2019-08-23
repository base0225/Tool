//
//  ZJFileCacheManager.h
//  ZJTool
//
//  Created by zhujia on 2019/8/23.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ZJFileCacheGrade) {
    ZJFileCacheGradeLow = 0,  //随时清除
    ZJFileCacheGradeMedium,  //仅在需要清理所有缓存的时候清理
    ZJFileCacheGradeHigh,  //长期保留
};

typedef NS_ENUM(NSInteger, ZJFileCacheBusinessType) {
    ZJFileCacheBusinessCommon = 0,  //通用业务
    ZJFileCacheBusinessTravel,  //聚合 首页/搜索 等
    ZJFileCacheBusinessDetail,  //详情
    ZJFileCacheBusinessHotel, //酒店
    ZJFileCacheBusinessTraffic, //交通
    ZJFileCacheBusinessAirPlane, //机票
};

@interface ZJFileCacheManager : NSObject

/*
 *  根据 业务类型(business) 以及对应的 缓存等级 (gradeType)
 *  生成对应的文件存储路径 如果传入参数有误 会默认返回 Doucoment/lowGradeCache/common
 *  注意： 如果路径不存在且创建失败 返回nil 外部最好做下判空处理
 */
+ (NSString *)fileCachePath:(ZJFileCacheGrade)gradeType business:(ZJFileCacheBusinessType)business;

///清除对应级别的文件缓存 不会清除high等级的缓存
+ (void)clearFileCache:(ZJFileCacheGrade)gradeType complete:(void(^)(BOOL complete))complete;

@end

NS_ASSUME_NONNULL_END
