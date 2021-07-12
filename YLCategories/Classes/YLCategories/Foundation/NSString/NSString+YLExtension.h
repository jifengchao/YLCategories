//
//  NSString+YLExtension.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <Foundation/Foundation.h>

@interface NSString (YLExtension)

/* 从小到大排序 数字*/
- (NSString *)yl_sortedAscendingDigitalString;
/* 从小到大排序 数字*/
+ (NSString *)yl_sortedAscendingDigitalStringWith:(NSString *)string;


#pragma mark - 去除字符串首尾连续字符

/** 去除字符串首部连续字符*/
- (NSString *)hyl_stringByTrimmingLeftCharactersInSet:(NSCharacterSet *)characterSet;

/** 去除字符串尾部连续字符*/
- (NSString *)hyl_stringByTrimmingRightCharactersInSet:(NSCharacterSet *)characterSet;


/* 可自行添加其他的......*/

@end
