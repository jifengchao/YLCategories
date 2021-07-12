//
//  NSDictionary+YLExtension.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YLExtension)

/** 拷贝字典键集合内容*/
+ (NSMutableDictionary *)yl_duplicateWith:(NSDictionary *)dic allKeys:(NSArray *)allKeys;

/** 比较两个字典的键集合内容是否完全一致
 NSString：isEqualToString:
 其他：isEqual:
 */
- (BOOL)yl_isEqualTo:(NSDictionary *)dic allKeys:(NSArray *)allKeys;

/** 字典对象是否存在keyName键*/
+ (BOOL)yl_containKey:(id)anyObject keyName:(NSString *)key;

@end
