//
//  UISearchBar+YLAppearance.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UISearchBar (YLAppearance)

- (void)yl_setTextColor:(UIColor *)textColor;

- (void)yl_setTextFont:(UIFont *)font;

- (void)yl_placeholder:(NSString *)placeholder placeholder_color:(UIColor *)placeholder_color;

/* 设置searchbar背景色 */
- (void)yl_setBackgroundColor:(UIColor *)backgroundColor;

/* 设置放大镜图标 */
- (void)yl_setGlassImage:(UIImage *)glassImage;

@end
