//
//  UISearchBar+YLAppearance.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UISearchBar+YLAppearance.h"

#import "UITextField+YLPlaceholder.h"

@implementation UISearchBar (YLAppearance)

- (void)yl_setTextColor:(UIColor *)textColor {
    UITextField *searchField = [self __searchTextField];
    // 输入文本颜色
    searchField.textColor = textColor;
}

- (void)yl_setTextFont:(UIFont *)font {
    UITextField *searchField = [self __searchTextField];
    // 文本字体
    searchField.font = font;
}

- (void)yl_placeholder:(NSString *)placeholder placeholder_color:(UIColor *)placeholder_color {
    UITextField *searchField = [self __searchTextField];
    // 文本颜色
    [searchField yl_setPlaceholder:placeholder color:placeholder_color font:searchField.font];
}

/** 设置searchbar背景色*/
- (void)yl_setBackgroundColor:(UIColor *)backgroundColor {
    if (!backgroundColor) { return; }
    
    [self setBackgroundColor:backgroundColor];
    // 移除蒙版
    [self __removeBarBackground];
    // searchField
    UITextField *searchField = [self __searchTextField];
    searchField.backgroundColor = backgroundColor;
}

/** 设置放大镜图标*/
- (void)yl_setGlassImage:(UIImage *)glassImage {
    if (!glassImage) { return; }
    // 移除蒙版
    [self __removeBarBackground];
    // searchField
    UITextField *searchField = [self __searchTextField];
    // 修改默认的放大镜图片
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, glassImage.size.width, glassImage.size.height)];
    imageView.backgroundColor = [UIColor clearColor];
    imageView.image = glassImage;
    searchField.leftView = imageView;
}

#pragma mark - 私有方法

/** 移除蒙版 UISearchBarBackground*/
- (void)__removeBarBackground {
    if (@available(iOS 13.0, *)) { // 不能移除
        return;
    } else {
        if (self.subviews.count == 0) { return; }
        UIView *viewLevel0 = self.subviews[0];
        if (viewLevel0.subviews.count) {
            UIView *viewLevel0_0 = viewLevel0.subviews[0];
            if (![viewLevel0_0 isKindOfClass:[UITextField class]]) {
                [viewLevel0_0 removeFromSuperview];
                return;
            }
        }
    }
}

/** 获取 UISearchBarTextField*/
- (UITextField *)__searchTextField {
    if (self.subviews.count == 0) { return nil; }
    UIView *viewLevel0 = self.subviews[0];
    if (@available(iOS 13.0, *)) {
        if (viewLevel0.subviews.count == 0) { return nil; }
        for (UIView *viewLevel0_ in viewLevel0.subviews) {
            if (viewLevel0_.subviews.count) {
                for (UIView *oneView in viewLevel0_.subviews) {
                    if ([oneView isKindOfClass:[UITextField class]]) {
                        UITextField *textField = (UITextField *)oneView;
                        return textField;
                    }
                }
            }
        }
    } else {
        for (UIView *oneView in viewLevel0.subviews) {
            if ([oneView isKindOfClass:[UITextField class]]) {
                UITextField *textField = (UITextField *)oneView;
                return textField;
            }
        }
    }
    return nil;
}

@end
