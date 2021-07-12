//
//  NSAttributedString+YLHighlight.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (YLHighlight)

/*
 某段文字关键字设置颜色、字体
 caseInsensitive 不区分大小写
 cycleAll 遍历全部
 */
+ (NSAttributedString *)yl_stringHighlight:(NSString *)highlightString originalString:(NSString *)originalString highlightColor:(UIColor *)highlightColor highlightFont:(UIFont *)highlightFont caseInsensitive:(BOOL)caseInsensitive cycleAll:(BOOL)cycleAll;

/*
 某段文字关键字设置颜色、字体
 */
+ (NSAttributedString *)yl_stringHighlight:(NSString *)highlightString originalString:(NSString *)originalString highlightColor:(UIColor *)highlightColor highlightFont:(UIFont *)highlightFont;

/*
 某段文字关键字设置颜色
 */
+ (NSAttributedString *)yl_stringHighlight:(NSString *)highlightString originalString:(NSString *)originalString highlightColor:(UIColor *)highlightColor;

/*
 某段文字关键字设置字体
 */
+ (NSAttributedString *)yl_stringHighlight:(NSString *)highlightString originalString:(NSString *)originalString highlightFont:(UIFont *)highlightFont;


/*
 某段NSAttributedString文字关键字设置颜色
 */
- (NSAttributedString *)yl_stringHighlight:(NSString *)highlightString highlightColor:(UIColor *)highlightColor;

/*
 某段NSAttributedString文字关键字设置字体
 */
- (NSAttributedString *)yl_stringHighlight:(NSString *)highlightString highlightFont:(UIFont *)highlightFont;

@end
