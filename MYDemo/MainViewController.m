//
//  MainViewController.m
//  MYDemo
//
//  Created by zxf on 15-6-2.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    btn.frame = CGRectMake(30, 60, 60, 30);
    [btn setTitle:@"返回" forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(comeBack) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    
}



-(void)comeBack

{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
