//
//  ZJ_Dimens_h.h
//  ZJTool
//
//  Created by zhujia on 2019/7/10.
//  Copyright © 2019 朱佳. All rights reserved.
//

#ifndef ZJ_Dimens_h_h
#define ZJ_Dimens_h_h

//状态栏高度
#define STATUS_BAR_HEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height)
//NavBar高度
#define NAVIGATION_BAR_HEIGHT 44
//屏幕 rect
#define SCREEN_RECT ([UIScreen mainScreen].bounds)

#define IsPortrait ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait || [UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)

//获取屏幕 宽度、高度
#define SCREEN_WIDTH (IsPortrait ? MIN(([UIScreen mainScreen].bounds.size.width), ([UIScreen mainScreen].bounds.size.height)) : MAX(([UIScreen mainScreen].bounds.size.width), ([UIScreen mainScreen].bounds.size.height)))

#define SCREEN_HEIGHT (IsPortrait ? MAX(([UIScreen mainScreen].bounds.size.width), ([UIScreen mainScreen].bounds.size.height)) : MIN(([UIScreen mainScreen].bounds.size.width), ([UIScreen mainScreen].bounds.size.height)))
#define SCREEN_4_INCH ((SCREEN_HEIGHT - 568) < FLT_EPSILON)
#define FULL_VIEW_HEIGHT (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)?(SCREEN_HEIGHT):(SCREEN_HEIGHT- 20))

//屏幕顶部工具栏高度
#define TOP_TOOL_BAR_HEIGHT (STATUS_BAR_HEIGHT + NAVIGATION_BAR_HEIGHT)
//屏幕底部工具栏高度
#define BOTTOM_BAR_HEIGHT 50
//ipad底部工具栏高度
#define IPADBOTTOMHEIGHT  (ISPAD ? 80 : BOTTOM_BAR_HEIGHT)

//iPhoneX 安全区域外底部高度
#define UNSAFE_BOTTOM_HEIGHT 34

//Splash底部固定
#define BOTTOM_IMAGE_HEIGHT 100

#define CONTENT_VIEW_Y 64.5
#define CONTENT_VIEW_HEIGHT (SCREEN_HEIGHT - TOP_TOOL_BAR_HEIGHT - BOTTOM_BAR_HEIGHT)
#define CONTENT_VIEW_HEIGHT_WITHOUT_BOTTOMBAR (SCREEN_HEIGHT - TOP_TOOL_BAR_HEIGHT)
//////////////////////////////////////////////////////////////////////////////////////////////////
#define BACK_GRAY_VIEW_ALPHA 0.6      //筛选灰view的alph值
#define PROCESS_ANIMATION_SPEED  5.0 //进度条运动速度

#define VIEW_DECK_LEFT_WIDTH (SCREEN_WIDTH - 60)
#define VIEW_DECK_RIGHT_WIDTH (SCREEN_WIDTH - 50)

//////////////////////////////////////////////////////////////////////////////////////////////////

#define TIP_DELAY_IN_SECOND                         2                     //tip显示时间

#define FIRST_LUNCHED(v) ([NSString stringWithFormat:@"FirstLunched_%@", v])
#define IDFA_LOGED_THREE_MINUTES (@"IDFA_LOGED_THREE_MINUTES")
#define IDFA_LOGED_LAUNCH        (@"IDFA_LOGED_LAUNCH")
#define IDFA_LOGED_LOGIN         (@"IDFA_LOGED_LOGIN")
#define IDFA_LOGED_ONE_MINUTES   (@"IDFA_LOGED_ONE_MINUTES")
#define IDFA_LOGED_TWO_MINUTES   (@"IDFA_LOGED_TWO_MINUTES")
#define IDFA_LOGED_REGISTRATION  (@"IDFA_LOGED_REGISTRATION")

#define UITEXTVIEW_PADDING 4    //UITextView 上下左右默认padding 8px
#define MAX_PIC_WALL_WIDTH_SCALE   0.5

#endif /* ZJ_Dimens_h_h */
