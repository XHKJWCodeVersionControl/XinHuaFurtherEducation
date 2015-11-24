//
//  AppDelegate.h
//  新华继续教育
//
//  Created by 李李贤军 on 15/7/29.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,copy)NSString * token;
@property(nonatomic,assign)int ori_flag;
+(AppDelegate*)instance;
@end

