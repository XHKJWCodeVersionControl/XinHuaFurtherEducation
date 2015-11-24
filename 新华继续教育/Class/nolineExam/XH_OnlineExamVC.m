//
//  XH_OnlineExamVC.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/9/19.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "XH_OnlineExamVC.h"
#import "BaseInformation.h"
#import "ExamDescriptionView.h"
#import "XH_StartExam.h"
@interface XH_OnlineExamVC ()

@end

@implementation XH_OnlineExamVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self BasicInfoView];
}
-(void)BasicInfoView
{
    BaseInformation * baseView = [BaseInformation setBaseInformation];
    [self.view addSubview:baseView];
    
    ExamDescriptionView * examDetail =[ExamDescriptionView setExamDescriptionView];
    examDetail.frame = CGRectMake(0, 50, WIDETH, 200);
    [self.view addSubview:examDetail];
    
    /*开始考试**/
    UIButton * startButtn =[[UIButton alloc] initWithFrame:CGRectMake((WIDETH-200)/2.0, 350, 200, 30)];
    startButtn.backgroundColor =UIColorFromRGB(0x36B256);
    [startButtn setTitle:@"开始考试" forState:UIControlStateNormal];
    startButtn.titleLabel.font =[UIFont systemFontOfSize:15];
    [startButtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    startButtn.layer.cornerRadius = 2;
    startButtn.layer.masksToBounds = YES;
    [startButtn addTarget:self action:@selector(startButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButtn];
}
-(void)startButtonClick
{

    XH_StartExam * start = [[XH_StartExam alloc] init];
    [self.navigationController pushViewController:start animated:YES];
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
