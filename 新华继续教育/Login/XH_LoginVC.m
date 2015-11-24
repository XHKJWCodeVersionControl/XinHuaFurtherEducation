//
//  XH_LoginVC.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/8/19.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "XH_LoginVC.h"
#import "XH_TabBarCntroller.h"
#import "LoginAndRegisterRequest.h"
#import "XH_ChooseYearVC.h"
@interface XH_LoginVC ()<UITextFieldDelegate>
{

}
@property(nonatomic,strong)UITextField * loginTextFiled;
@property(nonatomic,strong)UITextField * serectTextFiled;
@property(nonatomic,strong)NSArray * array;
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
    UIView * loginViw = [[UIView alloc] initWithFrame:CGRectMake(8, 77-64, WIDETH-16, 40)];
    loginViw.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:loginViw];
  
    UIImageView * loginImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
    loginImageView.image = [UIImage imageNamed:@"书本"];
    [loginViw addSubview:loginImageView];
    UITextField * loginTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(36, 0, loginViw.frame.size.width - 34, 40)];
//    loginTextFiled.placeholder = @"请输入身份证号码";
    
    loginTextFiled.textColor = UIColorFromRGB(0x797979);
    loginTextFiled.font = [UIFont systemFontOfSize:12];
    loginTextFiled.delegate = self;
    loginTextFiled.returnKeyType = UIReturnKeyNext;
    loginTextFiled.keyboardType  = UIKeyboardTypeNumberPad;
    self.loginTextFiled = loginTextFiled;
    self.loginTextFiled.text = @"111111111111111111";
    [loginViw addSubview:loginTextFiled];
    
    UIView * serectBgView = [[UIView alloc] initWithFrame:CGRectMake(8, 120-64, WIDETH-16, 40)];
   serectBgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:serectBgView];
    UIImageView * serectImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
    serectImageView.image = [UIImage imageNamed:@"我"];
    [serectBgView addSubview:serectImageView];
    UITextField * serectTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(36, 0, loginViw.frame.size.width - 34, 40)];
    serectTextFiled.placeholder = @"请输入真实姓名";
    serectTextFiled.textColor = UIColorFromRGB(0x797979);
    serectTextFiled.delegate = self;
    serectTextFiled.text = @"东莞测试";
    serectTextFiled.returnKeyType = UIReturnKeyGo;
    serectTextFiled.font = [UIFont systemFontOfSize:12];
    self.serectTextFiled = serectTextFiled;
    [serectBgView addSubview:serectTextFiled];

    /*登录**/
    UIButton * loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(8, 180-64, WIDETH-16, 40)];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.backgroundColor = UIColorFromRGB(0x36B256);
    [loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{

    if (textField == _loginTextFiled)
    {
        [_serectTextFiled becomeFirstResponder];
    }else if (textField == _serectTextFiled) {
        [self loginRequest];
    }
    return YES;
}

-(void)loginClick
{
    
    if ([_loginTextFiled.text length]==0) {
        [MBProgressHUD creatembHub:@"身份证号码不能为空"];
        return;
    }else if ([_serectTextFiled.text length]==0)
    {
        [MBProgressHUD creatembHub:@"真实姓名不能为空"];
        return;
    }else
    {
//        XH_ChooseYearVC  * choose = [[XH_ChooseYearVC alloc] init];
//        [self.navigationController pushViewController:choose animated:YES];
   [self loginRequest];
    }
    
    

}
-(void)loginRequest
{
    
    
    /*测试**/
    [[LoginAndRegisterRequest loginWithSucc:^(NSDictionary *DataDic) {
        
        
        
        
    }] addNotifaction:[MBProgressHUD mbHubShow]];
    
     int  loginType = 3;
     int areaCode = 21;
   
   [[LoginAndRegisterRequest loginWithSucc:^(NSDictionary *DataDic) {
    
       self.array = DataDic[@"Data"];
       [MBProgressHUD creatembHub:@"登录成功"];
       NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
       [user setObject:DataDic[@"Data"][0][@"S_ID"] forKey:@"userId"];
       [user setObject:DataDic[@"Data"][0][@"IsExamTest"] forKey:@"examLimit"];
       [user setObject:DataDic[@"Data"][0][@"IsLessonTest"] forKey:@"lessonLimit"];
       [user synchronize];
           XH_TabBarCntroller * class  = [[XH_TabBarCntroller alloc] init];
           class.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
 
     XH_ChooseYearVC  * choose = [[XH_ChooseYearVC alloc] init];
             [self.navigationController pushViewController:choose animated:YES];
       
   } withIdentityNumber:self.loginTextFiled.text withFullName:self.serectTextFiled.text withLogigType:loginType  withAreaCode:areaCode ] addNotifaction:[MBProgressHUD mbHubShow]];

    
}
-(void)setStatus
{
//    self.view.backgroundColor = [UIColor whiteColor];
//    UIView * navBgViw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDETH, 64)];
//    navBgViw.backgroundColor = UIColorFromRGB(0x36B256);
//    [self.view addSubview:navBgViw];
//    UILabel * titleLable = [[UILabel alloc] initWithFrame:CGRectMake((WIDETH -200)/2, 20, 200, 44)];
//    titleLable.textColor = UIColorFromRGB(0xFFFFFF);
//    titleLable.textAlignment = NSTextAlignmentCenter;
//    titleLable.font = [UIFont systemFontOfSize:16];
//    titleLable.text  = @"会计人员继续教育";
//    [navBgViw addSubview:titleLable];
    [baseClass baseNavcontroller:self titleStr:@"新华会计网"];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
