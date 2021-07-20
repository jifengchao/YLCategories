//
//  YLViewController.m
//  YLCategories
//
//  Created by jifengchao on 07/12/2021.
//  Copyright (c) 2021 jifengchao. All rights reserved.
//

#import "YLViewController.h"

#import <NSURL+YLParams.h>
#import <UIButton+YLMake.h>
#import <UIView+YLFrame.h>
#import <CLLocation+YLConvert.h>

@interface YLViewController ()

@end

@implementation YLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self test1];
    
    NSLog(@"%lf", self.view.yl_h);
}

- (void)test1 {
    UIButton *btn = [UIButton yl_buttonWithBlock:^{
        NSLog(@"点击了");
    }];
    btn.frame = CGRectMake(10, 100, 100, 100);
    [self.view addSubview:btn];
    btn.backgroundColor = UIColor.redColor;
}

- (void)test {
    [self printURLWith:@"http://www.baidu.com?name=dai&"];
    [self printURLWith:@"http://www.baidu.com?name=dai"];
    [self printURLWith:@"http://wwww.baidu.com?name=dai"];
    [self printURLWith:@"http://wwww.baidu.com?name=dai&weight=178"];
    
    [self printURLWith:@"xiaoma://wwww.baidu.com?name=dai"];
    
}

- (void)printURLWith:(NSString *)string {
    NSLog(@"----------------------------");
    
    NSURL *url = [NSURL URLWithString:string];
    
    NSLog(@"params = %@", [url yl_getParams]);
    NSLog(@"path = %@", [url yl_getPath]);
    NSLog(@"name = %@", [url yl_valueForParameter:@"name"]);
    NSLog(@"weight = %@", [url yl_valueForParameter:@"weight"]);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
