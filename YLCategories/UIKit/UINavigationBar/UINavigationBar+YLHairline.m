//
//  UINavigationBar+YLHairline.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UINavigationBar+YLHairline.h"

@implementation UINavigationBar (YLHairline)

/** 隐藏导航栏下划线*/
- (void)yl_hideHairline {
    [self yl_setHairlineColor:[UIColor clearColor]];
}

/** 设置隐藏导航栏下划线颜色*/
- (void)yl_setHairlineColor:(UIColor *)lineColor {
    if (!lineColor) { return; }
    
    UIImageView *blackLineImageView = [self findHairlineImageViewUnder:self];
    if (blackLineImageView) {
        blackLineImageView.hidden = YES;
        UIView *blackLineView = [self __blackLineViewWithFrame:blackLineImageView.frame];
        blackLineView.backgroundColor = lineColor;
    } else {
        // 1像素高度
        CGFloat singleLineWH = 1.0 / ([UIScreen mainScreen].scale);
        UIImage *lineImg = [[self class] __imageWithColor:lineColor imgHeight:singleLineWH];
        [self setShadowImage:lineImg];
    }
}

/** 设置导航栏为透明色*/
- (void)yl_setBarClearBackgroundImage {
    UIImage *barBackgroundImage = [[self class] __imageWithColor:[UIColor clearColor]];
    [self setBackgroundImage:barBackgroundImage forBarMetrics:UIBarMetricsDefault];
}

#pragma mark 私有methods

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0)
    {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (UIView *)__blackLineViewWithFrame:(CGRect)frame {
    NSInteger viewTag = 202001010000;
    UIView *blackLineView = [self viewWithTag:viewTag];
    if (!blackLineView) {
        CGRect lineViewFrame = frame;
        lineViewFrame.origin.y = 44;
        blackLineView = [[UIView alloc] initWithFrame:lineViewFrame];
        [self addSubview:blackLineView];
        blackLineView.tag = viewTag;
    }
    return blackLineView;
}

/**
 *  @brief 根据颜色生成纯色图片
 *  @param color 颜色
 *  @return 纯色图片
 */
+ (UIImage *)__imageWithColor:(UIColor *)color imgHeight:(CGFloat)imgHeight {
    imgHeight = (imgHeight < 0) ?1 :imgHeight;
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, imgHeight);
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)__imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
