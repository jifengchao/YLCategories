//
//  UIView+YLVisualEffect.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UIView+YLVisualEffect.h"

@implementation UIView (YLVisualEffect)

/**
 为当前的view添加模糊效果
 @param frame 需要增加的区域
*/
- (void)yl_addVisualEffectWithFrame:(CGRect)frame style:(UIBlurEffectStyle)style {
    self.backgroundColor = [UIColor clearColor];
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:style];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    visualEffectView.frame = frame;
    [self addSubview:visualEffectView];
    [self sendSubviewToBack:visualEffectView];
}

/** 为当前的view添加模糊效果 */
- (void)yl_addVisualEffectWithStyle:(UIBlurEffectStyle)style {
    CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self yl_addVisualEffectWithFrame:frame style:style];
}

/** 为当前的view添加模糊效果(Dark)*/
- (void)yl_addDarkVisualEffect {
    [self yl_addVisualEffectWithStyle:UIBlurEffectStyleDark];
}

/**
 为当前的view添加模糊效果(Dark)
 @param frame 需要增加的区域
*/
- (void)yl_addDarkVisualEffectWithFrame:(CGRect)frame {
    [self yl_addVisualEffectWithFrame:frame style:UIBlurEffectStyleDark];
}

/** 移除当前view的毛玻璃效果*/
- (void)yl_removeVisualEffectView {
    for (id effectView in self.subviews) {
        if ([effectView isKindOfClass:[UIVisualEffectView class]]) {
            [effectView removeFromSuperview];
        }
    }
}

@end
