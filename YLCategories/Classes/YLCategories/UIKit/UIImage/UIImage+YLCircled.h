//
//  UIImage+YLCircled.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UIImage (YLCircled)

/** 将图片切割圆角*/
- (UIImage *)yl_circledImage;

/** 圆形纯色图片*/
+ (UIImage *)yl_circledImageWithColor:(UIColor *)color size:(CGSize)size;

@end


