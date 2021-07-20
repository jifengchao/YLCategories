//
//  UIView+YLFrame.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UIView (YLFrame)

@property (assign, nonatomic) CGFloat yl_x;
@property (assign, nonatomic) CGFloat yl_y;
@property (assign, nonatomic) CGFloat yl_w;
@property (assign, nonatomic) CGFloat yl_h;
@property (assign, nonatomic) CGFloat yl_centerX;
@property (assign, nonatomic) CGFloat yl_centerY;
@property (assign, nonatomic) CGSize  yl_size;
@property (assign, nonatomic) CGPoint yl_origin;
@property (assign, nonatomic) CGFloat yl_right;
@property (assign, nonatomic) CGFloat yl_bottom;

@end


