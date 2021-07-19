//
//  UIApplication+YLCall.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UIApplication+YLCall.h"

@implementation UIApplication (YLCall)

/** 拨打电话*/
- (void)yl_callPhoneWith:(NSString *)phone resultBlock:(void(^)(BOOL isValid))resultBlock {
    // 验证手机号格式
    NSString *formatted = [self __correctFormattedPhoneWith:phone];
    if (formatted.length) {
        // 拨打电话
        if (@available(iOS 10.0, *)) {
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", formatted]];
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        } else {
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", formatted]];
            [[UIApplication sharedApplication] openURL:url];
        }
    }
    if (resultBlock) {
        resultBlock(formatted.length);
    }
}

- (void)yl_callPhoneWith:(NSString *)phone {
    [self yl_callPhoneWith:phone resultBlock:nil];
}

#pragma mark private methods

/** 获取格式化之后的手机号 错误则返回nil*/
- (NSString *)__correctFormattedPhoneWith:(NSString *)phone {
    if (phone.length == 0) return nil;
    NSString *string = [phone copy];
    if (@available(iOS 10.0, *)) {
    } else {
        // 去除+86
        NSString *prefixString = @"+86";
        if ([string hasPrefix:prefixString]) {
            string = [phone substringFromIndex:prefixString.length];
        }
    }
    if (string.length < 11) { // 简单的长度判断
        return nil;
    }
    return string;
    
    /*
     +86 和 长度11位，再国际化场景下，需要自行去适配
     */
}

@end
