//
//  UILabel+YLAttributed.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UILabel (YLAttributed)

/* 设置行间距 */
- (void)yl_setLineSpacingWithText:(NSString *)text spacing:(CGFloat)spacing;

- (void)yl_setLineSpacing:(CGFloat)spacing;

@end
