//
//  ZJ_UtilsMacro_h.h
//  ZJTool
//
//  Created by zhujia on 2019/7/10.
//  Copyright © 2019 朱佳. All rights reserved.
//

#ifndef ZJ_UtilsMacro_h_h
#define ZJ_UtilsMacro_h_h


#import "UIColor+ZJExtension.h"

/************************************* System ****************************************************/

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


/************************************* Color ****************************************************/

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#define HEXCOLOR(hexColorValue) [UIColor zj_colorWithHex:hexColorValue]

// 常用颜色
#define ZJ_COLOR_GREEN HEXCOLOR(0x33bd61)
#define ZJ_COLOR_ORANGE HEXCOLOR(0xff7800)
#define ZJ_COLOR_RED HEXCOLOR(0xff7c70)
#define ZJ_COLOR_TEXT_DARK HEXCOLOR(0x333333)
#define ZJ_COLOR_TEXT_GRAY HEXCOLOR(0x666666)
#define ZJ_COLOR_TEXT_LIGHT_GRAY HEXCOLOR(0x999999)
#define ZJ_COLOR_APP_BACKGROUND HEXCOLOR(0xededed)
#define ZJ_COLOR_SEPARATOR HEXCOLOR(0xc6c6c6)
#define ZJ_COLOR_SEPARATOR_LINE HEXCOLOR(0xd4d4d4)
#define ZJ_COLOR_SUPER_ORANGE HEXCOLOR(0xfe9925)  /**< 浅橘黄色 */

//设备屏幕比率（以320为基准）
#define size_scale SCREEN_WIDTH/320

// iPhone屏幕尺寸判断
#define iPhone4s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size)) : NO)
#define iPhone6p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)

//包含目前的 iPhoneX, XS, XR, XS Max
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? ((int)([[UIScreen mainScreen] currentMode].size.height/[[UIScreen mainScreen] currentMode].size.width * 100) == 216) : NO)

#define SHOW_IPHONEX_FIT_LINE 0

#define IOS8_OR_LATER [[UIDevice currentDevice].systemVersion floatValue] >= 8.0

/************************************* Font ****************************************************/

#define APP_FONT(_size) ([UIFont fontWithName:@"HelveticaNeue" size:(_size)])
#define APP_BOLD_FONT(size) [UIFont boldSystemFontOfSize:size]

#define ISPHONE ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define ISPAD ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

#define APP_FONT_SMALL_S(scale) ISPHONE ? APP_FONT(12.0f * (scale)) : APP_FONT(16.0f *(scale))
#define APP_FONT_SMALL APP_FONT_SMALL_S(1)

#define APP_FONT_NORMAL_S(scale) ISPHONE ? APP_FONT(14.0f *(scale)) : APP_FONT(18.0f*(scale))
#define APP_FONT_NORMAL APP_FONT_NORMAL_S(1)

#define APP_FONT_LARGE_S(scale) ISPHONE ? APP_FONT(16.0f*(scale)) : APP_FONT(22.0f*(scale))
#define APP_FONT_LARGE APP_FONT_LARGE_S(1)

#define APP_FONT_TEN_S(scale) ISPHONE ? APP_FONT(10.0f*(scale)) : APP_FONT(14.0f*(scale))
#define APP_FONT_TEN APP_FONT_TEN_S(1)

#define APP_FONT_THIRTEEN_S(scale) ISPHONE ? APP_FONT(13.0f*(scale)) : APP_FONT(17.0f*(scale))
#define APP_FONT_THIRTEEN APP_FONT_THIRTEEN_S(1)

#define APP_FONT_EIGHTEEN_S(scale) ISPHONE ? APP_FONT(18.0f*(scale)) : APP_FONT(24.0f*(scale))
#define APP_FONT_EIGHTEEN APP_FONT_EIGHTEEN_S(1)

#define APP_FONT_TWENTY_S(scale) ISPHONE ? APP_FONT(20.0f*(scale)) : APP_FONT(26.0f*(scale))
#define APP_FONT_TWENTY APP_FONT_TWENTY_S(1)

#define APP_FONT_TWENTY_TWO_S(scale) ISPHONE ? APP_FONT(22.0f*(scale)) : APP_FONT(28.0f*(scale))
#define APP_FONT_TWENTY_TWO APP_FONT_TWENTY_TWO_S(1)

