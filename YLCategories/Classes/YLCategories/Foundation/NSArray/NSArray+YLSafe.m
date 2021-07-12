//
//  NSArray+YLSafe.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "NSArray+YLSafe.h"
#import <objc/runtime.h>

@implementation NSArray (YLSafe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getClassMethod(self, @selector(arrayWithObjects:count:));
        Method swizzledMethod = class_getClassMethod(self, @selector(yl_arrayWithObjects:count:));
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

+ (instancetype)yl_arrayWithObjects:(const id [])objects count:(NSUInteger)cnt {
    id nObjects[cnt];
    int i=0, j=0;
    for (; i<cnt && j<cnt; i++) {
        if (objects[i]) {
            nObjects[j] = objects[i];
            j++;
        }
    }
    
    return [self yl_arrayWithObjects:nObjects count:j];
}

@end


@implementation NSMutableArray (HYLSafe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class arrayCls = NSClassFromString(@"__NSArrayM");
        
        Method originalMethod1 = class_getInstanceMethod(arrayCls, @selector(insertObject:atIndex:));
        Method swizzledMethod1 = class_getInstanceMethod(arrayCls, @selector(yl_insertObject:atIndex:));
        method_exchangeImplementations(originalMethod1, swizzledMethod1);
        
        Method originalMethod2 = class_getInstanceMethod(arrayCls, @selector(setObject:atIndex:));
        Method swizzledMethod2 = class_getInstanceMethod(arrayCls, @selector(yl_setObject:atIndex:));
        method_exchangeImplementations(originalMethod2, swizzledMethod2);
    });
}

- (void)yl_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (!anObject) return;
    [self yl_insertObject:anObject atIndex:index];
}

- (void)yl_setObject:(id)anObject atIndex:(NSUInteger)index {
    if (!anObject) return;
    [self yl_setObject:anObject atIndex:index];
}

@end
