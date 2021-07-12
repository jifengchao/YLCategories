//
//  UIApplication+YLCall.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UIApplication (YLCall)

/** 拨打电话*/
- (void)yl_callPhoneWith:(NSString *)phone resultBlock:(void(^)(BOOL isValid))resultBlock;
- (void)yl_callPhoneWith:(NSString *)phone;

@end
