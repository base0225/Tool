# Tool
封装的常用工具类

1、UIView+Positioning:

     (1) x
     (2) y
     (3) width 
     (4) height
     (5) tnorigin
     (6) size
     (7) bottom
     (8) right
     (9) centerX
     (10) centerY
     (11) lastSubviewOnY
     (12) lastSubviewOnX
     (13)- (void)centerToParent;   
  
  
2、UIColor+ZJExtension:
   
     (1) + (UIColor *)zj_colorWithHex:(unsigned int)hex;
     (2) + (UIColor *)zj_colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha;
     (3) + (UIColor *)zj_colorwithHexString:(NSString *)hexString;
     (4) + (UIColor *)zj_colorwithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
     (5) + (UIColor *)zj_randomColor;
     (6) + (UIColor *)zj_gradientColorInageFromColors:(NSArray *)colors gradientType:(ZJGradietType)gradientType imgSize:                (CGSize)imgSize;
     (7) - (UIImage *)zj_pureColorImage;
     (8) + (UIColor *)zj_modifyColorElement:(UIColor *)originColor element:(NSDictionary *)element;
     (9) + (UIColor *)zj_averageColors:(NSArray<UIColor *> *)colors;
 
 3、UIView+Toast:
 
     (1)- (void)makeToast:(NSString *)message;
     (2)- (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position;
     (3)- (void)makeQueueToast:(NSString *)message duration:(CGFloat)interval position:(id)position;
     (4)- (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position title:(NSString *)title;
     (5)- (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position title:(NSString *)title image:           (UIImage *)image;
     (6)- (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position image:(UIImage *)image;
     (7)- (void)showToast:(UIView *)toast;
     (8)- (void)showToast:(UIView *)toast duration:(CGFloat)interval position:(id)point;
     
  4、UIImage+ZJExtension
  
     (1)- (UIImage *)zj_slicedImageWithRect:(CGRect)rect;
     (2)- (UIImage *)zj_scaledImageWithSize:(CGSize)size;
     (3)- (UIImage*)zj_scaleAndCropImageWithSize:(CGSize)targetSize;
     (4)- (UIImage *)zj_imageSizeConstraintToByteLength:(long long)length;
     (5)- (UIImage *)zj_fixOrientation;
     (6)+ (UIImage *)zj_circleImage:(UIImage *)image;
     (7)+ (UIImage *)tn_circleImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
     (8)+ (UIImage *)zj_imageCorner:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor     
        cornerRadius:(CGFloat)cornerRadius;
        
  5、UILable+ZJExtension
  
     (1)- (void)zj_autoResetHeightByWidth:(CGFloat)restWidth text:(NSString *)text;
     (2)- (void)zj_autoResetHeightByWidth:(CGFloat)restWidth text:(NSString *)text miniHeight:(CGFloat)miniheight;
     (3)- (void)zj_autoResetHeightByWidth:(CGFloat)restWidth text:(NSString *)text oneLineHeight:(CGFloat )height;
     (4)- (CGFloat)zj_calculateHeightByWidth:(CGFloat)width text:(NSString *)text;
     (5)- (void)zj_autoResetWidth;
     
  6、UIAlertView+ZJExtension (注：在iOS8 废弃掉了，但是还可以使用。)
    
    (1)+ (UIAlertView *)zj_showAlertViewWithTitle:(NSString *)title
                                   message:(NSString *)message
                         cancelButtonTitle:(NSString *)cancelButtonTitle
                          otherButtonTitle:(NSString *)otherButton;
    (2)+ (UIAlertView *)zj_showAlertViewWithTitle:(NSString *)title
                                   message:(NSString *)message
                         cancelButtonTitle:(NSString *)cancelButtonTitle
                          otherButtonTitle:(NSString *)otherButton
                                  onCancel:(void (^)(void))cancelled
                                 onDismiss:(void (^)(NSInteger buttonIndex))dismissed;
    (3)+ (UIAlertView *)zj_showAlertViewWithTitle:(NSString *)title
                                   message:(NSString *)message
                         cancelButtonTitle:(NSString *)cancelButtonTitle
                         otherButtonTitles:(NSArray *)otherButtons;
    (4)+ (UIAlertView *)zj_showAlertViewWithTitle:(NSString *)title
                                   message:(NSString *)message
                         cancelButtonTitle:(NSString *)cancelButtonTitle
                         otherButtonTitles:(NSArray *)otherButtons
                                  onCancel:(void (^)(void))cancelled
                                 onDismiss:(void (^)(NSInteger buttonIndex))dismissed;                     
   
  
   7、NSArray + ZJExtension
    
    (1)- (id)zj_objectAtIndex:(NSUInteger)index;
    (2)+ (id)zj_arrayWithObjects:(const id _Nonnull [])objects count:(NSUInteger)cnt;
    (3)- (id)safeObjectAtIndex:(NSUInteger)index;
    (4)+ (BOOL)isNilorEmpty:(NSArray*)array;
    
   8、NSAttributedString + ZJExtension
   
    (1)+ (instancetype)zj_attributedStringWithString:(NSString *)string;
    (2)+ (instancetype)zj_attributedStringWithAttributedString:(NSAttributedString *)attrStr;
    (3)- (instancetype)zj_initWithString:(NSString *)str;
    (4)- (instancetype)zj_initWithString:(NSString *)str attributes:(NSDictionary<NSString *, id> *)attrs;
    (5)- (CGSize)zj_sizeConstrainedToSize:(CGSize)maxSize;
    (6)- (CGSize)zj_sizeConstrainedToSize:(CGSize)maxSize fitRange:(NSRange *)fitRange;
  
  9、NSMutableString + ZJExtension
  
    (1)- (void)zj_setFont:(UIFont *)font;
    (2)- (void)zj_setFont:(UIFont *)font range:(NSRange)range;
    (3)- (void)zj_setFontName:(NSString *)fontName size:(CGFloat)size;
    (4)- (void)zj_setFontName:(NSString *)fontName size:(CGFloat)size range:(NSRange)range;
    (5)- (void)zj_setTextColor:(UIColor *)color;
    (6)- (void)zj_setTextColor:(UIColor*)color range:(NSRange)range;
    (7)- (void)zj_setTextStrikethroughStyle:(NSUnderlineStyle)style;
    (8)- (void)zj_setTextStrikethroughStyle:(NSUnderlineStyle)style range:(NSRange)range;
    (9)- (void)zj_setTextUnderLineStyle:(NSUnderlineStyle)style;
    (10)- (void)zj_setTextUnderLineStyle:(NSUnderlineStyle)style range:(NSRange)range;
    (11)- (void)zj_modifyParagraphStylesWithBlock:(void (^)(NSMutableParagraphStyle *paragraphStyle))block;
    (12)- (void)zj_setParagraphStyle:(NSParagraphStyle *)paragraphStyle;
    (13)- (void)zj_setParagraphStyle:(NSParagraphStyle *)paragraphStyle range:(NSRange)range;‘
    (14)+ (instancetype)zj_attributedStringWithString:(NSString *)string;
    (15)+ (instancetype)zj_attributedStringWithAttributedString:(NSAttributedString *)attrStr;
    (16)- (instancetype)zj_initWithString:(NSString *)str;
    (17)- (instancetype)zj_initWithString:(NSString *)str attributes:(NSDictionary<NSString *, id> *)attrs;
    (18)- (CGSize)zj_sizeConstrainedToSize:(CGSize)maxSize;
    (19)- (CGSize)zj_sizeConstrainedToSize:(CGSize)maxSize fitRange:(NSRange *)fitRange;
    
  10、NSString + ZJHtml
  
    (1)+ (NSString *)zj_planTextWithHtml:(NSString *)html;
    (2)+ (NSString *)zj_planTextAndLineFeedWithHtml:(NSString *)html;
 
  11、NSTimer + ZJExtension
  
    (1)- (void)pauseTimer;
    (2)- (void)resumeTimer;
    (3)- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;
     
  12、NSString + ZJExtension
  
    (1)+ (BOOL)isNilOrEmpty:(NSString *)str;
    (2)- (BOOL)isEmpty;
    (3)- (BOOL)isEmptyIgnoringWhitespace:(BOOL)ignoreWhitespace;
    (4)- (NSString *)stringByTrimmingWhitespace;
    (5)- (NSString *)MD5Hash;
    (6)- (NSString *)SHA1Hash;
    (7)- (NSString *)MD5Hash32bit;
    (8)- (NSInteger)countWord;
    (9)- (NSInteger)convertToInt:(NSString*)strtemp;
    (10)- (void)trimCharactersInSet:(NSCharacterSet *)aCharacterSet;
    
   13、增加通用宏定义（系统版本、颜色、字号）、尺寸宏定义    
     
   14、ZJDateFormatHelper

    (1)+ (ZJDateFormatHelper *)sharedInstance;
    (2)- (NSString *)stringOfDate:(NSDate *)date dateFormatType:(ZJDateFormatType)dataFormatType;
    (3)- (NSString *)stringOfDate:(NSDate *)date dateFormatType:(ZJDateFormatType)dataFormatType calendarType: 
       (ZJCalendarFormatType)calendarType;
    (4)- (NSDate *)dateFromString:(NSString *)dateString dateFormatType:(ZJDateFormatType)dataFormatType;
    (5)- (NSDate *)dateFromString:(NSString *)dateString dateFormatType:(ZJDateFormatType)dataFormatType 
       calendarType:(ZJCalendarFormatType)calendarType;
    (6)- (NSDictionary *)dictionaryOfDate:(NSDate *)date;
    (7)- (NSDictionary *)dictionaryOfDate:(NSDate *)date calendarType:(ZJCalendarFormatType)calendarType; 
    
   15、NSDate+ZJExtension
   
    (1) - (NSInteger)zj_day;
    (2)- (NSString *)zj_weekDayString;
    (3)- (NSInteger)zj_month;
    (4)- (NSInteger)zj_year;
    (5)- (NSInteger)zj_hour;
    (6)- (NSInteger)zj_minute;
    (7)- (NSInteger)zj_second;
    (8)- (NSDate *)zj_dateByAddingDay:(NSInteger)days;
    (9)- (NSDate *)zj_dateByAddingMonth:(NSInteger)months;
    (10)- (NSDate *)zj_dateByAddingMinute:(NSInteger)minute;
    (11)+ (long long)zj_dateStampFrom1970;
    (12)+ (NSDate *)zj_dateFromNormalDateString:(NSString *)dateString;
    (13)+ (NSDate *)zj_dateFromDateString:(NSString *)dateString withFormat:(NSString *)dateFormat;
    (14)- (NSString *)zj_stringFromNormalDate;
    (15)- (NSString *)zj_stringFromDateWithFormat:(NSString *)dateFormat;
    (16)- (BOOL)zj_isEarlierThan:(NSDate *)date;
    (17)- (BOOL)zj_isEarlierThanOrEqualTo:(NSDate *)date;
    (18)- (BOOL)zj_isLaterThan:(NSDate *)date;
    (19)- (BOOL)zj_isLaterThanOrEqualTo:(NSDate *)date;
    
   16、UITextField+ZJExtension
   
    (1)- (void)zj_setPlaceholderColor:(UIColor *)color;
    (2)- (void)zj_setPlaceholderFont:(UIFont *)font;
    
   17、 ZJFileCacheManger
     
    (1)+ (NSString *)fileCachePath:(ZJFileCacheGrade)gradeType business:(ZJFileCacheBusinessType)business;
    (2)+ (void)clearFileCache:(ZJFileCacheGrade)gradeType complete:(void(^)(BOOL complete))complete;
   
