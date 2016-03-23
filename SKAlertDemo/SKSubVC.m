//
//  SKSubVC.m
//  SKAlertDemo
//
//  Created by youngxiansen on 16/3/23.
//  Copyright © 2016年 youngxiansen. All rights reserved.
//

#import "SKSubVC.h"

@interface SKSubVC ()

@end

@implementation SKSubVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"subVC";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.center = self.view.center;
    btn.bounds = CGRectMake(0, 0, 200, 44);
    [btn setTitle:@"点我" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn addTarget:self action:@selector(clickEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

-(void)clickEvent
{
    //    [self showAlertVCContent:@"确定测试" enSureBlock:^{
    //        NSLog(@"点击了确定");
    //    }];
    
    
    
    [self showAlertVCContent:@"确定和取消测试" cancleBlock:^{
        NSLog(@"点击了取消");
    } enSureBlock:^{
        NSLog(@"点击了确定");
    }];
}

@end
