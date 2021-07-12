//
//  UIImage+YLQR.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UIImage+YLQR.h"

@implementation UIImage (YLQR)

#pragma mark 生成二维码

/*!
 *  生成二维码
 *
 *  @param str  二维码字符串
 *  @param size 二维码图片大小 尽量大于 100, 100
 *
 *  @return 返回生成的图像
 */
+ (UIImage*)yl_createQRWithString:(NSString*)str size:(CGSize)size
{
    return [UIImage createNonInterpolatedUIImageFormCIImage:[UIImage createQRForString:str] withSize:size.width];
}

/**
 @brief  图像中间加logo图片
 @param srcImg    原图像
 @param LogoImage logo图像
 @param logoSize  logo图像尺寸
 @return 加Logo的图像
 */
+ (UIImage*)yl_addImageLogo:(UIImage*)srcImg centerLogoImage:(UIImage*)LogoImage logoSize:(CGSize)logoSize
{
    
    UIGraphicsBeginImageContextWithOptions(srcImg.size, NO, [[UIScreen mainScreen] scale]);
    
    [srcImg drawInRect:CGRectMake(0, 0, srcImg.size.width, srcImg.size.height)];
    
    CGRect rect = CGRectMake(srcImg.size.width/2 - logoSize.width/2, srcImg.size.height/2-logoSize.height/2, logoSize.width, logoSize.height);
    [LogoImage drawInRect:rect];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}


#pragma mark private methods

+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size {
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    // 创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CGColorSpaceRelease(cs);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    UIImage *aImage = [UIImage imageWithCGImage:scaledImage];
    CGImageRelease(scaledImage);
    return aImage;
}

+ (CIImage *)createQRForString:(NSString *)qrString {
    NSData *stringData = [qrString dataUsingEncoding:NSUTF8StringEncoding];
    // 创建filter
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 设置内容和纠错级别
    [qrFilter setValue:stringData forKey:@"inputMessage"];
//    [qrFilter setValue:@"M" forKey:@"inputCorrectionLevel"];
    // 返回CIImage
    return qrFilter.outputImage;
}

@end
