//
//  ViewController.m
//  事件统计
//
//  Created by luomh on 2018/8/30.
//  Copyright © 2018年 luomh. All rights reserved.
//

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "EventStatisticsTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"事件统计";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self setupView];
}

- (void)setupView
{
    [self createButtonWithTitle:@"内购成功" tag:1];
}

#pragma mark - Actions
- (void)clickButton:(UIButton *)btn
{
    [EventStatisticsTool Event_logPurchaseSuccess];
}

#pragma mark - Tools
- (void)createButtonWithTitle:(NSString *)title tag:(NSInteger)tag
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = tag;
    btn.layer.cornerRadius = 5;
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.frame = CGRectMake(40, 100 + 60 * (tag - 1), SCREENWIDTH - 80, 50);
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
