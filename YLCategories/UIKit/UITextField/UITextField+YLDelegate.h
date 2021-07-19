//
//  UITextField+YLDelegate.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@protocol YLTextFieldDelegate <UITextFieldDelegate>

@optional
- (void)textFieldDidDeleteBackward:(UITextField *)textField;

- (void)textFieldBecomeFirstResponder:(UITextField *)textField;

@end

@interface UITextField (YLDelegate)

@property (weak, nonatomic) id <YLTextFieldDelegate> delegate;

@end


