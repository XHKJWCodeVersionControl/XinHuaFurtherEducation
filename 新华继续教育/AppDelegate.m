//
//  AppDelegate.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/7/29.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "AppDelegate.h"
#import "XH_StartVC.h"
#import "IQTitleBarButtonItem.h"
#import "XH_BaseNavigation.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    XH_StartVC * start = [[XH_StartVC alloc] init];
   XH_BaseNavigation *nav = [[XH_BaseNavigation alloc] initWithRootViewController:start];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
     
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBarTintColor:UIColorFromRGB(0x36B256)];
    bar.translucent = NO;
    [bar setTintColor:[UIColor whiteColor]];
    [self keyBoard];
    /*加密token**/
    NSString *  tokenStr = @"?/danker#$%?%";
    NSString * myMd5_token = [MyMD5 md5:tokenStr];
    self.token = myMd5_token;
    
    
    return YES;
}
#pragma mark -- 键盘收回处理
-(void)keyBoard
{
    [[IQKeyboardManager sharedManager] setEnable:YES];
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];
    
    [[IQKeyboardManager sharedManager] setToolbarManageBehaviour:IQAutoToolbarBySubviews];
    [[IQKeyboardManager sharedManager] setShouldResignOnTouchOutside:YES];
    [[IQKeyboardManager sharedManager] setCanAdjustTextView:YES];
    [[IQKeyboardManager sharedManager] setShouldShowTextFieldPlaceholder:YES];
    
    IQTitleBarButtonItem * done =[[IQTitleBarButtonItem alloc] initWithFrame:CGRectMake(WIDETH-60, 0, 440, 40) Title:@"完成"];
    
}
+(AppDelegate*)instance
{
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(nullable UIWindow *)window
{
    if( self.ori_flag == 1){
        return UIInterfaceOrientationMaskAll;
    }
    else{
        return UIInterfaceOrientationMaskPortrait;
    }
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
