//
//  UITextField+YLPlaceholder.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (YLPlaceholder)

/** 设置placeholder 需带上参数 color font*/
- (void)yl_setPlaceholder:(NSString *)placeholder color:(UIColor *)color font:(UIFont *)font;

/** 设置左部间距*/
- (void)yl_setLeftPadding:(CGFloat)padding;

@end

NS_ASSUME_NONNULL_END
