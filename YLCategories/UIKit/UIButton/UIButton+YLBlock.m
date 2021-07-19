//
//  UIButton+YLBlock.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UIButton+YLBlock.h"
#import <objc/runtime.h>

static const void *yl_UIButtonBlockKey = &yl_UIButtonBlockKey;

@implementation UIButton (YLBlock)

- (void)yl_addActionHandler:(YLTouchedButtonBlock)touchHandler {
    objc_setAssociatedObject(self, yl_UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(__blockActionTouched:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)__blockActionTouched:(UIButton *)btn {
    YLTouchedButtonBlock block = objc_getAssociatedObject(self, yl_UIButtonBlockKey);
    if (block) {
        block(btn.tag);
    }
}

@end
