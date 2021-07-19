//
//  UILabel+YLAttributed.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UILabel+YLAttributed.h"

@implementation UILabel (YLAttributed)

/* 设置行间距 */
- (void)yl_setLineSpacingWithText:(NSString *)text spacing:(CGFloat)spacing {
    if (text.length == 0 || spacing <= 0) return;
    // 保存之前的设置
    NSLineBreakMode lineBreakMode = self.lineBreakMode;
    NSTextAlignment align = self.textAlignment;
    // 设置间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = spacing - (self.font.lineHeight - self.font.pointSize);
    [paragraphStyle setLineSpacing:spacing];

    self.attributedText = [[NSAttributedString alloc]
                           initWithString:text
                           attributes:@{ NSParagraphStyleAttributeName: paragraphStyle }];
    // 恢复之前的设置
    self.lineBreakMode = lineBreakMode;
    self.textAlignment = align;
}

- (void)yl_setLineSpacing:(CGFloat)spacing {
    [self yl_setLineSpacingWithText:self.text spacing:spacing];
}

@end
