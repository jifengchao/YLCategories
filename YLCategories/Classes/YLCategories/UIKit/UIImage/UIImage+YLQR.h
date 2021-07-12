//
//  UIImage+YLQR.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UIImage (YLQR)

/**
 *  @brief  生成二维码
 *  @param  str  二维码字符串
 *  @param  size 二维码图片大小
 *  @return 返回生成的图像
 */
+ (UIImage*)yl_createQRWithString:(NSString*)str size:(CGSize)size;

/**
 @brief  图像中间加logo图片
 @param  srcImg    原图像
 @param  LogoImage logo图像
 @param  logoSize  logo图像尺寸
 @return 加Logo的图像
 */
+ (UIImage*)yl_addImageLogo:(UIImage*)srcImg centerLogoImage:(UIImage*)LogoImage logoSize:(CGSize)logoSize;

@end
