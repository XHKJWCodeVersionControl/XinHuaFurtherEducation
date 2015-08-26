//
//  XH_RegionSelectionVC.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/8/16.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "XH_RegionSelectionVC.h"
#import "XH_LoginVC.h"
@interface XH_RegionSelectionVC ()
@property(nonatomic,strong)NSArray * regionArray;
@property(nonatomic,strong)UIButton * regionButton;
@property(nonatomic,strong)NSArray * detailArray;
@property(nonatomic,strong)UIButton * detailBtn;
@end

@implementation XH_RegionSelectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.view.backgroundColor = UIColorFromRGB(0xeeeeee);
    [self setStatus];
    }
-(void)setStatus
{

    UIView * navBgViw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDETH, 64)];
    navBgViw.backgroundColor = UIColorFromRGB(0x36B256);
    [self.view addSubview:navBgViw];
    UILabel * titleLable = [[UILabel alloc] initWithFrame:CGRectMake((WIDETH -130)/2, 20, 130, 44)];
    titleLable.textColor = UIColorFromRGB(0xFFFFFF);
    titleLable.font = [UIFont systemFontOfSize:26];
    titleLable.text  = @"新华会计网";
    [navBgViw addSubview:titleLable];
/*收缩框**/
    [self search];
    [self regionView];
    /*分栏**/
    [self detailRegin];
}
-(void)detailRegin
{
    UIView * dedtail = [[UIView alloc] initWithFrame:CGRectMake(15, 108+84+24, WIDETH-30, 28)];
    dedtail.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:dedtail];
    UILabel * detailLable =[[UILabel alloc] initWithFrame:CGRectMake(15, 0,60, 28)];
    detailLable.text = @"广东";
    detailLable.font = [UIFont systemFontOfSize:12];
    detailLable.textColor = UIColorFromRGB(0x4A4A4A);
    [dedtail addSubview:detailLable];
    UIImageView * detailImageView = [[UIImageView alloc] initWithFrame:CGRectMake(dedtail.frame.size.width - 30, 13, 8, 13)];
    detailImageView.image =[UIImage imageNamed:@"35x35"];
    [dedtail addSubview:detailImageView];
    /*详细地址**/
    self.detailArray = @[@"省直属",@"东莞",@"珠海",@"深圳",@"惠州",@"茂名",@"化州",@"高州",@"信宜",@"云浮"];
    for (int i = 0; i < self.detailArray.count; i++) {
        self.detailBtn =[[UIButton alloc] initWithFrame:CGRectMake(15+i%4*(WIDETH-23)/4.0, 252+i/4*36, (WIDETH-30-24)/4.0, 28)];
//                self.detailBtn
//                .backgroundColor = [UIColor redColor];
        [self.view addSubview:self.detailBtn];
        [self.detailBtn setTitle:self.detailArray[i] forState:UIControlStateNormal];
        [self.detailBtn setTitleColor:UIColorFromRGB(0x797979) forState:UIControlStateNormal];
        self.detailBtn.backgroundColor =[UIColor whiteColor];
        self.detailBtn.titleLabel.font = [UIFont systemFontOfSize:11];
//        [self.detailBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
}
-(void)regionView
{
    self.regionArray = @[@"北京",@"天津",@"甘肃",@"青海",@"新疆",@"安徽",@"宁夏",@"淮安",@"福州",@"新疆建设兵团"];
    for (int i = 0; i < self.regionArray.count; i++) {
        self.regionButton =[[UIButton alloc] initWithFrame:CGRectMake(15+i%4*(WIDETH-23)/4.0, 108+i/4*36, (WIDETH-30-24)/4.0, 28)];
//        self.regionButton
//        .backgroundColor = [UIColor redColor];
        [self.view addSubview:self.regionButton];
        [self.regionButton setTitle:self.regionArray[i] forState:UIControlStateNormal];
        [self.regionButton setTitleColor:UIColorFromRGB(0x36B256) forState:UIControlStateNormal];
        self.regionButton.backgroundColor =[UIColor whiteColor];
        self.regionButton.titleLabel.font = [UIFont systemFontOfSize:11];
        [self.regionButton addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)btnClick
{
    XH_LoginVC * login = [[XH_LoginVC alloc] init];
    NSLog(@"111");
    login.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

    [self presentViewController:login animated:YES completion:nil];
}
-(void)search{
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(15, 72, WIDETH-30, 28)];
    [self.view addSubview:bgView];
    bgView.backgroundColor = [UIColor whiteColor];
    UIImageView * leftView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 7, 14, 14)];
    leftView.image = [UIImage imageNamed:@"28x28"];
    [bgView addSubview:leftView];
    
    UITextField * textFiled = [[UITextField alloc] initWithFrame:CGRectMake(34, 0, bgView.frame.size.width-34, 28)];
    textFiled.placeholder = @"请入城市名或拼音";
    textFiled.font = [UIFont systemFontOfSize:12];
    textFiled.textColor = UIColorFromRGB(0x797979);
    [bgView addSubview:textFiled];
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
