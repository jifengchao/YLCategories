//
//  UIViewController+YLAlert.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UIViewController+YLAlert.h"

@implementation UIViewController (HYLAlert)

/** UIAlertController 快速创建*/
- (void)yl_alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonName:(NSString *)cancelButtonName sureButtonName:(NSString *)sureButtonName cancelBlock:(void(^)(void))cancelBlock sureBlock:(void(^)(void))sureBlock {
    cancelButtonName = cancelButtonName.length ?cancelButtonName :@"取消";
    sureButtonName = sureButtonName.length ?sureButtonName :@"确定";
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    
    __weak typeof(alert) weakAlert = alert;
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonName style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        if (cancelBlock) { cancelBlock(); }
        [weakAlert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:cancelAction];
    
    UIAlertAction *setAction = [UIAlertAction actionWithTitle:sureButtonName style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        if (sureBlock) { sureBlock(); }
    }];
    [alert addAction:setAction];
    
    alert.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)yl_alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonName:(NSString *)cancelButtonName cancelBlock:(void(^)(void))cancelBlock {
    cancelButtonName = cancelButtonName.length ?cancelButtonName :@"取消";
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    
    __weak typeof(alert) weakAlert = alert;
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonName style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        if (cancelBlock) { cancelBlock(); }
        [weakAlert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:cancelAction];
    
    alert.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:alert animated:YES completion:nil];
}

+ (UIView *)cancelWith:(UIAlertController *)updateAlert {
    // http://www.jianshu.com/p/b84e1bc81666
    UIView *subView1 = updateAlert.view.subviews[0];
    UIView *subView2 = subView1.subviews[0];
    UIView *subView3 = subView2.subviews[0];
    UIView *subView4 = subView3.subviews[0];
    UIView *subView5 = subView4.subviews[0];
    // 取title和message：
    //        UILabel *titleLab = subView5.subviews[0];
    //        titleLab.textAlignment = NSTextAlignmentLeft;
    UILabel *messageLab = subView5.subviews[1];
    if (@available(iOS 12.0, *)) {
        messageLab = subView5.subviews[2];
    }
    messageLab.textAlignment = NSTextAlignmentLeft;
    
    return messageLab;
}

@end
