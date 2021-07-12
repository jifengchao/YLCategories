//
//  UITextView+YLMake.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UITextView (YLMake)

+ (UITextView *)yl_textViewWithDelegate:(id<UITextViewDelegate>)delegate
                                   text:(NSString *)text
                              textColor:(UIColor *)textColor
                                   font:(UIFont *)font;

@end


