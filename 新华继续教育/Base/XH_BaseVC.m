//
//  XH_BaseVC.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/7/30.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "XH_BaseVC.h"
#import "XH_TabBarCntroller.h"
@interface XH_BaseVC ()

@end

@implementation XH_BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
   [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
   self.navigationController.navigationBar.translucent = NO;
//    XH_TabBarCntroller * main = [[XH_TabBarCntroller alloc] init];
//    [main.mainTabBar resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
