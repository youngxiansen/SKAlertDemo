//
//  ViewController.h
//  alertToolDemo
//
//  Created by youngxiansen on 16/3/23.
//  Copyright © 2016年 youngxiansen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

/** 只有确定点击事件 */
-(void)showAlertVCContent:(NSString*)content enSureBlock:(void (^)())enSureBlock;

/** 有确定和取消点击事件 */
-(void)showAlertVCContent:(NSString*)content cancleBlock:(void (^)())cancleBlock enSureBlock:(void (^)())enSureBlock;

@end

