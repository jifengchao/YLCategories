//
//  UITextField+YLPlaceholder.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UITextField+YLPlaceholder.h"

@implementation UITextField (YLPlaceholder)

/** 设置placeholder 需带上参数 color font*/
- (void)yl_setPlaceholder:(NSString *)placeholder color:(UIColor *)color font:(UIFont *)font {
    if (placeholder.length == 0) { return; }
    NSMutableDictionary *attr_dic = [NSMutableDictionary dictionary];
    attr_dic[NSForegroundColorAttributeName] = color;
    attr_dic[NSFontAttributeName] = font;
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:placeholder attributes:attr_dic];
    self.attributedPlaceholder = attrString;
}

/** 设置左部间距*/
- (void)yl_setLeftPadding:(CGFloat)padding {
    if (padding <= 0) return;
    UIView *leftview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, padding, padding)];
    self.leftView = leftview;
    self.leftViewMode = UITextFieldViewModeAlways;
}

@end
