//
//  NSDate+ZJCategory.h
//  ZJTool
//
//  Created by zhujia on 2019/9/6.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (ZJCategory)

#pragma mark Yesterday
/** Creates and returns a new date set to the previous day and current time.
 @return A `NSDate` object set to yesterday.
 */
+ (NSDate *) yesterday;

/** Creates and returns a new date set to the previous day and current time.
 @param timeZone The time zone to repect.
 @note Things get tricky with respect to day light saving. Simple subtraction of 24 hours (using @code[NSDate dateWithTimeIntervalSinceNow:]@endcode) might not yield the expected results.
 @return A `NSDate` object set to yesterday.
 */
+ (NSDate*) yesterdayWithTimeZone:(NSTimeZone*)timeZone;



/** Creates and returns a new date set to tomorrow's day and current time.
 @return A `NSDate` object set to tomorrow.
 */
+ (NSDate*) tomorrow;

/** Creates and returns a new date set to the tomorrow's day and current time.
 @param timeZone The time zone to repect.
 @note Things get tricky with respect to day light saving. Simple subtraction of 24 hours (using @code[NSDate dateWithTimeIntervalSinceNow:]@endcode) might not yield the expected results.
 @return A `NSDate` object set to tomorrow.
 */
+ (NSDate*) tomorrowWithTimeZone:(NSTimeZone*)timeZone;


#pragma mark Month
/** Creates and returns a new date set to the current month date.
 @return A `NSDate` object set to the current month.
 */
+ (NSDate *) month;

/** Creates and returns a new date set to the current month date.
 @param timeZone The time zone to repect.
 @note Things get tricky with respect to day light saving. Simple subtraction of a give time (using @code[NSDate dateWithTimeIntervalSinceNow:]@endcode) might not yield the expected results.
 @return A `NSDate` object set to the current month.
 */
+ (NSDate*) monthWithTimeZone:(NSTimeZone*)timeZone;

/** Creates and returns a new date set to the first day of the month from the date object.
 @return A `NSDate` object set to the same month as the date object. The day will be the first of the month.
 */
- (NSDate*) monthDate;

/** Creates and returns a new date set to the first day of the month from the date object.
 @param timeZone Time Zone for month.
 @note Things get tricky with respect to day light saving. Simple subtraction of a give time (using @code[NSDate dateWithTimeIntervalSinceNow:]@endcode) might not yield the expected results.
 @return A `NSDate` object set to the same month as the date object. The day will be the first of the month.
 */
- (NSDate *) monthDateWithTimeZone:(NSTimeZone*)timeZone;


#pragma mark Same Day
/** Returns whether the compared date shares the date with respect to the default time zone.
 @param anotherDate The data to compare.
 @return YES if the two dates share the same year, month day. Otherwise NO.
 */
- (BOOL) isSameDay:(NSDate*)anotherDate;

/** Returns whether the compared date shares the date with respect to the given time zone.
 @param anotherDate The data to compare.
 @param timeZone The time zone used to determine the current day.
 @return YES if the two dates share the same year, month day. Otherwise NO.
 */
- (BOOL) isSameDay:(NSDate*)anotherDate timeZone:(NSTimeZone*)timeZone;

#pragma mark Month and Days Between

/** Returns number of months between two dates.
 @param date The other date to compare.
 @return Returns number of months between two dates.
 */
- (NSInteger) monthsBetweenDate:(NSDate *)date;



/** Returns number of months between two dates.
 @param toDate The other date to compare.
 @param timeZone The time zone to respect.
 @return Returns number of months between two dates.
 */
- (NSInteger) monthsBetweenDate:(NSDate *)toDate timeZone:(NSTimeZone*)timeZone;

- (NSInteger) daysBetweenDate:(NSDate*)date;


#pragma mark Is Today
/** Returns a Boolean value that indicates whether the date object is that same date information as the current day.
 @return YES if the date object represents the current date, otherwise NO.
 */
- (BOOL) isToday;

/** Returns a Boolean value that indicates whether the date object is that same date information as the current day.
 @param timeZone The time zone to respect.
 @return YES if the date object represents the current date, otherwise NO.
 */
- (BOOL) isTodayWithTimeZone:(NSTimeZone*)timeZone;


/** Returns a Boolean value that indicates whether the date object is that same date information as tomorrow.
 @return YES if the date object represents tomorrow's date, otherwise NO.
 */
- (BOOL) isTomorrow;

/** Returns a Boolean value that indicates whether the date object is that same date information as tomorrow.
 @param timeZone The time zone to respect.
 @return YES if the date object represents tomorrow's date, otherwise NO.
 */
- (BOOL) isTomorrowWithTimeZone:(NSTimeZone*)timeZone;


/** Returns a Boolean value that indicates whether the date object is that same date information as yesterday.
 @return YES if the date object represents yesterday's date, otherwise NO.
 */
- (BOOL) isYesterday;
/** Returns a Boolean value that indicates whether the date object is that same date information as yesterday.
 @param timeZone The time zone to respect.
 @return YES if the date object represents yesterday's date, otherwise NO.
 */
- (BOOL) isYesterdayWithTimeZone:(NSTimeZone*)timeZone;


#pragma mark Month & Year String
/** Returns a NSString with the localized month and year string for the NSDate object.
 @return An NSString object.
 */
- (NSString *) monthYearString;

/** Returns a NSString with the localized month and year string for the NSDate object.
 @param timeZone The time zone to respect.
 @return An NSString object.
 */
- (NSString *) monthYearStringWithTimeZone:(NSTimeZone*)timeZone;

/** Returns a NSString with the localized month string for the NSDate object.
 @return An NSString object.
 */
- (NSString *) monthString;

/** Returns a NSString with the localized month string for the NSDate object.
 @param timeZone The time zone to respect.
 @return An NSString object.
 */
- (NSString*) monthStringWithTimeZone:(NSTimeZone*)timeZone;

/** Returns a NSString with the localized year string for the NSDate object.
 @return An NSString object.
 */
- (NSString *) yearString;

/** Returns a NSString with the localized year string for the NSDate object.
 @param timeZone The time zone to respect.
 @return An NSString object.
 */
- (NSString*) yearStringWithTimeZone:(NSTimeZone*)timeZone;


#pragma mark Date Compontents
/** Returns a NSDate from the given component information for the gregorian calendar.
 @param components The information used to create the date.
 @return A NSDate object.
 */
+ (NSDate*) dateWithDateComponents:(NSDateComponents*)components;

/** Returns an NSDateComponents object from the NSDate object with respect to the given time zone and gregorian calendar.
 @param timeZone The time zone to respect.
 @return A NSDateComponents object.
 */
- (NSDateComponents*) dateComponentsWithTimeZone:(NSTimeZone*)timeZone;


- (NSDate *) dateByAddingDays:(NSUInteger)days;
+ (NSDate *) dateWithDatePart:(NSDate *)aDate andTimePart:(NSDate *)aTime;

@end

NS_ASSUME_NONNULL_END
