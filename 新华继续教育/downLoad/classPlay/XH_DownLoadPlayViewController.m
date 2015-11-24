//
//  XH_DownLoadPlayViewController.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/10/6.
//  Copyright © 2015年 XH. All rights reserved.
//

#import "XH_DownLoadPlayViewController.h"
#import "AppDelegate.h"
@interface XH_DownLoadPlayViewController ()

@end

@implementation XH_DownLoadPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    }
//横屏播放需要实现2个方式即可
-(BOOL)shouldAutorotate
{
    return YES;
}
//强制横屏
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    
    return UIInterfaceOrientationMaskLandscapeRight;
    
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
