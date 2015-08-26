//
//  XH_ClassVC.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/8/20.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "XH_ClassVC.h"
#import "descriptionView.h"
#import "XH_ClassPlayVC.h"
@interface XH_ClassVC ()

@end

@implementation XH_ClassVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"2014年课程";
    [self createView];
}
-(void)createView
{
    descriptionView * description = [descriptionView descriptionView];
    description.frame = CGRectMake(0, 10, WIDETH, 80);
    [self.view addSubview:description];
    
    UIButton * b = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    b.backgroundColor =[UIColor redColor];
    [b addTarget:self action:@selector(bb) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
}
-(void)bb
{
//    XH_ClassPlayVC * c = [[XH_ClassPlayVC alloc] init];
    [self.navigationController pushViewController:[[XH_ClassPlayVC alloc]init] animated:YES];
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
