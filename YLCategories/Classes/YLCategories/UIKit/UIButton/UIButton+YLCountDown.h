//
//  UIButton+YLCountDown.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

typedef void (^YLCountDownEndBlock)(BOOL isEnd);
@interface UIButton (YLCountDown)

/** 按钮倒计时 可自定义*/
- (void)yl_startTime:(NSInteger)timeout startUI:(void(^)(UIButton *button))startUI countingUI:(void(^)(UIButton *button, NSString *strTime))countingUI endUI:(void(^)(UIButton *button))endUI endBlock:(YLCountDownEndBlock)endBlock;

@end
