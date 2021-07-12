//
//  UIView+YLMake.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UIView (YLMake)

/** 生成带背景色的view*/
+ (UIView *)yl_viewWithBackgroundColor:(UIColor *)backgroundColor;

/** 获取当前视图的导航控制器*/
- (UINavigationController *)yl_navigationController;

/** 获取当前视图的控制器*/
- (UIViewController *)yl_viewController;

@end


