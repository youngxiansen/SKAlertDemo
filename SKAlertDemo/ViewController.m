//
//  ViewController.m
//  alertToolDemo
//
//  Created by youngxiansen on 16/3/23.
//  Copyright © 2016年 youngxiansen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate>

@property (copy, nonatomic) void(^cancleBlock)();
@property (copy, nonatomic) void(^enSureBlock)();
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}


/** 只有确定点击事件 */
-(void)showAlertVCContent:(NSString*)content enSureBlock:(void (^)())enSureBlock
{
    //    此处是因为下面的alertView只有一个点击事件,所以用取消的block代替确定事件
    self.cancleBlock = enSureBlock;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0)
    {
        //        MJLog(@"8.0以上");
        UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:content preferredStyle:UIAlertControllerStyleAlert];
        [alertVC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if (self.cancleBlock) {
                self.cancleBlock();
            }
            
        }]];
        
        [self presentViewController:alertVC animated:YES completion:nil];
    }
    else{
        //        MJLog(@"8.0以下");
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:content delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
    }
}

/** 有确定和取消点击事件 */
-(void)showAlertVCContent:(NSString*)content cancleBlock:(void (^)())cancleBlock enSureBlock:(void (^)())enSureBlock
{
    self.cancleBlock = cancleBlock;
    self.enSureBlock = enSureBlock;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0)
    {
        //        MJLog(@"8.0以上");
        UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:content preferredStyle:UIAlertControllerStyleAlert];
        [alertVC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if (self.enSureBlock) {
                self.enSureBlock();
            }
            
        }]];
        
        [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (self.cancleBlock) {
                self.cancleBlock();
            }
        }]];
        
        [self presentViewController:alertVC animated:YES completion:nil];
    }
    else{
        //        MJLog(@"8.0以下");
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:content delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:
            if (self.cancleBlock)
            {
                
                self.cancleBlock();
            }
            
            break;
        case 1:
            if (self.enSureBlock)
            {
                self.enSureBlock();
            }
        default:
            break;
    }
}

@end