#define APP_FONT_FIFTEEN_S(scale) ISPHONE ? APP_FONT(15.0f*(scale)) : APP_FONT(17.0f*(scale))
#define APP_FONT_FIFTEEN APP_FONT_FIFTEEN_S(1)

#define APP_BOLD_FONT_TEN_S(scale) ISPHONE ? APP_BOLD_FONT(10.0f*(scale)) : APP_BOLD_FONT(14.0f*(scale))
#define APP_BOLD_FONT_TEN APP_BOLD_FONT_TEN_S(1)

#define APP_BOLD_FONT_SMALL_S(scale) ISPHONE ? APP_BOLD_FONT(12.0f*(scale)) : APP_BOLD_FONT(16.0f*(scale))
#define APP_BOLD_FONT_SMALL APP_BOLD_FONT_SMALL_S(1)

#define APP_BOLD_FONT_NORMAL_S(scale) ISPHONE ? APP_BOLD_FONT(14.0f*(scale)) : APP_BOLD_FONT(18.0f*(scale))
#define APP_BOLD_FONT_NORMAL APP_BOLD_FONT_NORMAL_S(1)

#define APP_BOLD_FONT_LARGE_S(scale) ISPHONE ? APP_BOLD_FONT(16.0f*(scale)) : APP_BOLD_FONT(22.0f*(scale))
#define APP_BOLD_FONT_LARGE APP_BOLD_FONT_LARGE_S(1)

#define APP_BOLD_FONT_EIGHTEEN_S(scale) ISPHONE ? APP_BOLD_FONT(18.0f*(scale)) : APP_BOLD_FONT(24.0f*(scale))
#define APP_BOLD_FONT_EIGHTEEN APP_BOLD_FONT_EIGHTEEN_S(1)

#define APP_BOLD_FONT_TWENTY_S(scale) ISPHONE ? APP_BOLD_FONT(20.0f*(scale)) : APP_BOLD_FONT(26.0f*(scale))
#define APP_BOLD_FONT_TWENTY APP_BOLD_FONT_TWENTY_S(1)

/************************************* Tool ****************************************************/

#define NSSTRING_NOT_NIL(value)  value ? value : @""
#define NSARRAY_NOT_NIL(value)  value ? value: @[]
#define NSDICTIONARY_NOT_NIL(value)  value ? value: @{}
#define NSSTRING_VALUE_OPTIONAL(value)  [value isKindOfClass:[NSString class] ] ? value : nil
#define INT_TO_STRING(intValue) [NSString stringWithFormat:@"%ld", (long)intValue]
#define CURRENCY @"￥"
#define ADD_CURRENCY_PREFIX(price) [CURRENCY stringByAppendingFormat:@"%ld", (long)price];
#define DELEGATE_HAS_METHOD(method) self.delegate&&[self.delegate respondsToSelector:@selector(method)]
#define DELEGATE_WITH_NAME_HAS_METHOD(delegateName,method) self.delegateName&&[self.delegateName respondsToSelector:@selector(method)]
#define WEAKEN(weakObjectName,object) __typeof__(object) __weak weakObjectName = object;
#define WEAKSELF() WEAKEN(weakSelf,self)
#define TN_DEPRECATED(message) __attribute((deprecated(message)))

/************************************* scale ****************************************************/

#define HORIZONTAL_SCALE pow(SCREEN_WIDTH / 375 , 0.6) //根据标注 375比45  768比70 计算
#define VERTICAL_SCALE 1.5f
#define SCREEN_SCALE SCREEN_WIDTH/375.0f
#define SPACE_SCALE_DOUBLE 2.0f
#define UNIVERSAL_WIDTH(originWidth) (ISPHONE ? originWidth : (originWidth * HORIZONTAL_SCALE))
#define UNIVERSAL_HEIGHT(originHeight) (ISPHONE ? originHeight : (originHeight * 1.5f))
#define UNIVERSAL_SPACE_DOUBLE(originSpace) (ISPHONE ? originSpace : (originSpace * 2.0f))


#endif /* ZJ_UtilsMacro_h_h */
