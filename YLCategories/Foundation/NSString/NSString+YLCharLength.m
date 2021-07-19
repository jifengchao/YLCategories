//
//  NSString+YLCharLength.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

/*
 iOS计算字符串的对应字节数
 https://www.jianshu.com/p/1b3ecbc9b5c1
 */

#import "NSString+YLCharLength.h"

@implementation NSString (YLCharLength)

- (NSUInteger)yl_charactorNumber {
    NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    return [self yl_charactorNumberWithEncoding:encoding];
}

- (NSUInteger)yl_charactorNumberWithEncoding:(NSStringEncoding)encoding {
    NSUInteger strLength = 0;
    char *p = (char *)[self cStringUsingEncoding:encoding];
    
    NSUInteger lengthOfBytes = [self lengthOfBytesUsingEncoding:encoding];
    for (int i = 0; i < lengthOfBytes; i++) {
        if (*p) {
            p++;
            strLength++;
        }
        else {
            p++;
        }
    }
    return strLength;
}

- (NSUInteger)yl_charactorNumberForChineseSpecial {
    NSUInteger strLength = 0;
    for(int i = 0; i < [self length]; i++) {
        int a = [self characterAtIndex:i];
        if (a >= 0x4e00 && a <= 0x9fa5) { // judging whether it is Chinese
            strLength += 2;
        } else {
            strLength += 1;
        }
    }
    return strLength;
}

@end
