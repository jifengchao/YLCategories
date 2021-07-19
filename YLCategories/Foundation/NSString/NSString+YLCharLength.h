//
//  NSString+YLCharLength.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <Foundation/Foundation.h>

@interface NSString (YLCharLength)

/** 字符串对应的字节数*/
- (NSUInteger)yl_charactorNumber;
/** 字符串相关编码下对应的字节数*/
- (NSUInteger)yl_charactorNumberWithEncoding:(NSStringEncoding)encoding;
/** 包含中文文字对应的字节数*/
- (NSUInteger)yl_charactorNumberForChineseSpecial;

@end
