//
//  MineView.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/9/20.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "MineView.h"

@implementation MineView

+(MineView*)setMineView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"MineViewS" owner:self options:nil] lastObject];
}
- (void)setIconImage:(UIImage *)image
{
    [self.HeadPortrait setImage:image forState:UIControlStateNormal];
    
}

@end
