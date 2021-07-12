//
//  UIButton+YLAlignment.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UIButton (YLAlignment)

/** 文字 图片 水平 间距设置*/
- (void)yl_titleImageHorizontalAlignmentWithSpace:(float)space;
/** 图片 文字 水平 间距设置*/
- (void)yl_imageTitleHorizontalAlignmentWithSpace:(float)space;
/** 文字 图片 垂直 间距设置*/
- (void)yl_titleImageVerticalAlignmentWithSpace:(float)space;
/** 图片 文字 垂直 间距设置*/
- (void)yl_imageTitleVerticalAlignmentWithSpace:(float)space;

@end
