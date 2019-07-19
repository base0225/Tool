//
//  ZJDateFormatHelper.m
//  ZJTool
//
//  Created by zhujia on 2019/7/19.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import "ZJDateFormatHelper.h"

@interface ZJDateFormatHelper ()
@property (nonatomic, strong) NSDateFormatter *defaultTypeDateFormatter;
@property (nonatomic, strong) NSDateFormatter *numTypeDateFormatter;
@property (nonatomic, strong) NSDateFormatter *taTimeStrampDateFormatter;
@property (nonatomic, strong) NSDateFormatter *weekDateFormatter;
@property (nonatomic, strong) NSDateFormatter *benchmarkFormatter;

@property (nonatomic, strong) NSCalendar *gregorianCalendar;
@property (nonatomic, strong) NSCalendar *japaneseCalendar;
@property (nonatomic, strong) NSCalendar *buddhistCalendar;
@end

@implementation ZJDateFormatHelper

+ (ZJDateFormatHelper *)sharedInstance
{
    static ZJDateFormatHelper *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[ZJDateFormatHelper alloc] init];
    });
    return _sharedInstance;
}

// NSDate格式转化为日期字符串
- (NSString *)stringOfDate:(NSDate *)date dateFormatType:(TNDateFormatType)dataFormatType
{
    return [self stringOfDate:date dateFormatType:dataFormatType calendarType:TNCalendarFormatTypeGregorian];
}

- (NSString *)stringOfDate:(NSDate *)date dateFormatType:(TNDateFormatType)dataFormatType calendarType:(TNCalendarFormatType)calendarType
{
    NSCalendar *calendar = [self calendarWithType:calendarType];
    NSString *dateString;
    switch (dataFormatType) {
        case TNDateFormatTypeDefault:
        {
            [self.defaultTypeDateFormatter setCalendar:calendar];
            dateString = [self.defaultTypeDateFormatter stringFromDate:date];
        }
            break;
        case TNDateFormatTypeNum:
        {
            [self.numTypeDateFormatter setCalendar:calendar];
            dateString = [self.numTypeDateFormatter stringFromDate:date];
        }
            break;
        case TNDateFormatTATimeStamp:
        {
            [self.taTimeStrampDateFormatter setCalendar:calendar];
            dateString = [self.taTimeStrampDateFormatter stringFromDate:date];
        }
            break;
        case TNDateFormatWeek:
        {
            [self.weekDateFormatter setCalendar:calendar];
            dateString = [self.weekDateFormatter stringFromDate:date];
        }
            break;
        case TNDateFormatBenchmark:
        {
            [self.benchmarkFormatter setCalendar:calendar];
            dateString = [self.benchmarkFormatter stringFromDate:date];
        }
            break;
        default:
            break;
    }
    
    return dateString;
    
}
// 日期字符串转换为NSDate
- (NSDate *)dateFromString:(NSString *)dateString dateFormatType:(TNDateFormatType)dataFormatType
{
    return [self dateFromString:dateString dateFormatType:dataFormatType calendarType:TNCalendarFormatTypeGregorian];
}

- (NSDate *)dateFromString:(NSString *)dateString dateFormatType:(TNDateFormatType)dataFormatType calendarType:(TNCalendarFormatType)calendarType
{
    NSCalendar *calendar = [self calendarWithType:calendarType];
    NSDate *date;
    switch (dataFormatType) {
        case TNDateFormatTypeDefault:
        {
            [self.defaultTypeDateFormatter setCalendar:calendar];
            date = [self.defaultTypeDateFormatter dateFromString:dateString];
        }
            break;
        case TNDateFormatTypeNum:
        {
            [self.numTypeDateFormatter setCalendar:calendar];
            date = [self.numTypeDateFormatter dateFromString:dateString];
        }
            break;
        case TNDateFormatTATimeStamp:
        {
            [self.taTimeStrampDateFormatter setCalendar:calendar];
            date = [self.taTimeStrampDateFormatter dateFromString:dateString];
        }
            break;
        case TNDateFormatWeek:
        {
            [self.weekDateFormatter setCalendar:calendar];
            date = [self.weekDateFormatter dateFromString:dateString];
        }
            break;
        case TNDateFormatBenchmark:
        {
            [self.benchmarkFormatter setCalendar:calendar];
            date = [self.benchmarkFormatter dateFromString:dateString];
        }
            break;
        default:
            break;
    }
    return date;
}

//根据类型获取对应格式的日历
- (NSCalendar *)calendarWithType:(TNCalendarFormatType)calendarType
{
    NSCalendar *calendar;
    switch (calendarType) {
        case TNCalendarFormatTypeJapanese:
            calendar = self.japaneseCalendar;
            break;
        case TNCalendarFormatTypeBuddhist:
            calendar = self.buddhistCalendar;
            break;
        case TNCalendarFormatTypeGregorian:
        default:
            calendar = self.gregorianCalendar;
            break;
    }
    return calendar;
}

// 根据NSDate获取年份、月份和星期几
- (NSDictionary *)dictionaryOfDate:(NSDate *)date
{
    return [self dictionaryOfDate:date calendarType:TNCalendarFormatTypeGregorian];
}

- (NSDictionary *)dictionaryOfDate:(NSDate *)date calendarType:(TNCalendarFormatType)calendarType
{
    NSCalendar *calendar = [self calendarWithType:calendarType];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
    NSDictionary *dateDic = @{
                              @"year":@([components year]),
                              @"month":@([components month]),
                              @"day":@([components day]),
                              };
    
    return dateDic;
}

#pragma mark - lazy
- (NSDateFormatter *)defaultTypeDateFormatter
{
    if (!_defaultTypeDateFormatter) {
        _defaultTypeDateFormatter = [[NSDateFormatter alloc] init];
        [_defaultTypeDateFormatter setDateFormat:@"yyyy-MM-dd"];
    }
    return _defaultTypeDateFormatter;
}

- (NSDateFormatter *)numTypeDateFormatter
{
    if (!_numTypeDateFormatter) {
        _numTypeDateFormatter = [[NSDateFormatter alloc] init];
        [_numTypeDateFormatter setDateFormat:@"yyyyMMdd"];
    }
    return _numTypeDateFormatter;
}

- (NSDateFormatter *)taTimeStrampDateFormatter
{
    if (!_taTimeStrampDateFormatter) {
        _taTimeStrampDateFormatter = [[NSDateFormatter alloc] init];
        [_taTimeStrampDateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    return _taTimeStrampDateFormatter;
}

- (NSDateFormatter *)weekDateFormatter
{
    if (!_weekDateFormatter) {
        _weekDateFormatter = [[NSDateFormatter alloc] init];
        _weekDateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        [_weekDateFormatter setDateFormat:@"E"];
    }
    return _weekDateFormatter;
}

- (NSDateFormatter *)benchmarkFormatter
{
    if (!_benchmarkFormatter) {
        _benchmarkFormatter = [[NSDateFormatter alloc] init];
        _benchmarkFormatter.dateFormat = @"yyyyMMddHHmmssSSS";
    }
    return _benchmarkFormatter;
}

- (NSCalendar *)gregorianCalendar
{
    if (!_gregorianCalendar) {
        _gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    }
    return _gregorianCalendar;
}

- (NSCalendar *)japaneseCalendar
{
    if (!_japaneseCalendar) {
        _japaneseCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierJapanese];
    }
    return _japaneseCalendar;
}

- (NSCalendar *)buddhistCalendar
{
    if (!_buddhistCalendar) {
        _buddhistCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierBuddhist];
    }
    return _buddhistCalendar;
}

@end
