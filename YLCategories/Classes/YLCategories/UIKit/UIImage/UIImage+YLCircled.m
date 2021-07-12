//
//  UIImage+YLCircled.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UIImage+YLCircled.h"

@implementation UIImage (YLCircled)

/** 将图片切割圆角*/
- (UIImage *)yl_circledImage {
    if (self.size.width == 0 || self.size.height == 0) return self;
    
    // 开启一个图形上下文
    UIGraphicsBeginImageContext(self.size);
    // 获取到这个上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置圆形
    CGContextAddEllipseInRect(context, CGRectMake(0, 0, self.size.width, self.size.height));
    // 裁剪
    CGContextClip(context);
    //  重新绘制
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    //  获取到这张图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //  关闭
    UIGraphicsEndImageContext();
    
    return image;
}

/** 圆形纯色图片*/
+ (UIImage *)yl_circledImageWithColor:(UIColor *)color size:(CGSize)size {
    UIImage *img = [self __imageWithColor:color size:size];
    return [img yl_circledImage];
}

#pragma mark private methods

/** 根据颜色生成纯色图片*/
+ (UIImage *)__imageWithColor:(UIColor *)color size:(CGSize)size {
    if (size.width == 0 || size.height == 0 || !color) return nil;
    
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
