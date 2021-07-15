//
//  UIButton+YLMake.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UIButton+YLMake.h"

#import "UIButton+YLBlock.h"

@implementation UIButton (YLMake)

+ (UIButton *)yl_buttonWithNormalTitle:(NSString *)normalTitle
                      normalTitleColor:(UIColor *)normalTitleColor
                                  font:(UIFont *)font {
    return [self __buttonWithNormalTitle:normalTitle
                            selecedTitle:nil
                        normalTitleColor:normalTitleColor
                       selecedTitleColor:nil
                                    font:font
                             normalImage:nil
                            selecedImage:nil];
}

+ (UIButton *)yl_buttonWithNormalTitle:(NSString *)normalTitle
                          selecedTitle:(NSString *)selecedTitle
                      normalTitleColor:(UIColor *)normalTitleColor
                     selecedTitleColor:(UIColor *)selecedTitleColor
                                  font:(UIFont *)font {
    return [self __buttonWithNormalTitle:normalTitle
                            selecedTitle:selecedTitle
                        normalTitleColor:normalTitleColor
                       selecedTitleColor:selecedTitleColor
                                    font:font
                             normalImage:nil
                            selecedImage:nil];
}

+ (UIButton *)yl_buttonWithNormalImage:(UIImage *)normalImage
                          selecedImage:(UIImage *)selecedImage {
    return [self __buttonWithNormalTitle:nil
                            selecedTitle:nil
                        normalTitleColor:nil
                       selecedTitleColor:nil
                                    font:nil
                             normalImage:normalImage
                            selecedImage:selecedImage];
}

+ (UIButton *)yl_buttonWithNormalTitle:(NSString *)normalTitle
                          selecedTitle:(NSString *)selecedTitle
                      normalTitleColor:(UIColor *)normalTitleColor
                     selecedTitleColor:(UIColor *)selecedTitleColor
                                  font:(UIFont *)font
                           normalImage:(UIImage *)normalImage
                          selecedImage:(UIImage *)selecedImage {
    return [self __buttonWithNormalTitle:normalTitle selecedTitle:selecedTitle normalTitleColor:normalTitleColor selecedTitleColor:selecedTitleColor font:font normalImage:normalImage selecedImage:selecedImage];
}

+ (UIButton *)yl_buttonWithNormalBackgroundImage:(UIImage *)normalBackgroundImage {
    return [self yl_buttonWithNormalBackgroundImage:normalBackgroundImage selecedBackgroundImage:nil];
}

+ (UIButton *)yl_buttonWithNormalBackgroundImage:(UIImage *)normalBackgroundImage
                          selecedBackgroundImage:(UIImage *)selecedBackgroundImage {
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setBackgroundImage:normalBackgroundImage forState:(UIControlStateNormal)];
    [button setBackgroundImage:selecedBackgroundImage forState:(UIControlStateSelected)];
    return button;
}

+ (UIButton *)yl_buttonWithNormalBackgroundImage:(UIImage *)normalBackgroundImage
                                     normalTitle:(NSString *)normalTitle
                                normalTitleColor:(UIColor *)normalTitleColor
                                            font:(UIFont *)font {
    UIButton *button = [self yl_buttonWithNormalBackgroundImage:normalBackgroundImage selecedBackgroundImage:nil];
    [button setTitle:normalTitle forState:(UIControlStateNormal)];
    [button setTitleColor:normalTitleColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    return button;
}

+ (UIButton *)yl_buttonWithBlock:(void(^)(void))actionBlock {
    UIButton *button = [self yl_buttonWithNormalBackgroundImage:nil];
    if (actionBlock) {
        [button yl_addActionHandler:^(NSInteger tag) {
            actionBlock();
        }];
    }
    return button;
}

#pragma mark private methods

+ (UIButton *)__buttonWithNormalTitle:(NSString *)normalTitle
                         selecedTitle:(NSString *)selecedTitle
                     normalTitleColor:(UIColor *)normalTitleColor
                    selecedTitleColor:(UIColor *)selecedTitleColor
                                 font:(UIFont *)font
                          normalImage:(UIImage *)normalImage
                         selecedImage:(UIImage *)selecedImage {
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    [button setTitle:normalTitle forState:(UIControlStateNormal)];
    [button setTitle:selecedTitle forState:UIControlStateSelected];
    [button setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [button setTitleColor:selecedTitleColor forState:UIControlStateSelected];
    button.titleLabel.font = font;
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:selecedImage forState:UIControlStateSelected];
    
    return button;
}

@end
