//
//  UIView+YLMake.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UIView+YLMake.h"

@implementation UIView (YLMake)

+ (UIView *)yl_viewWithBackgroundColor:(UIColor *)backgroundColor {
    UIView *view = [[UIView alloc] init];
    if (backgroundColor) view.backgroundColor = backgroundColor;
    return view;
}

/** 获取当前视图的导航控制器*/
- (UINavigationController *)yl_navigationController {
    UIViewController *vc = [self __viewController];
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return (UINavigationController *)vc;
    }
    return nil;
}

/** 获取当前视图的控制器*/
- (UIViewController *)yl_viewController {
    UIViewController *vc = [self __viewController];
    if ([vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nvc = (UINavigationController *)vc;
        if (nvc.topViewController) return nvc.topViewController;
    }
    if ([vc isKindOfClass:[UITabBarController class]]) {
        // todo ：待实现
    }
    return vc;
}

#pragma mark private methods

/** 获取当前视图的控制器*/
- (UIViewController *)__viewController {
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
