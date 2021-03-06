//
//  SelectTabBar.m
//  TestRedCollar
//
//  Created by iHope on 14-1-23.
//  Copyright (c) 2014年 iHope. All rights reserved.
//

#import "SelectTabBar.h"

static SelectTabBar *gTabBar = nil;

@implementation SelectTabBar

@synthesize miIndex, delegate, OnForumTabSelect;

+ (SelectTabBar *)Share {
    return gTabBar;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        gTabBar = self;
        self.userInteractionEnabled = YES;
//     self.backgroundColor = [UIColor colorWithWhite:0.98 alpha:0];
        
        self.backgroundColor = UIColorFromRGB(0x36B256);
        NSArray * array = @[@"35x35-课程",@"35x35-下载",@"35x35-记录",@"身份"];
        NSArray * titleArray = @[@"课程",@"下载",@"记录",@"我的"];
        int width = self.frame.size.width/array.count;
        int x = 0;
        //选中的图片
             for (int i = 0; i<array.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(x, (self.frame.size.height-44)/2, width, 44);
            button.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
            button.backgroundColor = self.backgroundColor;
            
//            [button setImage:[UIImage imageNamed:[array objectAtIndex:i]] forState:UIControlStateNormal];
                 //            [button setImage:[UIImage imageNamed:[array1 objectAtIndex:i]]  forState:UIControlStateSelected];
//                 self.showAllBtn.imageEdgeInsets = UIEdgeInsetsMake(0,0,0,-115);
//                 self.showAllBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -33, 0, 0);
                /*添加图片**/
                 UIImageView *  imageView =[[UIImageView alloc] initWithFrame:CGRectMake((button.width-20)/2.0, 3, 20, 20)];
                 imageView.image = [UIImage imageNamed:[array objectAtIndex:i]];
                 [button addSubview:imageView];
         /*添加文字**/
                 [button setTitle:[titleArray objectAtIndex:i ] forState:UIControlStateNormal];
                 button.titleLabel.font =[UIFont systemFontOfSize:13];
                 button.titleEdgeInsets = UIEdgeInsetsMake(27, 0, 0, 0);
            [button addTarget:self action:@selector(OnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = i+1500;
            [self addSubview:button];
            x += width;
        }
        
        UIImageView *lineView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 1)];
        lineView.image = [UIImage imageNamed:@"f_tableline"];
//        [self addSubview:lineView];
        _selectView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDETH/4.0, 49)];
        _selectView.backgroundColor = UIColorFromRGB(0x066e21);
        _selectView.alpha = 0.5;
        [self addSubview:_selectView];
        [self RefreshView];
    }
    return self;
}

- (void)OnBtnClick:(UIButton *)sender {
    
   [UIView animateWithDuration:.2 animations:^{
       
   
    float index = sender.tag-1500;
        if (delegate && [delegate respondsToSelector:@selector(CanSelectTab::)]) {
        if (![delegate CanSelectTab:self :index]) {
            return;
        }
    }
    
    self.miIndex = index;
 
    if (delegate && [delegate respondsToSelector:@selector(OnTabSelect:)]) {
        [delegate OnTabSelect:self];
        _selectView.frame = CGRectMake(0+WIDETH/4.0*index, 0, WIDETH/4.0, 49);
    }
   }];
}

- (void)RefreshView {
    for (int i = 0; i < 5; i ++) {
        UIButton *button = (UIButton *)[self viewWithTag:i+1500];
        if (button) {
            button.selected = (i == miIndex);
        }
    }
}

- (void)setMiIndex:(int)index {
    miIndex = index;
    [self RefreshView];
}

@end
