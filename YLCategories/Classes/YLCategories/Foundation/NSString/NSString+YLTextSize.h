//
//  NSString+YLTextSize.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (YLTextSize)

#pragma mark - 文本计算方法
/**
 *  快速计算出文本的真实尺寸
 *
 *  @param font    文字的字体
 *  @param maxSize 文本的最大尺寸
 *
 *  @return 快速计算出文本的真实尺寸
 */
- (CGSize)yl_sizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize;

/**
 *  快速计算出文本的真实尺寸
 *
 *  @param text    需要计算尺寸的文本
 *  @param font    文字的字体
 *  @param maxSize 文本的最大尺寸
 *
 *  @return 快速计算出文本的真实尺寸
 */
+ (CGSize)yl_sizeWithText:(NSString *)text andFont:(UIFont *)font andMaxSize:(CGSize)maxSize;

- (CGSize)yl_sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;

- (CGSize)yl_sizeWithFont:(UIFont *)font maxH:(CGFloat)maxH;

- (CGSize)yl_sizeWithFont:(UIFont *)font;

@end
