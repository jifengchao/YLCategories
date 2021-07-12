//
//  NSString+YLRegex.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "NSString+YLRegex.h"

@implementation NSString (YLRegex)

/** 判断全是数字*/
- (BOOL)yl_isAllDigital {
    NSString *regex = @"^[0-9]*$";
    return [self __validateByRegexString:regex];
}

/** 判断全是中文*/
- (BOOL)yl_isAllChinese {
    NSString *regex = @"^[\\u4e00-\\u9fa5]+$";
    return [self __validateByRegexString:regex];
}

/** 判断全是空格*/
- (BOOL)yl_isAllWhiteSpace {
    if (self.length == 0) return YES;
    NSString *removedSpaceString = [self stringByReplacingOccurrencesOfString:@" " withString:@""]; // 过滤空格
    return (removedSpaceString.length == 0);
}

/** 判断特殊条件*/
- (BOOL)yl_custom_ {
    /* 大小写字母+中文*/
    return [self __validateByRegexString:@"^[a-zA-Z\u4e00-\u9fa5]+$"];
}


/* 移除所有满足条件的字符，以string替换*/
- (NSString *)yl_replaceingWithSatisfyingBlock:(BOOL(^)(NSString *substring))satisfyingBlock withString:(NSString *)string {
    if (!satisfyingBlock) return self;
    
    NSMutableString * __block buffer = [NSMutableString stringWithCapacity:[self length]];
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        [buffer appendString:(satisfyingBlock(substring)) ?(string.length ?string :@"") :substring];
    }];
    
    return buffer;
}

#pragma mark - 正则表达式验证
- (BOOL)__validateByRegexString:(NSString *)regexString {
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:regexString options:0 error:nil];
    NSArray *results = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    return results.count;
}

@end
