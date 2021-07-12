//
//  UINavigationBar+YLHairline.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (YLHairline)

/** 隐藏导航栏下划线*/
- (void)yl_hideHairline;
/** 设置隐藏导航栏下划线颜色*/
- (void)yl_setHairlineColor:(UIColor *)lineColor;
/** 设置导航栏为透明色*/
- (void)yl_setBarClearBackgroundImage;

@end
