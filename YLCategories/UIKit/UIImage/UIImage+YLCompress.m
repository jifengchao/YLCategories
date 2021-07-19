//
//  UIImage+YLCompress.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UIImage+YLCompress.h"

@implementation UIImage (YLCompress)

/** 将图片压缩到指定大小*/
+ (UIImage *)yl_compressImage:(UIImage *)image toKb:(NSInteger)kb {
    if (!image || kb < 1) return image;
    
    NSData *imageData = [self yl_compressImageDataWithImg:image toKb:kb];
    //    NSLog(@"当前大小:%fkb", (float)[imageData length]/1024.0f);
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}

+ (NSData *)yl_compressImageDataWithImg:(UIImage *)image toKb:(NSInteger)kb {
    if (!image) return nil;
    if (kb < 1) return UIImageJPEGRepresentation(image, 1);
    
    // 预处理
    image = [image __reDrawedImageTransform];
    
    kb *= 1024;
    
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    while ([imageData length] > kb && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
    }
//    NSLog(@"当前大小:%fkb",(float)[imageData length]/1024.0f);
    return imageData;
}

#pragma mark - 压缩图片(微信算法)

/**  压缩图片*/
+ (UIImage *)ylwx_imageWithOriginalImage:(UIImage *)image {
    return [self ylwx_imageWithOriginalImage:image quality:1];
}

/**  压缩图片 压缩质量 0 -- 1*/
+ (UIImage *)ylwx_imageWithOriginalImage:(UIImage *)image quality:(CGFloat)quality {
    // 计算目标(算法)宽高
    
    // 宽高比
    CGFloat ratio = image.size.width / image.size.height;
    
    // 目标大小
    CGFloat targetW = 1280;
    CGFloat targetH = 1280;
    
    // 宽高均 <= 1280，图片尺寸大小保持不变
    if (image.size.width < 1280 && image.size.height < 1280) {
        return image;
    }
    // 宽高均 > 1280 && 宽高比 > 2，
    else if (image.size.width > 1280 && image.size.height > 1280) {
        // 宽大于高 取较小值(高)等于1280，较大值等比例压缩
        if (ratio > 1) {
            targetH = 1280;
            targetW = targetH * ratio;
        }
        else {
            // 高大于宽 取较小值(宽)等于1280，较大值等比例压缩
            targetW = 1280;
            targetH = targetW / ratio;
        }
    }
    // 宽或高 > 1280
    else {
        // 宽图 图片尺寸大小保持不变
        if (ratio > 2) {
            targetW = image.size.width;
            targetH = image.size.height;
        }
        // 长图 图片尺寸大小保持不变
        else if (ratio < 0.5){
            targetW = image.size.width;
            targetH = image.size.height;
        }
        // 宽大于高 取较大值(宽)等于1280，较小值等比例压缩
        else if (ratio > 1){
            targetW = 1280;
            targetH = 1280 / ratio;
        }
        // 高大于宽 取较大值(高)等于1280，较小值等比例压缩
        else {
            targetH = 1280;
            targetW = 1280 * ratio;
        }
    }
    
    UIImage *targetImage = [[self class] __imageCompressWithImage:image targetHeight:targetH targetWidth:targetW];
    if (quality >= 1) return targetImage; // 不需要再进行系数压缩
    
    // 再进行系数压缩
    NSData *imageData = UIImageJPEGRepresentation(targetImage, quality);
    return [UIImage imageWithData:imageData];
}

/**  压缩图片成Data*/
+ (NSData *)ylwx_dataWithOriginalImage:(UIImage *)image {
    return [self ylwx_dataWithOriginalImage:image quality:1];
}

/**  压缩图片成Data 压缩质量 0 -- 1*/
+ (NSData *)ylwx_dataWithOriginalImage:(UIImage *)image quality:(CGFloat)quality {
    UIImage *newImage = [self ylwx_imageWithOriginalImage:image];
    NSData *imageData = UIImageJPEGRepresentation(newImage, quality);
//    NSLog(@"当前大小:%fkb", (float)[imageData length] / 1024.0f);
    return imageData;
}

#pragma mark private methods

// 压缩可能导致图片原有旋转信息丢失
// http://xummer26.com/blog/image-lose-exif-after-redraw.html
- (UIImage *)__reDrawedImageTransform {
    CGSize size = CGSizeMake(self.size.width, self.size.height);
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    transform = CGAffineTransformScale(transform, 1, 1);
    CGContextConcatCTM(context, transform);
    
    // Draw the image into the transformed context and return the image
    [self drawAtPoint:CGPointMake(0.0f, 0.0f)];
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newimg;
}

/**  重绘*/
+ (UIImage *)__imageCompressWithImage:(UIImage *)sourceImage targetHeight:(CGFloat)targetHeight targetWidth:(CGFloat)targetWidth {
//    CGFloat targetHeight = (targetWidth / sourceImage.size.width) * sourceImage.size.height;
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    [sourceImage drawInRect:CGRectMake(0,0,targetWidth, targetHeight)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
