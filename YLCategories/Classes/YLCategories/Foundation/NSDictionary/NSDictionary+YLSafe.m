//
//  NSDictionary+YLSafe.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "NSDictionary+YLSafe.h"
#import <objc/runtime.h>

@implementation NSDictionary (YLSafe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getClassMethod(self, @selector(dictionaryWithObjects:forKeys:count:));
        Method swizzledMethod = class_getClassMethod(self, @selector(yl_dictionaryWithObjects:forKeys:count:));
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

+ (instancetype)yl_dictionaryWithObjects:(const id [])objects forKeys:(const id <NSCopying> [])keys count:(NSUInteger)cnt {
    id nObjects[cnt];
    id nKeys[cnt];
    int i=0, j=0;
    for (; i<cnt && j<cnt; i++) {
        if (objects[i] && keys[i]) {
            nObjects[j] = objects[i];
            nKeys[j] = keys[i];
            j++;
        } else { // 存在为空的情形
            NSLog(@"NSDictionary value == nil \n key = %@", keys[i]);
            /*
             上报信息 - 堆栈信息 + key
             */
            NSString *reason = [NSString stringWithFormat:@"*** -[__NSPlaceholderDictionary initWithObjects:forKeys:count:]: attempt to insert nil object from objects[0], key = %@", keys[i]];
            NSException *exception = [NSException exceptionWithName:NSInvalidArgumentException reason:reason userInfo:nil];
            [exception raise];
        }
    }
    
    return [self yl_dictionaryWithObjects:nObjects forKeys:nKeys count:j];
}

@end

@implementation NSMutableDictionary (YLSafe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class dictCls = NSClassFromString(@"__NSDictionaryM");
        Method originalMethod = class_getInstanceMethod(dictCls, @selector(setObject:forKeyedSubscript:));
        Method swizzledMethod = class_getInstanceMethod(dictCls, @selector(yl_setObject:forKeyedSubscript:));
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

- (void)yl_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key {
    if (!obj || !key) return;
    [self yl_setObject:obj forKeyedSubscript:key];
}

@end
