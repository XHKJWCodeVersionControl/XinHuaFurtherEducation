//
//  baseClass.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/9/19.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "baseClass.h"

@implementation baseClass
+(void)baseNavcontroller:(UIViewController*)viewController titleStr:(NSString * )str
{

    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 44)];
    titleLabel.text = str;
    titleLabel.textColor =[UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:15];
    viewController.navigationItem.titleView = titleLabel;
}
@end
