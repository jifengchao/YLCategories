//
//  UIButton+YLBlock.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

typedef void (^YLTouchedButtonBlock)(NSInteger tag);

@interface UIButton (YLBlock)

- (void)yl_addActionHandler:(YLTouchedButtonBlock)touchHandler;

@end


