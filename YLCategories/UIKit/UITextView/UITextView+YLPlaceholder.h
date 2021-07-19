//
//  UITextView+YLPlaceholder.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UITextView (YLPlaceholder)

@property (nonatomic, readonly) UILabel *yl_placeholderLabel;

@property (nonatomic, strong) NSString *yl_placeholder;
@property (nonatomic, strong) NSAttributedString *yl_attributedPlaceholder;
@property (nonatomic, strong) UIColor *yl_placeholderColor;

/** 获取默认的占位色*/
+ (UIColor *)yl_defaultPlaceholderColor;

@end
