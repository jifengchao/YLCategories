//
//  NSString+YLJsonString.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <Foundation/Foundation.h>

@interface NSString (YLJsonString)

/** 将普通字符串对象转化为json字符串*/
+ (NSString *)yl_jsonStringWithString:(NSString *)string;
/** 将数组对象转化为json字符串*/
+ (NSString *)yl_jsonStringWithArray:(NSArray *)array;
/** 将字典对象转化为json字符串*/
+ (NSString *)yl_jsonStringWithDictionary:(NSDictionary *)dictionary;
/** 将某一个对象转化为json字符串*/
+ (NSString *)yl_jsonStringWithObject:(id)object;

@end
