//
//  UITextField+YLLimitLength.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

typedef void(^YLEditingBlock)(NSString *text);
typedef void(^YLEditEndBlock)(NSString *text);
typedef void(^YLOverMaxLengthBlock)(void);

@interface UITextField (YLLimitLength)

/** 最大长度限制 if <= 0, no limit*/
@property (assign, nonatomic)  NSInteger yl_maxLength;
/** 要求纯数字输入*/
@property (assign, nonatomic)  BOOL yl_digitalText;

/**
 使用时只要调用此方法，加上一个长度(int)，就可以实现了字数限制
 editingBlock是正在编辑的回调
 */
- (void)yl_limitTextLength:(int)length editingBlock:(YLEditingBlock)editingBlock;

/**
 使用时只要调用此方法，加上一个长度(int)，就可以实现了字数限制
 editingBlock是正在编辑的回调
 overblock是超出范围后的回调
 */
- (void)yl_limitTextLength:(int)length editingBlock:(YLEditingBlock)editingBlock overBlock:(YLOverMaxLengthBlock)overBlock;

/**
 使用时只要调用此方法，加上一个长度(int)，就可以实现了字数限制
 endBlock是编辑结束后的回调
 */
- (void)yl_limitTextLength:(int)length endBlock:(YLEditEndBlock)endBlock;

/** 实现纯数字输入的字数限制*/
- (void)yl_digitalLimitTextLength:(int)length;

/** 实现纯数字输入的字数限制*/
- (void)yl_digitalLimitTextLength:(int)length editingBlock:(YLEditingBlock)editingBlock;

/** 判断文本是否为纯数字*/ 
+ (BOOL)yl_isAllDigital:(NSString *)text;

@end
