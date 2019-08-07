//
//  NSDate+ZJExtension.m
//  ZJTool
//
//  Created by zhujia on 2019/8/7.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import "NSDate+ZJExtension.h"

static NSDictionary *weakDayStringDic = nil;

@implementation NSDate (ZJExtension)

- (NSDate *)zj_dateByAddingMonth:(NSInteger)months
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = months;
    return [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
}

- (NSDate *)zj_dateByAddingDay:(NSInteger)days
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
}

- (NSDate *)zj_dateByAddingMinute:(NSInteger)minute
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.minute = minute;
    return [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
}

- (NSString *)zj_weekDayString
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        weakDayStringDic = @{@1:@"周日",
                             @2:@"周一",
                             @3:@"周二",
                             @4:@"周三",
                             @5:@"周四",
                             @6:@"周五",
                             @7:@"周六"};
    });
    
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitWeekday
                                                                       fromDate:self];
    return weakDayStringDic[@(dateComponents.weekday)];
}

- (NSInteger)zj_year
{
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitYear
                                                                       fromDate:self];
    return dateComponents.year;
    
}

- (NSInteger)zj_month
{
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth
                                                                       fromDate:self];
    return dateComponents.month;
    
}

- (NSInteger)zj_day
{
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitDay
                                                                       fromDate:self];
    return dateComponents.day;
}

- (NSInteger)zj_hour
{
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitHour
                                                                       fromDate:self];
    return dateComponents.hour;
}

- (NSInteger)zj_minute
{
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitMinute
                                                                       fromDate:self];
    return dateComponents.minute;
}

- (NSInteger)zj_second
{
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitSecond
                                                                       fromDate:self];
    return dateComponents.second;
}

+ (long long)zj_dateStampFrom1970
{
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970] * 1000;
    return time;
};

+ (NSDate *)zj_dateFromNormalDateString:(NSString *)dateString{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    dateFormatter = nil;
    
    return destDate;
}

+ (NSDate *)zj_dateFromDateString:(NSString *)dateString withFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: dateFormat];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    dateFormatter = nil;
    
    return destDate;
}

- (NSString *)zj_stringFromNormalDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    
    NSString *stringFromDate = [formatter stringFromDate:self];
    
    return stringFromDate;
}

- (NSString *)zj_stringFromDateWithFormat:(NSString *)dateFormat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    
    NSString *stringFromDate = [formatter stringFromDate:self];
    
    return stringFromDate;
}

- (BOOL)zj_isEarlierThan:(NSDate *)date
{
    if (self.timeIntervalSince1970 < date.timeIntervalSince1970) {
        return YES;
    }
    return NO;
}

- (BOOL)zj_isEarlierThanOrEqualTo:(NSDate *)date
{
    if (self.timeIntervalSince1970 <= date.timeIntervalSince1970) {
        return YES;
    }
    return NO;
}

- (BOOL)zj_isLaterThan:(NSDate *)date
{
    if (self.timeIntervalSince1970 > date.timeIntervalSince1970) {
        return YES;
    }
    return NO;
}

- (BOOL)zj_isLaterThanOrEqualTo:(NSDate *)date
{
    if (self.timeIntervalSince1970 >= date.timeIntervalSince1970) {
        return YES;
    }
    return NO;
}
@end
