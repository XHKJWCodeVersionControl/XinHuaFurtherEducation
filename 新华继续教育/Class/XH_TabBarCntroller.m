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
#import "XH_MineVC.h"
#import "XH_BaseNavigation.h"
@interface XH_TabBarCntroller ()
{
    
    SelectTabBar * _SectTabView;
    
}
@end

@implementation XH_TabBarCntroller

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tabBar.tintColor = [UIColor blueColor];
//    
//   self.view.tintColor = [UIColor whiteColor];
    [self createVieController];
//    [self createTabBar];
//    self.tabBar.hidden = YES;
       }
- (void)addSubViewControl:(UIViewController *)subVC title:(NSString *)title image:(NSString *)image
{
    subVC.tabBarItem.title = title;
    subVC.tabBarItem.image = [UIImage imageNamed:image];
    //    subVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    XH_BaseNavigation *nav = [[XH_BaseNavigation alloc] initWithRootViewController:subVC];
    [self addChildViewController:nav];
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
    
    XH_MineVC * mine = [[XH_MineVC alloc] init];
//   XH_BaseNavigation * mineNav = [[XH_BaseNavigation alloc] initWithRootViewController:mine];
    NSArray * array = @[classNav,downNav,recordNav,mine];
    self.viewControllers = array;
    self.selectedIndex = 0;
    _SectTabView = [[SelectTabBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 49)];
    _SectTabView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
    _SectTabView.delegate = self;
    [self.tabBar addSubview:_SectTabView];
    NSLog(@"tabbar %@", self.tabBar);
    [self OnTabSelect:_SectTabView];
}
- (void)OnTabSelect:(SelectTabBar *)sender {
    int index = sender.miIndex;
    NSLog(@"OnTabSelect:%d", index);
    self.selectedIndex = index;
    [self.tabBar bringSubviewToFront:_SectTabView];
}
//-(void)createTabBar
//{
////    _tabBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, HEIGHT-49, WIDETH, 49)];
////        _tabBar.userInteractionEnabled = YES;
////        _tabBar.image = [UIImage imageNamed:@"3"];
////      _tabBar.backgroundColor =[UIColor redColor];
////    self.mainTabBar = _tabBar;
////   
////   [[UITabBar appearance] addSubview:_tabBar];
////    
////    
////    
////     NSArray * items = @[@"35x35-课程",@"35x35-下载",@"35x35-记录"];
////    NSArray * titleArray = @[@"课程",@"下载",@"记录"];
////
////    for (int index = 0; index < items.count; index++) {
////        UIButton * bgView = [[UIButton alloc] initWithFrame:CGRectMake(0+(WIDETH-6)/3.0*index+3*index, 9, (WIDETH-3)/3.0, 40)];
////        bgView.backgroundColor =UIColorFromRGB(0x36B256);
////        [_tabBar addSubview:bgView];
////        UIImageView * itemView =[[UIImageView alloc] initWithFrame:CGRectMake(bgView.frame.size.width/2.0-25, 10, 20, 20)];
////        itemView.image = [UIImage imageNamed:items[index]];
////        [bgView addSubview:itemView];
////        
//////        [itemView setImage:[UIImage imageNamed:selectItems[index]] forState:UIControlStateSelected];
////        //      itemView.backgroundColor =[UIColor redColor];
////        bgView.tag = index;
////        bgView.userInteractionEnabled =YES;
////
////        UILabel * itemLable =[[UILabel alloc] initWithFrame:CGRectMake(bgView.frame.size.width/2.0-3, 12, 35, 16)];
////                itemLable.backgroundColor = [UIColor clearColor];
////                itemLable.textColor = [UIColor redColor];
////                itemLable.text  = titleArray[index];
////                itemLable.font = [UIFont boldSystemFontOfSize:16];
////                itemLable.textAlignment = NSTextAlignmentCenter;
////                itemLable.textColor = [UIColor whiteColor];
////                [bgView addSubview:itemLable];
////
////        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
////        [bgView addGestureRecognizer:tap];
////           }
////    //选中的图片
////    _selectView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 9, WIDETH/3.0, 40)];
////    _selectView.backgroundColor =  UIColorFromRGB(0x66E221);
////    _selectView.alpha = 0.4;
////    [_tabBar addSubview:_selectView];
////
////    self.tabBar.backgroundColor =[UIColor redColor];
////    UIColorFromRGB(0x36B256);
//    
//    
//    self.tabBar.backgroundImage =[UIImage imageNamed:@"tabBar"];
////    self.tabBar.backgroundColor  =[UIColor blueColor];
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]} forState:UIControlStateSelected];
//    NSArray * titleArray = @[@"课程",@"下载",@"记录"];
//    NSArray * unSelectArray =@[@"kecheng",@"xiazai",@"jilu"];
//  
//   NSArray * selectArray = @[@"kecheng",@"xiazai",@"jilu"];
//    
//    NSArray * items = self.tabBar.items;
//    for(int i = 0;i < items.count;i++)
//    {
//        UITabBarItem * item = items[i];
//        item = [items[i] initWithTitle:titleArray[i] image:[UIImage imageNamed:unSelectArray[i]] selectedImage:[UIImage imageNamed:selectArray[i]]];
//     }
//
//}
//#pragma mark memery
//-(void)tap:(UITapGestureRecognizer*)gester
//{
//    UIView * view = [gester view];
//    
//    [UIView animateWithDuration:1 animations:NULL];
//    _selectView.frame = CGRectMake(0+(WIDETH-6)/3.0*view.tag+3*view.tag, 9, (WIDETH-3)/3.0, 40);
//    
//    self.selectedIndex = view.tag;
//}
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
