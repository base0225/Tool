//
//  UIImage+ZJExtension.m
//  ZJTool
//
//  Created by 朱佳 on 2019/6/10.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import "UIImage+ZJExtension.h"

@implementation UIImage (ZJExtension)

// 裁剪图片
- (UIImage *)zj_slicedImageWithRect:(CGRect)rect
{
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CGRect targetRect = CGRectMake(0, 0, CGImageGetWidth(imageRef), CGImageGetHeight(imageRef));
    
    UIGraphicsBeginImageContext(targetRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, targetRect, imageRef);
    UIImage *targetImage = [UIImage imageWithCGImage:imageRef];
    CFRelease(imageRef);
    UIGraphicsEndImageContext();
    
    return targetImage;
}

// 压缩拉伸图片
- (UIImage *)zj_scaledImageWithSize:(CGSize)size
{
    CGSize sourceSize = [self size];
    CGRect destinationRectangle = CGRectMake(0, 0, size.width, size.height);
    
    float ratio = MAX(destinationRectangle.size.height / sourceSize.height,
                      destinationRectangle.size.width / sourceSize.width);
    UIGraphicsBeginImageContextWithOptions(destinationRectangle.size, NO, 0.0);
    
    CGRect destinationRectanble;
    destinationRectanble.size.width = ratio * sourceSize.width;
    destinationRectanble.size.height = ratio * sourceSize.height;
    destinationRectanble.origin.x = (destinationRectangle.size.width - destinationRectanble.size.width) / 2;
    destinationRectanble.origin.y = (destinationRectangle.size.height - destinationRectanble.size.height) / 2;
    
    [self drawInRect:destinationRectanble];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

- (UIImage*)zj_scaleAndCropImageWithSize:(CGSize)targetSize
{
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else
            if (widthFactor < heightFactor)
            {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return newImage;
}

// 返回固定字节长度的图片
- (UIImage *)zj_imageConstraintToByteLength:(long long)length
{
    NSData *data = UIImagePNGRepresentation(self);
    if (data.length <= length)
    {
        return self;
    }
    // 这个不一定对，没有任何文档表明fraction和文件的大小是线性关系
    CGFloat fraction = (CGFloat)length / (CGFloat)data.length;
    if (fraction < 0.3) { //如果
        fraction = 0.001;
    }
    data = UIImageJPEGRepresentation(self, fraction);
    return [[UIImage alloc] initWithData:data];
}

//较为准确的图片压缩方法 但是会修改size
- (UIImage *)zj_imageSizeConstraintToByteLength:(long long)length
{
    // Compress by quality
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(self, compression);
    if (data.length < length) return self;
    
    UIImage *resultImage = [UIImage imageWithData:data];
    // Compress by size
    NSUInteger lastDataLength = 0;
    while (data.length > length && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)length / data.length;
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
    }
    
    return resultImage;
}

// 修正图片方向
- (UIImage *)zj_fixOrientation
{
    // No-op if the orientation is already correct
    if (self.imageOrientation == UIImageOrientationUp) return self;
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (self.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    switch (self.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                             CGImageGetBitsPerComponent(self.CGImage), 0,
                                             CGImageGetColorSpace(self.CGImage),
                                             CGImageGetBitmapInfo(self.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (self.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
            break;
    }
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

+ (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation
{
    long double rotate = 0.0;
    CGRect rect;
    float translateX = 0;
    float translateY = 0;
    float scaleX = 1.0;
    float scaleY = 1.0;
    
    switch (orientation) {
        case UIImageOrientationLeft:
            rotate = M_PI_2;
            rect = CGRectMake(0, 0, image.size.height, image.size.width);
            translateX = 0;
            translateY = -rect.size.width;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;
        case UIImageOrientationRight:
            rotate = -M_PI_2;
            rect = CGRectMake(0, 0, image.size.height, image.size.width);
            translateX = -rect.size.height;
            translateY = 0;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;
        case UIImageOrientationDown:
            rotate = M_PI;
            rect = CGRectMake(0, 0, image.size.width, image.size.height);
            translateX = -rect.size.width;
            translateY = -rect.size.height;
            break;
        default:
            rotate = 0.0;
            rect = CGRectMake(0, 0, image.size.width, image.size.height);
            translateX = 0;
            translateY = 0;
            break;
    }
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0.0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextRotateCTM(context, rotate);
    CGContextTranslateCTM(context, translateX, translateY);
    
    CGContextScaleCTM(context, scaleX, scaleY);
    CGContextDrawImage(context, CGRectMake(0, 0, rect.size.width, rect.size.height), image.CGImage);
    
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    
    return newPic;
}

+ (UIImage *)tn_circleImage:(UIImage *)image
{
    return [self zj_circleImage:image borderWidth:0 borderColor:[UIColor clearColor]];
}

+ (UIImage *)zj_circleImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    CGRect rect;
    // 判断图片的宽高，截取正方形rect，画圆
    if (image.size.width <= image.size.height) {
        rect = CGRectMake(0, (image.size.height - image.size.width)/2, image.size.width, image.size.width);
    }
    else {
        rect = CGRectMake((image.size.width - image.size.height)/2, 0, image.size.height, image.size.height);
    }
    UIGraphicsBeginImageContext(image.size);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, borderWidth);
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    [image drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)zj_imageCorner:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius
{
    UIGraphicsBeginImageContext(image.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, borderWidth);
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    CGContextMoveToPoint(context, width - borderWidth, cornerRadius + borderWidth);  // 开始坐标右边开始
    CGContextAddArcToPoint(context, width - borderWidth, height - borderWidth, width - cornerRadius - borderWidth, height - borderWidth, cornerRadius);  // 右下角
    CGContextAddArcToPoint(context, borderWidth, height - borderWidth, borderWidth, height - cornerRadius - borderWidth, cornerRadius); // 左下角
    CGContextAddArcToPoint(context, borderWidth, borderWidth, width - borderWidth, borderWidth, cornerRadius); // 左上角
    CGContextAddArcToPoint(context, width - borderWidth, borderWidth, width - borderWidth, cornerRadius + borderWidth, cornerRadius); // 右上角
    CGContextClip(context);
    CGRect rect = CGRectMake(0, 0, image.size.width , image.size.height);
    [image drawInRect:rect];
    CGContextDrawPath(context, kCGPathFillStroke);
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return output;
}

@end
