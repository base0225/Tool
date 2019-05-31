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
  
  
2、UILable+ZJExtension:
   
     (1) + (UIColor *)zj_colorWithHex:(unsigned int)hex;
     (2) + (UIColor *)zj_colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha;
     (3) + (UIColor *)zj_colorwithHexString:(NSString *)hexString;
     (4) + (UIColor *)zj_colorwithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
     (5) + (UIColor *)zj_randomColor;
     (6) + (UIColor *)zj_gradientColorInageFromColors:(NSArray *)colors gradientType:(ZJGradietType)gradientType imgSize:                (CGSize)imgSize;
     (7) - (UIImage *)zj_pureColorImage;
     (8) + (UIColor *)zj_modifyColorElement:(UIColor *)originColor element:(NSDictionary *)element;
     (9) + (UIColor *)zj_averageColors:(NSArray<UIColor *> *)colors;
  
