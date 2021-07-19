//
//  NSObject+YLProperty.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <Foundation/Foundation.h>

@interface NSObject (YLProperty)

/** 打印属性列表*/
- (void)yl_printIvarList:(Class)cls;

/** 打印方法列表*/
- (void)yl_printMethodList:(Class)cls;

/** 根据属性名获取对象属性值*/
- (id)yl_getIvarWithName:(NSString *)name;

@end



