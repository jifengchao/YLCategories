//
//  UIView+YLFrame.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UIView+YLFrame.h"

@implementation UIView (YLFrame)

- (void)setYl_x:(CGFloat)yl_x {
    CGRect frame = self.frame;
    frame.origin.x = yl_x;
    self.frame = frame;
}

- (CGFloat)yl_x {
    return self.frame.origin.x;
}

- (void)setYl_y:(CGFloat)yl_y {
    CGRect frame = self.frame;
    frame.origin.y = yl_y;
    self.frame = frame;
}

- (CGFloat)yl_y {
    return self.frame.origin.y;
}

- (void)setYl_w:(CGFloat)yl_w {
    CGRect frame = self.frame;
    frame.size.width = yl_w;
    self.frame = frame;
}

- (CGFloat)yl_w {
    return self.frame.size.width;
}

- (void)setYl_h:(CGFloat)yl_h {
    CGRect frame = self.frame;
    frame.size.height = yl_h;
    self.frame = frame;
}

- (CGFloat)yl_h {
    return self.frame.size.height;
}

- (CGFloat)yl_centerX {
    return self.center.x;
}

- (void)setYl_centerX:(CGFloat)yl_centerX {
    CGPoint center = self.center;
    center.x = yl_centerX;
    self.center = center;
}

- (CGFloat)yl_centerY {
    return self.center.y;
}

- (void)setYl_centerY:(CGFloat)yl_centerY {
    CGPoint center = self.center;
    center.y = yl_centerY;
    self.center = center;
}

- (void)setYl_size:(CGSize)yl_size {
    CGRect frame = self.frame;
    frame.size = yl_size;
    self.frame = frame;
}

- (CGSize)yl_size {
    return self.frame.size;
}

- (void)setYl_origin:(CGPoint)yl_origin {
    CGRect frame = self.frame;
    frame.origin = yl_origin;
    self.frame = frame;
}

- (CGPoint)yl_origin {
    return self.frame.origin;
}

- (void)setYl_right:(CGFloat)yl_right {
    CGRect frame = self.frame;
    frame.origin.x = yl_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)yl_right {
    CGRect frame = self.frame;
    return (frame.origin.x + frame.size.width);
}

- (void)setYl_bottom:(CGFloat)yl_bottom {
    CGRect frame = self.frame;
    frame.origin.y = yl_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)yl_bottom {
    CGRect frame = self.frame;
    return (frame.origin.y + frame.size.height);
}

@end
