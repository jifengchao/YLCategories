//
//  UITextField+YLLimitLength.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UITextField+YLLimitLength.h"
#import <objc/runtime.h>

static const void *YLTextFieldInputLimitMaxLength = &YLTextFieldInputLimitMaxLength;
static const void *YLTextFieldInputLimitDigital = &YLTextFieldInputLimitDigital;
static const void *YLTextFieldLastText = &YLTextFieldLastText;
static const void *YLEditingBlockKey = &YLEditingBlockKey;
static const void *YLEndBlockKey = &YLEndBlockKey;
static const void *YLOverMaxLengthBlockKey = &YLOverMaxLengthBlockKey;

@implementation UITextField (YLLimitLength)

#pragma mark setter、getter

- (NSInteger)yl_maxLength {
    return [objc_getAssociatedObject(self, YLTextFieldInputLimitMaxLength) integerValue];
}

- (void)setYl_maxLength:(NSInteger)maxLength {
    objc_setAssociatedObject(self, YLTextFieldInputLimitMaxLength, @(maxLength), OBJC_ASSOCIATION_ASSIGN);
    [self addTarget:self action:@selector(yl_textFieldTextDidChange) forControlEvents:UIControlEventEditingChanged];
}

- (BOOL)yl_digitalText {
    return [objc_getAssociatedObject(self, YLTextFieldInputLimitDigital) boolValue];
}

- (void)setYl_digitalText:(BOOL)yl_digitalText {
    objc_setAssociatedObject(self, YLTextFieldInputLimitDigital, @(yl_digitalText), OBJC_ASSOCIATION_ASSIGN);
    [self addTarget:self action:@selector(yl_textFieldTextDidChange) forControlEvents:UIControlEventEditingChanged];
}

/** 上一次文本*/
- (NSString *)yl_lastText  {
    return objc_getAssociatedObject(self, YLTextFieldLastText);
}

- (void)setYl_lastText:(NSString *)yl_lastText {
    objc_setAssociatedObject(self, YLTextFieldLastText, yl_lastText, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
 使用时只要调用此方法，加上一个长度(int)，就可以实现了字数限制
 block是正在编辑的回调
 */
- (void)yl_limitTextLength:(int)length editingBlock:(YLEditingBlock)editingBlock {
    self.yl_maxLength = length;
    if (editingBlock) {
        objc_setAssociatedObject(self, YLEditingBlockKey, editingBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

/**
 使用时只要调用此方法，加上一个长度(int)，就可以实现了字数限制
 block是正在编辑的回调
 overblock是超出范围后的回调
 */
- (void)yl_limitTextLength:(int)length editingBlock:(YLEditingBlock)editingBlock overBlock:(YLOverMaxLengthBlock)overBlock {
    [self yl_limitTextLength:length editingBlock:editingBlock];
    if (overBlock) {
        objc_setAssociatedObject(self, YLOverMaxLengthBlockKey, overBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

/**
 使用时只要调用此方法，加上一个长度(int)，就可以实现了字数限制
 endBlock是编辑结束后的回调
 */
- (void)yl_limitTextLength:(int)length endBlock:(YLEditEndBlock)endBlock {
    self.yl_maxLength = length;
    if (endBlock) {
        objc_setAssociatedObject(self, YLEndBlockKey, endBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    [self addTarget:self action:@selector(yl_textFieldTextDidEndEdit) forControlEvents:UIControlEventEditingDidEnd];
}

/** 实现纯数字输入的字数限制*/
- (void)yl_digitalLimitTextLength:(int)length {
    self.yl_maxLength = length;
    // 纯数字
    self.yl_digitalText = YES;
}

/** 实现纯数字输入的字数限制*/
- (void)yl_digitalLimitTextLength:(int)length editingBlock:(YLEditingBlock)editingBlock {
    [self yl_limitTextLength:length editingBlock:editingBlock];
    // 纯数字
    self.yl_digitalText = YES;
}

/** 判断文本是否为纯数字*/
+ (BOOL)yl_isAllDigital:(NSString *)text {
    NSString *regex = @"^[0-9]*$";
    return [self __validateByRegexString:regex text:text];
}

#pragma mark ControlEvent

/** 文字输入变化监听*/
- (void)yl_textFieldTextDidChange {
    NSString *toBeString = self.text;
    // 获取高亮部分
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    // 在iOS7下,position对象总是不为nil
    if ((!position || !selectedRange)) {
        if (self.yl_maxLength > 0 && toBeString.length > self.yl_maxLength) {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.yl_maxLength];
            if (rangeIndex.length == 1) {
                self.text = [toBeString substringToIndex:self.yl_maxLength];
            } else {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.yl_maxLength)];
                NSInteger tmpLength;
                if (rangeRange.length > self.yl_maxLength) {
                    tmpLength = rangeRange.length - rangeIndex.length;
                } else {
                    tmpLength = rangeRange.length;
                }
                self.text = [toBeString substringWithRange:NSMakeRange(0, tmpLength)];
            }
            
            YLOverMaxLengthBlock overBlock = objc_getAssociatedObject(self, YLOverMaxLengthBlockKey);
            if (overBlock) {
                overBlock();
            }
        }
        // 判断是否为纯数字
        if (self.yl_digitalText) {
            if (self.text.length) {
                if (![[self class] yl_isAllDigital:self.text]) { // 非纯数字
                    self.text = [self yl_lastText];
                } else {
                    [self setYl_lastText:self.text];
                }
            } else {
                [self setYl_lastText:self.text];
            }
        }
        YLEditingBlock editingBlock = objc_getAssociatedObject(self, YLEditingBlockKey);
        if (editingBlock) {
            editingBlock(self.text);
        }
    }
}

/** 文字输入结束监听*/
- (void)yl_textFieldTextDidEndEdit {
    YLEditEndBlock endBlock = objc_getAssociatedObject(self, YLEndBlockKey);
    if (endBlock) {
        endBlock(self.text);
    }
}

/**
 抖动效果，可自定义效果
 */
- (void)yl_shake
{
    CAKeyframeAnimation *keyAn = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [keyAn setDuration:0.5f];
    NSArray *array = [[NSArray alloc] initWithObjects:
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x-5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x+5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x-5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x+5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x-5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x+5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      nil];
    [keyAn setValues:array];
    
    NSArray *times = [[NSArray alloc] initWithObjects:
                      [NSNumber numberWithFloat:0.1f],
                      [NSNumber numberWithFloat:0.2f],
                      [NSNumber numberWithFloat:0.3f],
                      [NSNumber numberWithFloat:0.4f],
                      [NSNumber numberWithFloat:0.5f],
                      [NSNumber numberWithFloat:0.6f],
                      [NSNumber numberWithFloat:0.7f],
                      [NSNumber numberWithFloat:0.8f],
                      [NSNumber numberWithFloat:0.9f],
                      [NSNumber numberWithFloat:1.0f],
                      nil];
    [keyAn setKeyTimes:times];
    
    [self.layer addAnimation:keyAn forKey:@"TextAnim"];
}

#pragma mark - 正则表达式验证

+ (BOOL)__validateByRegexString:(NSString *)regexString text:(NSString *)text {
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:regexString options:0 error:nil];
    NSArray *results = [regex matchesInString:text options:0 range:NSMakeRange(0, text.length)];
    return results.count;
}

@end
