//
//  UIViewController+YLAlert.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HYLAlert)

- (void)yl_alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonName:(NSString *)cancelButtonName sureButtonName:(NSString *)sureButtonName cancelBlock:(void(^)(void))cancelBlock sureBlock:(void(^)(void))sureBlock;

- (void)yl_alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonName:(NSString *)cancelButtonName cancelBlock:(void(^)(void))cancelBlock;

@end
