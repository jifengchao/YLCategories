//
//  UITextView+YLPlaceholder.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UITextView+YLPlaceholder.h"
#import <objc/runtime.h>

@implementation UITextView (YLPlaceholder)

#pragma mark - Swizzle Dealloc

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc")),
                                       class_getInstanceMethod(self.class, @selector(swizzledDealloc)));
    });
}

- (void)swizzledDealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    UILabel *label = objc_getAssociatedObject(self, @selector(yl_placeholderLabel));
    if (label) {
        for (NSString *key in self.class.observingKeys) {
            @try {
                [self removeObserver:self forKeyPath:key];
            }
            @catch (NSException *exception) {
                // Do nothing
            }
        }
    }
    [self swizzledDealloc];
}

#pragma mark - Class Methods
#pragma mark `yl_defaultPlaceholderColor`

+ (UIColor *)yl_defaultPlaceholderColor {
    static UIColor *color = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (@available(iOS 13.0, *)) {
            // #dfdfdf
            color = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1];
        } else {
            UITextField *textField = [[UITextField alloc] init];
            textField.placeholder = @" ";
            color = [textField valueForKeyPath:@"_placeholderLabel.textColor"];
        }
    });
    return color;
}


#pragma mark - `observingKeys`

+ (NSArray *)observingKeys {
    return @[@"attributedText",
             @"bounds",
             @"font",
             @"frame",
             @"text",
             @"textAlignment",
             @"textContainerInset"];
}


#pragma mark - Properties
#pragma mark `yl_placeholderLabel`

- (UILabel *)yl_placeholderLabel {
    UILabel *label = objc_getAssociatedObject(self, @selector(yl_placeholderLabel));
    if (!label) {
        NSAttributedString *originalText = self.attributedText;
        self.text = @" "; // lazily set font of `UITextView`.
        self.attributedText = originalText;
        
        label = [[UILabel alloc] init];
        label.textColor = [self.class yl_defaultPlaceholderColor];
        label.numberOfLines = 0;
        label.userInteractionEnabled = NO;
        objc_setAssociatedObject(self, @selector(yl_placeholderLabel), label, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(updatePlaceholderLabel)
                                                     name:UITextViewTextDidChangeNotification
                                                   object:self];
        
        for (NSString *key in self.class.observingKeys) {
            [self addObserver:self forKeyPath:key options:NSKeyValueObservingOptionNew context:nil];
        }
    }
    return label;
}


#pragma mark `placeholder`

- (NSString *)yl_placeholder {
    return self.yl_placeholderLabel.text;
}

- (void)setYl_placeholder:(NSString *)yl_placeholder {
    self.yl_placeholderLabel.text = yl_placeholder;
    [self updatePlaceholderLabel];
}

- (NSAttributedString *)yl_attributedPlaceholder {
    return self.yl_placeholderLabel.attributedText;
}

- (void)setYl_attributedPlaceholder:(NSAttributedString *)yl_attributedPlaceholder {
    self.yl_placeholderLabel.attributedText = yl_attributedPlaceholder;
    [self updatePlaceholderLabel];
}

#pragma mark `placeholderColor`

- (UIColor *)yl_placeholderColor {
    return self.yl_placeholderLabel.textColor;
}

- (void)setYl_placeholderColor:(UIColor *)yl_placeholderColor {
    self.yl_placeholderLabel.textColor = yl_placeholderColor;
}


#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    [self updatePlaceholderLabel];
}


#pragma mark - Update

- (void)updatePlaceholderLabel {
    if (self.text.length) {
        [self.yl_placeholderLabel removeFromSuperview];
        return;
    }
    
    [self insertSubview:self.yl_placeholderLabel atIndex:0];
    
    self.yl_placeholderLabel.font = self.font;
    self.yl_placeholderLabel.textAlignment = self.textAlignment;
    
    // `NSTextContainer` is available since iOS 7
    CGFloat lineFragmentPadding;
    UIEdgeInsets textContainerInset;
    
#pragma deploymate push "ignored-api-availability"
    // iOS 7+
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        lineFragmentPadding = self.textContainer.lineFragmentPadding;
        textContainerInset = self.textContainerInset;
    }
#pragma deploymate pop
    
    // iOS 6
    else {
        lineFragmentPadding = 5;
        textContainerInset = UIEdgeInsetsMake(8, 0, 8, 0);
    }
    
    CGFloat x = lineFragmentPadding + textContainerInset.left;
    CGFloat y = textContainerInset.top;
    CGFloat width = CGRectGetWidth(self.bounds) - x - lineFragmentPadding - textContainerInset.right;
    CGFloat height = [self.yl_placeholderLabel sizeThatFits:CGSizeMake(width, 0)].height;
    self.yl_placeholderLabel.frame = CGRectMake(x, y, width, height);
}

@end
