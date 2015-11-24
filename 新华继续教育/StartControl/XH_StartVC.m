//
//  XH_StartVC.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/8/16.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "XH_StartVC.h"
#import "XH_RegionSelectionVC.h"
#import "LoginAndRegisterRequest.h"
@interface XH_StartVC ()
@property(nonatomic,strong)UIButton * startBtn;
@end

@implementation XH_StartVC
-(void)viewWillAppear:(BOOL)animated
{
    
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    
    [navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    navigationBar.shadowImage = [[UIImage alloc] init];
    
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.view.tintColor = [UIColor whiteColor];
    self.view.backgroundColor = UIColorFromRGB(0x36B256);
    [self createView];
   }
-(void)createView
{
/*标题**/
    UILabel * tilteLable = [[UILabel alloc] initWithFrame:CGRectMake((WIDETH-180)/2, 120-64, 180, 36)];
    tilteLable.text= @"新华会计网";
    tilteLable.font = [UIFont systemFontOfSize:36];
    tilteLable.textColor = UIColorFromRGB(0xFFFFFF);
    [self.view addSubview:tilteLable];
    UILabel * detailLable  = [[UILabel alloc] initWithFrame:CGRectMake((WIDETH-120)/2, 170-64, 120, 12)];
    detailLable.text = @"会计人的网上专家课堂";
    detailLable.textColor= UIColorFromRGB(0xFFFFFF);
    detailLable.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:detailLable];
    /*开始按钮**/
    UIButton * stratBtn = [[UIButton alloc] initWithFrame:CGRectMake(WIDETH/4.0, (HEIGHT-35)/2.0-64, WIDETH/2.0, 35)];
    stratBtn.backgroundColor = UIColorFromRGB(0xFFFFFF);
    
    [stratBtn setTitle:@"开始学习" forState:UIControlStateNormal];
    [stratBtn setTitleColor:UIColorFromRGB(0x36B256) forState:UIControlStateNormal];
    stratBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    stratBtn.layer.cornerRadius = 3;
    stratBtn.layer.masksToBounds= YES;
    [stratBtn addTarget:self action:@selector(startBtbClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stratBtn];
}
#pragma mark-
#pragma mark - - 按钮事件
-(void)startBtbClick
{
    self.navigationController.navigationBarHidden  = NO;
    XH_RegionSelectionVC * selection =[[XH_RegionSelectionVC alloc] init];
//    selection.modalTransitionStyle = UIModalPresentationPageSheet;
//    [self presentViewController:selection animated:YES completion:nil];
    [self.navigationController pushViewController:selection animated:YES];
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
