//
//  ZJDateFormatHelper.h
//  ZJTool
//
//  Created by zhujia on 2019/7/19.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  日期类型枚举
 */
typedef NS_ENUM(NSInteger, TNDateFormatType) {
    TNDateFormatTypeDefault = 0,  //2014-02-03
    TNDateFormatTypeNum,          //20140203
    TNDateFormatTATimeStamp,      //yyyy-MM-dd HH:mm:ss
    TNDateFormatWeek,             //Tuesday, Tue
    TNDateFormatBenchmark         //yyyyMMddHHmmssSSS
};

/**
 *  日历类型枚举
 */
typedef NS_ENUM(NSInteger, TNCalendarFormatType) {
    TNCalendarFormatTypeGregorian = 0,  //公历
    TNCalendarFormatTypeJapanese,       //日本日历
    TNCalendarFormatTypeBuddhist        //佛教日历
};



/**
 *  处理日期格式转换的工具类
 */
@interface ZJDateFormatHelper : NSObject

+ (ZJDateFormatHelper *)sharedInstance;

/**
 *  NSDate格式转化为日期字符串
 *
 *  @param date           NSDate
 *  @param dataFormatType 日期格式
 *
 *  @return 日期字符串
 */
- (NSString *)stringOfDate:(NSDate *)date dateFormatType:(TNDateFormatType)dataFormatType;

/**
 *  NSDate根据指定的日历格式转化为日期字符串
 *
 *  @param date           NSDate
 *  @param dataFormatType 日期格式
 *  @param calendarTtype  日历格式
 *
 *  @return 日期字符串
 */
- (NSString *)stringOfDate:(NSDate *)date dateFormatType:(TNDateFormatType)dataFormatType calendarType:(TNCalendarFormatType)calendarType;


/**
 *  日期字符串转换为NSDate
 *
 *  @param dateString     日期字符串
 *  @param dataFormatType 日期格式
 *
 *  @return NSDate
 */
- (NSDate *)dateFromString:(NSString *)dateString dateFormatType:(TNDateFormatType)dataFormatType;

/**
 *  日期字符串根据指定的日历格式转换为NSDate
 *
 *  @param dateString     日期字符串
 *  @param dataFormatType 日期格式
 *  @param calendarTtype  日历格式
 *
 *  @return NSDate
 */
- (NSDate *)dateFromString:(NSString *)dateString dateFormatType:(TNDateFormatType)dataFormatType calendarType:(TNCalendarFormatType)calendarType;


/**
 *  根据NSDate获取年份、月份和星期几
 *
 *  @param date NSDate
 *
 *  @return 字典类型 @{ @"year":  @([components year]),
 *                     @"month": @([components month]),
 *                     @"day":   @([components day]),};
 */
- (NSDictionary *)dictionaryOfDate:(NSDate *)date;

/**
 *  根据指定的日历格式获取NSDate中的年份、月份和星期几
 *
 *  @param date NSDate
 *  @param calendarTtype  日历格式
 *
 *  @return 字典类型 @{ @"year":  @([components year]),
 *                     @"month": @([components month]),
 *                     @"day":   @([components day]),};
 */
- (NSDictionary *)dictionaryOfDate:(NSDate *)date calendarType:(TNCalendarFormatType)calendarType;

@end

NS_ASSUME_NONNULL_END
