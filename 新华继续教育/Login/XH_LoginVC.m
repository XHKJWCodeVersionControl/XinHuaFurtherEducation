//
//  XH_LoginVC.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/8/19.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "XH_LoginVC.h"
#import "XH_TabBarCntroller.h"
@interface XH_LoginVC ()

@end

@implementation XH_LoginVC
-(void)viewWillAppear:(BOOL)animated
{
    self.view.backgroundColor = UIColorFromRGB(0xEEEEEE);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.view.backgroundColor = UIColorFromRGB(0xEEEEEE);
   
    [self setStatus];
    [self loginBtn];
    // Do any additional setup after loading the view.
}
-(void)loginBtn
{
    UIView * loginViw = [[UIView alloc] initWithFrame:CGRectMake(8, 77, WIDETH-16, 40)];
    loginViw.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:loginViw];
    
    UIImageView * loginImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 14, 14)];
    loginImageView.image = [UIImage imageNamed:@"28x28 (2)"];
    [loginViw addSubview:loginImageView];
    UITextField * loginTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(34, 0, loginViw.frame.size.width - 34, 40)];
    loginTextFiled.placeholder = @"请输入身份证号码";
    loginTextFiled.textColor = UIColorFromRGB(0x797979);
    loginTextFiled.font = [UIFont systemFontOfSize:12];
    [loginViw addSubview:loginTextFiled];
    
    UIView * serectBgView = [[UIView alloc] initWithFrame:CGRectMake(8, 120, WIDETH-16, 40)];
   serectBgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:serectBgView];
    UIImageView * serectImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 14, 14)];
    serectImageView.image = [UIImage imageNamed:@"28x28-1"];
    [serectBgView addSubview:serectImageView];
    UITextField * serectTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(34, 0, loginViw.frame.size.width - 34, 40)];
    serectTextFiled.placeholder = @"请输入真实姓名";
    serectTextFiled.textColor = UIColorFromRGB(0x797979);
    serectTextFiled.font = [UIFont systemFontOfSize:12];
    [serectBgView addSubview:serectTextFiled];
    /*登录**/
    UIButton * loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(8, 180, WIDETH-16, 30)];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.backgroundColor = UIColorFromRGB(0x36B256);
    [loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];
}
-(void)loginClick
{
    XH_TabBarCntroller * class  = [[XH_TabBarCntroller alloc] init];
    class.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

    [self presentViewController:class
                       animated:YES completion:nil];
}
-(void)setStatus
{
    self.view.backgroundColor = [UIColor whiteColor];
    UIView * navBgViw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDETH, 64)];
    navBgViw.backgroundColor = UIColorFromRGB(0x36B256);
    [self.view addSubview:navBgViw];
    UILabel * titleLable = [[UILabel alloc] initWithFrame:CGRectMake((WIDETH -200)/2, 20, 200, 44)];
    titleLable.textColor = UIColorFromRGB(0xFFFFFF);
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.font = [UIFont systemFontOfSize:16];
    titleLable.text  = @"会计人员继续教育";
    [navBgViw addSubview:titleLable];
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
