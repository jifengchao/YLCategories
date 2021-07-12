//
//  UILabel+YLMake.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UILabel (YLMake)

/** 快捷生成Label*/
+ (UILabel *)yl_labelWithText:(NSString *)text
                    textColor:(UIColor *)textColor
                         font:(UIFont *)font;

@end


