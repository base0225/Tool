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
        
        
        
