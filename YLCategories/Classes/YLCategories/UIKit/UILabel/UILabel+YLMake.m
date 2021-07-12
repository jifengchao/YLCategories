//
//  UILabel+YLMake.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UILabel+YLMake.h"

@implementation UILabel (YLMake)

/** 快捷生成Label*/
+ (UILabel *)yl_labelWithText:(NSString *)text
                    textColor:(UIColor *)textColor
                         font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    return label;
}

@end
