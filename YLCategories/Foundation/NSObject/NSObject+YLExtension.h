//
//  NSObject+YLExtension.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <Foundation/Foundation.h>

@interface NSObject (YLExtension)

/** 当前时刻*/
- (CFAbsoluteTime)yl_currentRunTime;

/** 清除启动图缓存 */
- (void)yl_clearSnapshots;

/** 对象的引用计数值*/
- (NSInteger)yl_retainCount;

@end
