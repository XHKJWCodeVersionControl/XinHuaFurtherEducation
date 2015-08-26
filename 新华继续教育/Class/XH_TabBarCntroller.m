//
//  XH_TabBarCntroller.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/8/20.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "XH_TabBarCntroller.h"
#import "XH_DownLoadVC.h"
#import "XH_RecordVC.h"
#import "XH_ClassVC.h"
#import "XH_BaseNavigation.h"
@interface XH_TabBarCntroller ()

@end

@implementation XH_TabBarCntroller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createVieController];
    [self createTabBar];
    self.tabBar.hidden = YES;
    
   }
-(void)createVieController
{
    XH_ClassVC * class =[[XH_ClassVC alloc] init];
    XH_BaseNavigation * classNav = [[XH_BaseNavigation alloc] initWithRootViewController:class]
    ;
    XH_DownLoadVC * down = [[XH_DownLoadVC alloc] init];
    XH_BaseNavigation * downNav = [[XH_BaseNavigation alloc] initWithRootViewController:down];
    XH_RecordVC * record = [[XH_RecordVC alloc] init];
    XH_BaseNavigation * recordNav =[[XH_BaseNavigation alloc] initWithRootViewController:record];
    NSArray * viewsControllers = @[classNav ,downNav,recordNav];
    [self setViewControllers:viewsControllers
                    animated:YES];
}
-(void)createTabBar
{
    _tabBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, HEIGHT-49, WIDETH, 49)];
        _tabBar.userInteractionEnabled = YES;
        _tabBar.image = [UIImage imageNamed:@"3"];
        _tabBar.backgroundColor =[UIColor whiteColor];
    self.mainTabBar = _tabBar;
   
    [self.view addSubview:_tabBar];
    
    
    
     NSArray * items = @[@"35x35-课程",@"35x35-下载",@"35x35-记录"];
    NSArray * titleArray = @[@"课程",@"下载",@"记录"];
     int x = 0;
    for (int index = 0; index < items.count; index++) {
        UIButton * bgView = [[UIButton alloc] initWithFrame:CGRectMake(0+(WIDETH-6)/3.0*index+3*index, 9, (WIDETH-3)/3.0, 40)];
        bgView.backgroundColor =UIColorFromRGB(0x36B256);
        [_tabBar addSubview:bgView];
        UIImageView * itemView =[[UIImageView alloc] initWithFrame:CGRectMake(bgView.frame.size.width/2.0-25, 10, 20, 20)];
        itemView.image = [UIImage imageNamed:items[index]];
        [bgView addSubview:itemView];
        
//        [itemView setImage:[UIImage imageNamed:selectItems[index]] forState:UIControlStateSelected];
        //      itemView.backgroundColor =[UIColor redColor];
        bgView.tag = index;
        bgView.userInteractionEnabled =YES;

        UILabel * itemLable =[[UILabel alloc] initWithFrame:CGRectMake(bgView.frame.size.width/2.0-3, 12, 35, 16)];
                itemLable.backgroundColor = [UIColor clearColor];
                itemLable.textColor = [UIColor redColor];
                itemLable.text  = titleArray[index];
                itemLable.font = [UIFont boldSystemFontOfSize:16];
                itemLable.textAlignment = NSTextAlignmentCenter;
                itemLable.textColor = [UIColor whiteColor];
                [bgView addSubview:itemLable];

        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [bgView addGestureRecognizer:tap];
           }
    //选中的图片
    _selectView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 9, WIDETH/3.0, 40)];
    _selectView.backgroundColor =  UIColorFromRGB(0x66E221);
    _selectView.alpha = 0.4;
    [_tabBar addSubview:_selectView];

}
#pragma mark memery
-(void)tap:(UITapGestureRecognizer*)gester
{
    UIView * view = [gester view];
    
    [UIView animateWithDuration:1 animations:NULL];
    _selectView.frame = CGRectMake(0+(WIDETH-6)/3.0*view.tag+3*view.tag, 9, (WIDETH-3)/3.0, 40);
    
    self.selectedIndex = view.tag;
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
