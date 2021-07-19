//
//  NSArray+YLExtension.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <Foundation/Foundation.h>

@interface NSArray (YLExtension)

/** 移除数组中的某个元素*/
- (NSMutableArray *)yl_removeObjectWith:(id)obj;

@end
