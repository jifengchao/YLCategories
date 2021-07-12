//
//  NSAttributedString+YLHighlight.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "NSAttributedString+YLHighlight.h"

@implementation NSAttributedString (YLHighlight)

/*
 某段文字关键字设置颜色、字体
 caseInsensitive 不区分大小写
 cycleAll 遍历全部
 */
+ (NSAttributedString *)yl_stringHighlight:(NSString *)highlightString originalAttributedString:(NSAttributedString *)originalAttributedString highlightColor:(UIColor *)highlightColor highlightFont:(UIFont *)highlightFont caseInsensitive:(BOOL)caseInsensitive cycleAll:(BOOL)cycleAll {
    NSString *originalString = [originalAttributedString string];
    if (!highlightString.length || ![originalString containsString:highlightString]) {
        return [[NSAttributedString alloc] initWithString:(originalString.length ?originalString :@"")];
    }
    NSError *error;
    NSString *strRegex = highlightString;
    /*
     NSRegularExpressionCaseInsensitive       不区分大小写
     NSRegularExpressionIgnoreMetacharacters  整体化
     */
    NSRegularExpressionOptions options = caseInsensitive ?(NSRegularExpressionCaseInsensitive | NSRegularExpressionIgnoreMetacharacters) :NSRegularExpressionIgnoreMetacharacters;
    NSRegularExpression *reg = [NSRegularExpression regularExpressionWithPattern:strRegex options:options error:&error];
    
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithAttributedString:originalAttributedString];
    NSArray *matches = [reg matchesInString:originalString options:NSMatchingReportProgress range:NSMakeRange(0, originalString.length)];
    for (NSTextCheckingResult *match in matches) {
        NSRange range = [match range];
        if (highlightColor) {
            [attriString addAttribute:NSForegroundColorAttributeName value:highlightColor range:range];
        }
        if (highlightFont) {
            [attriString addAttribute:NSFontAttributeName value:highlightFont range:range];
        }
        if (!cycleAll) {
            break;
        }
    }
    return attriString;
}

/*
 某段文字关键字设置颜色、字体
 caseInsensitive 不区分大小写
 cycleAll 遍历全部
 */
+ (NSAttributedString *)yl_stringHighlight:(NSString *)highlightString originalString:(NSString *)originalString highlightColor:(UIColor *)highlightColor highlightFont:(UIFont *)highlightFont caseInsensitive:(BOOL)caseInsensitive cycleAll:(BOOL)cycleAll {
    if (!originalString.length) { return nil; }
    return [self yl_stringHighlight:highlightString originalAttributedString:[[NSAttributedString alloc] initWithString:originalString] highlightColor:highlightColor highlightFont:highlightFont caseInsensitive:caseInsensitive cycleAll:cycleAll];
}

/* 某段文字关键字设置颜色、字体*/
+ (NSAttributedString *)yl_stringHighlight:(NSString *)highlightString originalString:(NSString *)originalString highlightColor:(UIColor *)highlightColor highlightFont:(UIFont *)highlightFont {
    if (!originalString.length) { return nil; }
    return [self yl_stringHighlight:highlightString originalAttributedString:[[NSAttributedString alloc] initWithString:originalString] highlightColor:highlightColor highlightFont:highlightFont caseInsensitive:YES cycleAll:NO];
}

/* 某段文字关键字设置颜色*/
+ (NSAttributedString *)yl_stringHighlight:(NSString *)highlightString originalString:(NSString *)originalString highlightColor:(UIColor *)highlightColor {
    return [NSAttributedString yl_stringHighlight:highlightString originalString:originalString highlightColor:highlightColor highlightFont:nil caseInsensitive:YES cycleAll:NO];
}

/* 某段文字关键字设置字体*/
+ (NSAttributedString *)yl_stringHighlight:(NSString *)highlightString originalString:(NSString *)originalString highlightFont:(UIFont *)highlightFont {
    return [NSAttributedString yl_stringHighlight:highlightString originalString:originalString highlightColor:nil highlightFont:highlightFont caseInsensitive:YES cycleAll:NO];
}

/* 某段NSAttributedString文字关键字设置颜色*/
- (NSAttributedString *)yl_stringHighlight:(NSString *)highlightString highlightColor:(UIColor *)highlightColor {
    return [NSAttributedString yl_stringHighlight:highlightString originalAttributedString:self highlightColor:highlightColor highlightFont:nil caseInsensitive:YES cycleAll:NO];
}

/* 某段NSAttributedString文字关键字设置字体*/
- (NSAttributedString *)yl_stringHighlight:(NSString *)highlightString highlightFont:(UIFont *)highlightFont {
    return [NSAttributedString yl_stringHighlight:highlightString originalAttributedString:self highlightColor:nil highlightFont:highlightFont caseInsensitive:YES cycleAll:NO];
}

@end
