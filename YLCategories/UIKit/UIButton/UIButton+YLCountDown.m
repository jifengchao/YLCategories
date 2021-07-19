//
//  UIButton+YLCountDown.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UIButton+YLCountDown.h"

@implementation UIButton (YLCountDown)

- (void)yl_startTime:(NSInteger)timeout startUI:(void(^)(UIButton *button))startUI countingUI:(void(^)(UIButton *button, NSString *strTime))countingUI endUI:(void(^)(UIButton *button))endUI endBlock:(YLCountDownEndBlock)endBlock {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (startUI) startUI(self);
    });
    __block NSInteger timeOut = timeout; // 倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0), 1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if (timeOut <= 0) { //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.userInteractionEnabled = YES;
                if (endUI) endUI(self);
                if (endBlock) endBlock(YES);
            });
        } else {
//            int minutes = timeout / 60;
            int seconds = timeOut % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.userInteractionEnabled = NO;
                if (countingUI) countingUI(self, strTime);
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}

#pragma mark 示例

- (void)testExample {
//    UIButton *btn = [[UIButton alloc] init];
//    btn.frame = CGRectMake(20, 100, 150, 30);
//    [self.view addSubview:btn];
//    [btn setBackgroundColor:UIColor.redColor];
//    [btn setTitle:@"获取验证码" forState:(UIControlStateNormal)];
//    [btn setTitleColor:UIColor.whiteColor forState:(UIControlStateNormal)];
//    __weak typeof(btn) weak_btn = btn;
//    [btn yl_addActionHandler:^(NSInteger tag) {
//        // 倒计时
//        [weak_btn yl_startTime:10 startUI:^(UIButton *button) {
//            [weak_btn setBackgroundColor:UIColor.grayColor];
//        } countingUI:^(UIButton *button, NSString *strTime) {
//            [weak_btn setTitle:[NSString stringWithFormat:@"%@s", strTime] forState:(UIControlStateNormal)];
//        } endUI:^(UIButton *button) {
//            [weak_btn setBackgroundColor:UIColor.redColor];
//            [weak_btn setTitle:@"重新获取验证码" forState:(UIControlStateNormal)];
//        } endBlock:^(BOOL isEnd) {
//            NSLog(@"倒计时结束");
//        }];
//    }];
}

@end
