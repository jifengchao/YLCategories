//
//  UITextField+YLMake.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UITextField (YLMake)

+ (UITextField *)yl_textFieldWithDelegate:(id<UITextFieldDelegate>)delegate
                                     text:(NSString *)text
                                textColor:(UIColor *)textColor
                                     font:(UIFont *)font;

+ (UITextField *)yl_textFieldWithTextColor:(UIColor *)textColor
                                      font:(UIFont *)font;

@end


