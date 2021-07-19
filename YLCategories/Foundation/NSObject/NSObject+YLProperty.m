//
//  NSObject+YLProperty.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "NSObject+YLProperty.h"

#import <objc/runtime.h>

@implementation NSObject (YLProperty)

/** 打印属性列表*/
- (void)yl_printIvarList:(Class)cls {
    if (!cls) return;
    unsigned int numIvars;
    Ivar *vars = class_copyIvarList(cls, &numIvars);
    NSString *key = nil;
    for(int i = 0; i < numIvars; i++) {
        Ivar thisIvar = vars[i];
        key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
        NSLog(@"variable_name:%@", key);
    }
    free(vars);
}

/** 打印方法列表*/
- (void)yl_printMethodList:(Class)cls {
    if (!cls) return;
    unsigned int count;
    Method *methods = class_copyMethodList(cls, &count);
    for (int i = 0; i < count; i++) {
        Method method = methods[i];
        SEL selector = method_getName(method);
        NSString *name = NSStringFromSelector(selector);
        NSLog(@"method_getName:%@",name);
    }
}

/** 根据属性名获取对象属性值*/
// https://www.jianshu.com/p/88fc64ab0866
- (id)yl_getIvarWithName:(NSString *)name {
    Class cls = [self class];
    if (name.length == 0 || !cls) return nil;
    id obj = nil;
    
    // 注意成员变量必须“_名称”
    Ivar name_Ivar = class_getInstanceVariable([self class],  [name cStringUsingEncoding:NSUTF8StringEncoding]);
    NSString *name_str = @(ivar_getName(name_Ivar));
    NSLog(@"variable_name :%@", name_str);
    if (name_Ivar) {
        obj = object_getIvar(self, name_Ivar);
    }
    
    return obj;
}

@end
