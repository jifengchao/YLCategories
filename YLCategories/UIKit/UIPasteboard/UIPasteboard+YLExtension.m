//
//  UIPasteboard+YLExtension.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UIPasteboard+YLExtension.h"

@implementation UIPasteboard (YLExtension)

/* 复制文字到剪切板*/
+ (void)yl_copyToPasteboardWithString:(NSString *)string finishBlock:(void(^)(void))block {
    if (string.length == 0) return;
    
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = string;
    
    if (block) block();
}

@end
