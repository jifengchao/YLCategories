//
//  NSObject+YLDebounce.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "NSObject+YLDebounce.h"

@implementation NSObject (YLDebounce)

/** 函数防抖调用*/
- (void)yl_debounce:(SEL)action delay:(NSTimeInterval)delay {
    __weak typeof(self) weakSelf = self;
    [NSObject cancelPreviousPerformRequestsWithTarget:weakSelf selector:action object:nil];
    [weakSelf performSelector:action withObject:nil afterDelay:delay];
}

@end
