//
//  NSDictionary+YLExtension.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "NSDictionary+YLExtension.h"

@implementation NSDictionary (YLExtension)

/** 拷贝字典键集合内容*/
+ (NSMutableDictionary *)yl_duplicateWith:(NSDictionary *)dic allKeys:(NSArray *)allKeys {
    if (!dic || allKeys.count == 0) return nil;
    
    NSMutableArray *keys = [NSMutableArray arrayWithArray:allKeys];
    NSMutableDictionary *duplicatedDic = [NSMutableDictionary dictionary];
    for (NSString *keyString in keys) {
        id obj = dic[keyString];
        if (obj) {
            duplicatedDic[keyString] = obj;
        }
    }
    return duplicatedDic;
}

/** 比较两个字典的键集合内容是否完全一致
 NSString：isEqualToString:
 其他：isEqual:
 */
- (BOOL)yl_isEqualTo:(NSDictionary *)dic allKeys:(NSArray *)allKeys {
    if (!dic || allKeys.count == 0) return NO;
    
    NSMutableArray *keys = [NSMutableArray arrayWithArray:allKeys];
    
    for (NSString *keyString in keys) {
        id obj0 = self[keyString];
        id obj1 = dic[keyString];
        if (!obj0 && !obj1) { continue; } // 无比较的
        if (!obj0 || !obj1) return NO; // 某一个值是为空的
        
        if ([obj0 isKindOfClass:NSString.class]) {
            NSString *obj0_str = [NSString stringWithFormat:@"%@", obj0];
            if (![obj1 isKindOfClass:NSString.class]) return NO; // 类型不匹配
            NSString *obj1_str = [NSString stringWithFormat:@"%@", obj1];
            if (![obj0_str isEqualToString:obj1_str]) return NO; // 值不相等
        } else {
            if (![obj0 isEqual:obj1]) return NO; // 不相等
        }
        
        NSString *obj0_str = [NSString stringWithFormat:@"%@", obj0];
        NSString *obj1_str = [NSString stringWithFormat:@"%@", obj1];
        if (![obj0_str isEqualToString:obj1_str]) {
            return NO;
        }
    }
    return YES;
}

/** 字典对象是否存在keyName键*/
+ (BOOL)yl_containKey:(id)anyObject keyName:(NSString *)key {
    if (key.length == 0) return NO;
    if (![self __isDictionary:anyObject]) return NO;
    
    NSDictionary *dic = (NSDictionary *)anyObject;
    NSArray *allKeys = dic.allKeys;
    if (allKeys.count == 0) return NO;
    
    return [allKeys containsObject:key];
}

#pragma mark private methods

/** 判断是否为字典类型*/
+ (BOOL)__isDictionary:(id)anyObject {
    if (!anyObject) return NO;
    if ([anyObject isKindOfClass:NSDictionary.class] ||
        [anyObject isKindOfClass:NSMutableDictionary.class]) {
        return YES;
    }
    return NO;
}

@end
