//
//  UIView+YLVisualEffect.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UIView (YLVisualEffect)

/**
 为当前的view添加模糊效果
 @param frame 需要增加的区域
*/
- (void)yl_addVisualEffectWithFrame:(CGRect)frame style:(UIBlurEffectStyle)style;

/** 为当前的view添加模糊效果 */
- (void)yl_addVisualEffectWithStyle:(UIBlurEffectStyle)style;

/** 为当前的view添加模糊效果(Dark)*/
- (void)yl_addDarkVisualEffect;

/**
 为当前的view添加模糊效果(Dark)
 @param frame 需要增加的区域
*/
- (void)yl_addDarkVisualEffectWithFrame:(CGRect)frame;

/** 移除当前view的毛玻璃效果*/
- (void)yl_removeVisualEffectView;

@end


