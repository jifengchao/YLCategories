//
//  UIView+YLBlockGesture.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UIView+YLBlockGesture.h"
#import <objc/runtime.h>

static char yl_kActionHandlerLongPressBeginBlockKey;
static char yl_kActionHandlerLongPressEndBlockKey;
static char yl_kActionHandlerLongPressGestureKey;
static char yl_kActionHandlerLongPressDurationeKey;
static char yl_kActionHandlerLongPressActionDurationeKey;
static char yl_kActionHandlerLongPressEndActionKey;

@implementation UIView (YLBlockGesture)

/* 添加长按手势 */
- (void)yl_addLongPressActionWithBeginBlock:(YLGestureActionBlock)beginBlock
                                   endBlock:(YLGestureActionEndBlock)endBlock {
    [self yl_addLongPressActionWith:0.2 durationAction:0.3 beginBlock:beginBlock endBlock:endBlock];
}

/* 添加长按手势 */
- (void)yl_addLongPressActionWith:(NSTimeInterval)minimumPressDuration
                   durationAction:(NSTimeInterval)durationAction
                       beginBlock:(YLGestureActionBlock)beginBlock
                         endBlock:(YLGestureActionEndBlock)endBlock {
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &yl_kActionHandlerLongPressGestureKey);
    if (!gesture) {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(yl_handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        gesture.minimumPressDuration = minimumPressDuration;
        objc_setAssociatedObject(self, &yl_kActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &yl_kActionHandlerLongPressBeginBlockKey, beginBlock, OBJC_ASSOCIATION_COPY);
    objc_setAssociatedObject(self, &yl_kActionHandlerLongPressEndBlockKey, endBlock, OBJC_ASSOCIATION_COPY);
    objc_setAssociatedObject(self, &yl_kActionHandlerLongPressActionDurationeKey, @(durationAction), OBJC_ASSOCIATION_RETAIN);
}

- (void)yl_handleActionForLongPressGesture:(UITapGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        // 清除已执行的标志
        objc_setAssociatedObject(self, &yl_kActionHandlerLongPressEndActionKey, @(0), OBJC_ASSOCIATION_RETAIN);
        
        CFAbsoluteTime time = CFAbsoluteTimeGetCurrent(); // 当前时间
        objc_setAssociatedObject(self, &yl_kActionHandlerLongPressDurationeKey, @(time), OBJC_ASSOCIATION_RETAIN);
        
        YLGestureActionBlock beginBlock = objc_getAssociatedObject(self, &yl_kActionHandlerLongPressBeginBlockKey);
        if (beginBlock) { beginBlock(gesture); }
        
        NSNumber *actionDurationeNumber = objc_getAssociatedObject(self, &yl_kActionHandlerLongPressActionDurationeKey);
        if ([actionDurationeNumber doubleValue] > 0 &&
            gesture.state == UIGestureRecognizerStateBegan) {
            __weak typeof(self) weakSelf = self;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)([actionDurationeNumber doubleValue] * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf endActionForLongPressGesture:gesture];
            });
        }
    }
    if (gesture.state == UIGestureRecognizerStateRecognized) {
        [self endActionForLongPressGesture:gesture];
    }
}

- (void)endActionForLongPressGesture:(UITapGestureRecognizer *)gesture {
    // 判断已执行的标志
    NSNumber *endActionNumber = objc_getAssociatedObject(self, &yl_kActionHandlerLongPressEndActionKey);
    if ([endActionNumber doubleValue] > 0) { return; }
    // 记录已执行的标志
    objc_setAssociatedObject(self, &yl_kActionHandlerLongPressEndActionKey, @(1), OBJC_ASSOCIATION_RETAIN);
    
    CFAbsoluteTime time = CFAbsoluteTimeGetCurrent(); // 当前时间
    NSNumber *startNumber = objc_getAssociatedObject(self, &yl_kActionHandlerLongPressDurationeKey);
    
    YLGestureActionEndBlock endBlock = objc_getAssociatedObject(self, &yl_kActionHandlerLongPressEndBlockKey);
    if (endBlock) { endBlock(gesture, (time - [startNumber doubleValue])); }
}

@end
