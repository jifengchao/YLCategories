//
//  UIImageView+YLCornerRadius.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UIImageView (YLCornerRadius)

- (instancetype)initWithCornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;

- (instancetype)initWithRoundingRectImageView;

/** 添加任意角度的切角*/
- (void)yl_cornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;
/** 设置圆形切角(宽度的一半)*/
- (void)yl_cornerRadiusRoundingRect;
/** 添加边框 宽度、颜色*/
- (void)yl_attachBorderWidth:(CGFloat)width color:(UIColor *)color;

@end
