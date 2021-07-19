//
//  UIView+YLCorner.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UIView+YLCorner.h"

@implementation UIView (YLCorner)

/**
 给视图添加指定方向角的切角
 direction例如：UIRectCornerBottomLeft | UIRectCornerBottomRight
 horizontalRadius：水平方向的半径
 verticalRadius：垂直方向的半径
 */
- (void)yl_cornerWithDirection:(UIRectCorner)direction
              horizontalRadius:(CGFloat)horizontalRadius
                verticalRadius:(CGFloat)verticalRadius {
    if (self.frame.size.width == 0 &&
        self.frame.size.height == 0) return;
    
    CGRect bounds = self.bounds;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:direction cornerRadii:CGSizeMake(horizontalRadius, verticalRadius)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

/** 给视图添加的切角水平垂直是相同的*/
- (void)yl_cornerWithDirection:(UIRectCorner)direction
                        radius:(CGFloat)radius {
    [self yl_cornerWithDirection:direction horizontalRadius:radius verticalRadius:radius];
}

/** 给视图添加特定角方向的切角*/
+ (void)yl_cornerWithView:(UIView *)corneredView
                direction:(UIRectCorner)direction
         horizontalRadius:(CGFloat)horizontalRadius
           verticalRadius:(CGFloat)verticalRadius {
    [corneredView yl_cornerWithDirection:direction horizontalRadius:horizontalRadius verticalRadius:verticalRadius];
}

/** 给视图添加的切角水平垂直是相同的*/
+ (void)yl_cornerWithView:(UIView *)corneredView
                direction:(UIRectCorner)direction
                   radius:(CGFloat)radius {
    [corneredView yl_cornerWithDirection:direction horizontalRadius:radius verticalRadius:radius];
}

@end
