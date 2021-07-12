//
//  UIPasteboard+YLExtension.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UIPasteboard (YLExtension)

/* 复制文字到剪切板*/
+ (void)yl_copyToPasteboardWithString:(NSString *)string finishBlock:(void(^)(void))block;

@end
