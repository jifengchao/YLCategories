//
//  UIButton+YLMake.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UIButton (YLMake)

+ (UIButton *)yl_buttonWithNormalTitle:(NSString *)normalTitle
                      normalTitleColor:(UIColor *)normalTitleColor
                                  font:(UIFont *)font;

+ (UIButton *)yl_buttonWithNormalTitle:(NSString *)normalTitle
                          selecedTitle:(NSString *)selecedTitle
                      normalTitleColor:(UIColor *)normalTitleColor
                     selecedTitleColor:(UIColor *)selecedTitleColor
                                  font:(UIFont *)font;

+ (UIButton *)yl_buttonWithNormalImage:(UIImage *)normalImage
                          selecedImage:(UIImage *)selecedImage;

+ (UIButton *)yl_buttonWithNormalTitle:(NSString *)normalTitle
                          selecedTitle:(NSString *)selecedTitle
                      normalTitleColor:(UIColor *)normalTitleColor
                     selecedTitleColor:(UIColor *)selecedTitleColor
                                  font:(UIFont *)font
                           normalImage:(UIImage *)normalImage
                          selecedImage:(UIImage *)selecedImage;

+ (UIButton *)yl_buttonWithNormalBackgroundImage:(UIImage *)normalBackgroundImage;

+ (UIButton *)yl_buttonWithNormalBackgroundImage:(UIImage *)normalBackgroundImage
                          selecedBackgroundImage:(UIImage *)selecedBackgroundImage;

+ (UIButton *)yl_buttonWithNormalBackgroundImage:(UIImage *)normalBackgroundImage
                                     normalTitle:(NSString *)normalTitle
                                normalTitleColor:(UIColor *)normalTitleColor
                                            font:(UIFont *)font;

+ (UIButton *)yl_buttonWithBlock:(void(^)(void))actionBlock;

@end

