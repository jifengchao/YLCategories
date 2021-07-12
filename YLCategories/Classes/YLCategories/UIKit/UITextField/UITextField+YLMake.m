//
//  UITextField+YLMake.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UITextField+YLMake.h"

@implementation UITextField (YLMake)

+ (UITextField *)yl_textFieldWithDelegate:(id<UITextFieldDelegate>)delegate
                                     text:(NSString *)text
                                textColor:(UIColor *)textColor
                                     font:(UIFont *)font {
    UITextField *textField = [[UITextField alloc] init];
    if (delegate) textField.delegate = delegate;
    textField.text = text;
    textField.textColor = textColor;
    if (font) textField.font = font;
    return textField;
}

+ (UITextField *)yl_textFieldWithTextColor:(UIColor *)textColor
                                      font:(UIFont *)font {
    return [self yl_textFieldWithDelegate:nil text:nil textColor:textColor font:font];
}



@end
