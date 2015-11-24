//
//  XH_TabBarCntroller.h
//  新华继续教育
//
//  Created by 李李贤军 on 15/8/20.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectTabBar.h"
@interface XH_TabBarCntroller : UITabBarController<SelectTabBarDelegate>
{
@private
    UIImageView * _tabBar;
    UIImageView * _selectView;
    
}
@property(nonatomic,strong)UIImageView * mainTabBar;
@end
