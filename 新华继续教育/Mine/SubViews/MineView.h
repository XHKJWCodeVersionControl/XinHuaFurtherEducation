//
//  MineView.h
//  新华继续教育
//
//  Created by 李李贤军 on 15/9/20.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineView : UIView
+(MineView*)setMineView;

@property (weak, nonatomic) IBOutlet UISwitch *switchButton;

@property (weak, nonatomic) IBOutlet UIButton *HeadPortrait;
- (void)setIconImage:(UIImage *)image;
@end
