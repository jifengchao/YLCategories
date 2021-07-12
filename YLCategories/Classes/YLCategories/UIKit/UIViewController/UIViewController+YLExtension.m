//
//  UIViewController+YLExtension.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UIViewController+YLExtension.h"

@implementation UIViewController (YLExtension)

/** 将资源分享出去*/
- (void)yl_shareLog:(NSURL *)fileURL {
    // 在iOS 11不显示分享选项了
    // 定义URL数组
    NSArray *urls = @[fileURL];
    // 创建分享的类型,注意这里没有常见的微信,朋友圈以QQ等,但是罗列完后,实际运行是相应按钮的,所以可以运行.

    UIActivityViewController *activituVC = [[UIActivityViewController alloc] initWithActivityItems:urls applicationActivities:nil];
    NSArray *cludeActivitys = @[UIActivityTypeMessage,
                                UIActivityTypeMail,
                                UIActivityTypeCopyToPasteboard,
                                UIActivityTypePrint,
                                UIActivityTypeAssignToContact,
                                UIActivityTypeSaveToCameraRoll,
                                UIActivityTypeAddToReadingList];
    activituVC.excludedActivityTypes = cludeActivitys;
    
    // 显示分享窗口
    [self presentViewController:activituVC animated:YES completion:nil];
}

@end
