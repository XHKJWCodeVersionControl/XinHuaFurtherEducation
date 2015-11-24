//
//  XH_ChooseYearVC.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/9/19.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "XH_ChooseYearVC.h"
#import "XH_TabBarCntroller.h"
#import "LoginAndRegisterRequest.h"
@interface XH_ChooseYearVC ()
@property(nonatomic,strong)NSArray * detailYearArray;
@property(nonatomic,strong)UIButton * yearBtn;
@property(nonatomic,strong)NSArray * dataArray;
@end

@implementation XH_ChooseYearVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [NSArray array];
    [baseClass baseNavcontroller:self titleStr:@"年份选择"];
    [self loadData];
    }
-(void)loadData
{
  
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    NSString * strUnionID = [NSString stringWithFormat:@"%d",21];
 [[XH_AFRequestState CourseSelectionWithSucc:^(NSDictionary *DataDic) {
     
     
     self.dataArray = DataDic[@"Data"][@"CourseYear"];
     [self createView];
     
     
 } withUser_Id:[user objectForKey:@"userId"]withUnionID:strUnionID] addNotifaction:[MBProgressHUD mbHubShow]];
}
-(void)createView
{
    /*年份**/
//    self.detailYearArray = @[@"2014年课程",@"2013年课程",@"2012年课程",@"2011年课程",@"2010年课程",@"2009年课程",@"2008年课程",@"2007年课程",@"2006年课程",@"2005年课程",@"2003年课程",@"2002年课程"];
    
    for (int i = 0; i < self.dataArray.count; i++) {
       UIButton* yearBtn =[[UIButton alloc] initWithFrame:CGRectMake(15+(i%3*(WIDETH-50)/3.0)+10*(i%3), 15+i/3*40, (WIDETH-50)/3.0, 30)];
        [yearBtn setTitle:self.dataArray[i][@"YearName"] forState:UIControlStateNormal];
        [yearBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        yearBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        yearBtn.backgroundColor = UIColorFromRGB(0x36B256);
        yearBtn.tag = 10+i;
        self.yearBtn = yearBtn;
        [self.view addSubview:yearBtn];
        [self.yearBtn addTarget:self action:@selector(yearBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    


}
-(void)yearBtnClick:(UIButton*)sender
{
//    self.navigationController.navigationBarHidden = YES;

               XH_TabBarCntroller * class  = [[XH_TabBarCntroller alloc] init];
               class.modalTransitionStyle = UIModalPresentationPageSheet;
    
               [self presentViewController:class
                                  animated:YES completion:nil];
//    [self.navigationController pushViewController:class animated:YES];

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
