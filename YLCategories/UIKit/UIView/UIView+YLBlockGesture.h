//
//  UIView+YLBlockGesture.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

typedef void (^YLGestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);
typedef void (^YLGestureActionEndBlock)(UIGestureRecognizer *gestureRecoginzer, double duratione);
@interface UIView (YLBlockGesture)

/* 添加长按手势 */
- (void)yl_addLongPressActionWithBeginBlock:(YLGestureActionBlock)beginBlock
                                   endBlock:(YLGestureActionEndBlock)endBlock;

/* 添加长按手势 */
- (void)yl_addLongPressActionWith:(NSTimeInterval)minimumPressDuration
                   durationAction:(NSTimeInterval)durationAction
                       beginBlock:(YLGestureActionBlock)beginBlock
                         endBlock:(YLGestureActionEndBlock)endBlock;

@end


