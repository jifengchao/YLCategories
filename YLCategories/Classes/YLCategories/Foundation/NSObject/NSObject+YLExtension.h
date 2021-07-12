//
//  NSObject+YLExtension.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <Foundation/Foundation.h>

@interface NSObject (YLExtension)

/** 函数防抖调用*/
- (void)yl_debounce:(SEL)action delay:(NSTimeInterval)delay;

@end
