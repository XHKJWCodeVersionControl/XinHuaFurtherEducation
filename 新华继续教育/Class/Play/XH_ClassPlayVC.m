//
//  XH_ClassPlayVC.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/8/22.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "XH_ClassPlayVC.h"
#import "XH_TabBarCntroller.h"
@interface XH_ClassPlayVC ()

@end

@implementation XH_ClassPlayVC
-(void)viewWillAppear:(BOOL)animated
{
    XH_TabBarCntroller * tab = [[XH_TabBarCntroller alloc] init];
    [tab.mainTabBar removeFromSuperview];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel * lable =[[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 40)];
    lable.text = self.str;
    [self.view addSubview:lable];
    // Do any additional setup after loading the view.
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
