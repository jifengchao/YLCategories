//
//  NSArray+YLExtension.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "NSArray+YLExtension.h"

@implementation NSArray (YLExtension)

/** 移除数组中的某个元素*/
- (NSMutableArray *)yl_removeObjectWith:(id)obj {
    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:self];
    if (!obj || self.count == 0) return mutArray;
    [mutArray removeObjectsInArray:@[obj]];
    return mutArray;
}

@end

