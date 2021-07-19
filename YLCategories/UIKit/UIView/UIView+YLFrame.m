//
//  UIView+YLFrame.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UIView+YLFrame.h"

@implementation UIView (YLFrame)

- (void)setHyl_x:(CGFloat)hyl_x {
    CGRect frame = self.frame;
    frame.origin.x = hyl_x;
    self.frame = frame;
}

- (CGFloat)hyl_x {
    return self.frame.origin.x;
}

- (void)setHyl_y:(CGFloat)hyl_y {
    CGRect frame = self.frame;
    frame.origin.y = hyl_y;
    self.frame = frame;
}

- (CGFloat)hyl_y {
    return self.frame.origin.y;
}

- (void)setHyl_w:(CGFloat)hyl_w {
    CGRect frame = self.frame;
    frame.size.width = hyl_w;
    self.frame = frame;
}

- (CGFloat)hyl_w {
    return self.frame.size.width;
}

- (void)setHyl_h:(CGFloat)hyl_h {
    CGRect frame = self.frame;
    frame.size.height = hyl_h;
    self.frame = frame;
}

- (CGFloat)hyl_h {
    return self.frame.size.height;
}

- (CGFloat)hyl_centerX {
    return self.center.x;
}

- (void)setHyl_centerX:(CGFloat)hyl_centerX {
    CGPoint center = self.center;
    center.x = hyl_centerX;
    self.center = center;
}

- (CGFloat)hyl_centerY {
    return self.center.y;
}

- (void)setHyl_centerY:(CGFloat)hyl_centerY {
    CGPoint center = self.center;
    center.y = hyl_centerY;
    self.center = center;
}

- (void)setHyl_size:(CGSize)hyl_size {
    CGRect frame = self.frame;
    frame.size = hyl_size;
    self.frame = frame;
}

- (CGSize)hyl_size {
    return self.frame.size;
}

- (void)setHyl_origin:(CGPoint)hyl_origin {
    CGRect frame = self.frame;
    frame.origin = hyl_origin;
    self.frame = frame;
}

- (CGPoint)hyl_origin {
    return self.frame.origin;
}

- (void)setHyl_right:(CGFloat)hyl_right {
    CGRect frame = self.frame;
    frame.origin.x = hyl_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)hyl_right {
    CGRect frame = self.frame;
    return (frame.origin.x + frame.size.width);
}

- (void)setHyl_bottom:(CGFloat)hyl_bottom {
    CGRect frame = self.frame;
    frame.origin.y = hyl_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)hyl_bottom {
    CGRect frame = self.frame;
    return (frame.origin.y + frame.size.height);
}

@end
