//
//  UIView+YLCorner.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UIView (YLCorner)

/**
 给视图添加指定方向角的切角
 direction例如：UIRectCornerBottomLeft | UIRectCornerBottomRight
 horizontalRadius：水平方向的半径
 verticalRadius：垂直方向的半径
 */
- (void)yl_cornerWithDirection:(UIRectCorner)direction
              horizontalRadius:(CGFloat)horizontalRadius
                verticalRadius:(CGFloat)verticalRadius;
/** 给视图添加的切角水平垂直是相同的*/
- (void)yl_cornerWithDirection:(UIRectCorner)direction
                        radius:(CGFloat)radius;

/** 给视图添加特定角方向的切角*/
+ (void)yl_cornerWithView:(UIView *)corneredView
                direction:(UIRectCorner)direction
         horizontalRadius:(CGFloat)horizontalRadius
           verticalRadius:(CGFloat)verticalRadius;
/** 给视图添加的切角水平垂直是相同的*/
+ (void)yl_cornerWithView:(UIView *)corneredView
                direction:(UIRectCorner)direction
                   radius:(CGFloat)radius;

@end


