//
//  UITextField+YLDelegate.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UITextField+YLDelegate.h"
#import <objc/runtime.h>

@implementation UITextField (YLDelegate)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method method1 = class_getInstanceMethod([self class], NSSelectorFromString(@"deleteBackward"));
        Method method2 = class_getInstanceMethod([self class], @selector(yx_deleteBackward));
        method_exchangeImplementations(method1, method2);
        
        method1 = class_getInstanceMethod([self class], NSSelectorFromString(@"becomeFirstResponder"));
        method2 = class_getInstanceMethod([self class], @selector(yx_becomeFirstResponder));
        method_exchangeImplementations(method1, method2);
    });
}

- (void)yx_deleteBackward {
    [self yx_deleteBackward];
    
    if ([self.delegate respondsToSelector:@selector(textFieldDidDeleteBackward:)]) {
        id <YLTextFieldDelegate> delegate  = (id<YLTextFieldDelegate>)self.delegate;
        [delegate textFieldDidDeleteBackward:self];
    }
}

- (BOOL)yx_becomeFirstResponder {
    if ([self.delegate respondsToSelector:@selector(textFieldBecomeFirstResponder:)]) {
        id <YLTextFieldDelegate> delegate  = (id<YLTextFieldDelegate>)self.delegate;
        [delegate textFieldBecomeFirstResponder:self];
    }
    return  [self yx_becomeFirstResponder];
}

@end
