//
//  NSString+YLExtension.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "NSString+YLExtension.h"

@implementation NSString (YLExtension)

/* 从小到大排序 数字*/
- (NSString *)yl_sortedAscendingDigitalString {
    if (self.length == 0) { return @""; }
    NSMutableArray *muArray = [NSMutableArray array];
    for (int index = 0; index < self.length; index++) {
        NSRange range = NSMakeRange(index, 1);
        NSString *substring = [self substringWithRange:range];
        [muArray addObject:substring];
    }
    NSArray *sortedArray = [muArray sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return ([obj1 compare:obj2] == NSOrderedDescending);
    }];
    NSString *sortedString = [sortedArray componentsJoinedByString:@""];
    
    return sortedString;
}
/* 从小到大排序 数字*/
+ (NSString *)yl_sortedAscendingDigitalStringWith:(NSString *)string {
    return [string yl_sortedAscendingDigitalString];
}

#pragma mark - 去除字符串首尾连续字符
// https://www.cnblogs.com/Free-Thinker/p/11429709.html

/** 去除字符串首部连续字符*/
- (NSString *)hyl_stringByTrimmingLeftCharactersInSet:(NSCharacterSet *)characterSet {
    NSUInteger location = 0;
    NSUInteger length = [self length];
    unichar charBuffer[length];
    [self getCharacters:charBuffer range:NSMakeRange(0, length)];
    
    for (NSInteger i = 0; i < length; i++) {
        if (![characterSet characterIsMember:charBuffer[i]]) {
            location = i;
            break;
        }
    }
    
    return [self substringWithRange:NSMakeRange(location, length - location)];
}

/** 去除字符串尾部连续字符*/
- (NSString *)hyl_stringByTrimmingRightCharactersInSet:(NSCharacterSet *)characterSet {
    NSUInteger length = [self length];
    unichar charBuffer[length];
    [self getCharacters:charBuffer range:NSMakeRange(0, length)];
    
    NSUInteger subLength = 0;
    for (NSInteger i = length; i > 0; i--) {
        if (![characterSet characterIsMember:charBuffer[i - 1]]) {
            subLength = i;
            break;
        }
    }
    
    return [self substringWithRange:NSMakeRange(0, subLength)];
}

@end
