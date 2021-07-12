//
//  UITextView+YLMake.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UITextView+YLMake.h"

@implementation UITextView (YLMake)

+ (UITextView *)yl_textViewWithDelegate:(id<UITextViewDelegate>)delegate
                                   text:(NSString *)text
                              textColor:(UIColor *)textColor
                                   font:(UIFont *)font {
    UITextView *textView = [[UITextView alloc] init];
    if (delegate) textView.delegate = delegate;
    textView.text = text;
    textView.textColor = textColor;
    if (font) textView.font = font;
    return textView;
}

@end
