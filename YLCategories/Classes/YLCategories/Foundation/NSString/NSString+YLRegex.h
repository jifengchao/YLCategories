//
//  NSString+YLRegex.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <Foundation/Foundation.h>

@interface NSString (YLRegex)

/** 判断全是数字*/
- (BOOL)yl_isAllDigital;

/** 判断全是中文*/
- (BOOL)yl_isAllChinese;

/** 判断全是空格*/
- (BOOL)yl_isAllWhiteSpace;

/** 判断特殊条件*/
- (BOOL)yl_custom_;


/* 移除所有不满足条件的字符，以string替换*/
- (NSString *)yl_replaceingWithSatisfyingBlock:(BOOL(^)(NSString *substring))satisfyingBlock withString:(NSString *)string;


    

/* 可自行添加其他的......*/

@end
