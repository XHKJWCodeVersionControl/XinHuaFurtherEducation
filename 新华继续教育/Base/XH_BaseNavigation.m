//
//  XH_BaseNavigation.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/8/22.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "XH_BaseNavigation.h"
#import "XH_TabBarCntroller.h"
@interface XH_BaseNavigation ()

@end

@implementation XH_BaseNavigation
+ (void)initialize
{
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    [navigationBar setTitleTextAttributes:
     
  @{NSFontAttributeName:[UIFont systemFontOfSize:18],
    NSForegroundColorAttributeName:[UIColor whiteColor]}];
    navigationBar.shadowImage = [[UIImage alloc] init];

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 滑动手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
}
- (void)swipeAction:(UISwipeGestureRecognizer *)gesture
{
    if (self.viewControllers.count > 0)
    {
        [self popViewControllerAnimated:YES];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0)
    {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itermWithTarget:self Action:@selector(pop) Image:@"返回-35x35" HighImage:@"返回-35x35"];
        
//        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    
    [super pushViewController:viewController animated:animated];
   
}
#pragma mark -返回
- (void)pop
{
    [self popViewControllerAnimated:YES];
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}




@end
