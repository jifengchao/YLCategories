//
//  UIImage+YLCompress.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UIImage (YLCompress)

/** 将图片压缩到指定大小*/
+ (UIImage *)yl_compressImage:(UIImage *)image toKb:(NSInteger)kb;
+ (NSData *)yl_compressImageDataWithImg:(UIImage *)image toKb:(NSInteger)kb;

#pragma mark - 压缩图片(微信算法)

/**  压缩图片*/
+ (UIImage *)ylwx_imageWithOriginalImage:(UIImage *)image;

/**  压缩图片 压缩质量 0 -- 1*/
+ (UIImage *)ylwx_imageWithOriginalImage:(UIImage *)image quality:(CGFloat)quality;

/**  压缩图片成Data*/
+ (NSData *)ylwx_dataWithOriginalImage:(UIImage *)image;

/**  压缩图片成Data 压缩质量 0 -- 1*/
+ (NSData *)ylwx_dataWithOriginalImage:(UIImage *)image quality:(CGFloat)quality;

@end
