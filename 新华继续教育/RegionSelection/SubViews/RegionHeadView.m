//
//  RegionHeadView.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/9/20.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "RegionHeadView.h"

@implementation RegionHeadView
+(instancetype)regionheadView:(UITableView*)tableView
{

    static NSString * identifier = @"head";
//    RegionHeadView * header = (RegionHeadView*)[tableView dequeueReusableCellWithIdentifier:identifier];
    RegionHeadView * header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!header) {
        header =[[RegionHeadView alloc] initWithReuseIdentifier:identifier];
    }
    return header;
}


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        //        [button setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        //        [button setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"向下"] forState:UIControlStateNormal];
//        [button setImage:[UIImage imageNamed:@"-"] forState:UIControlStateSelected];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //        button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.imageEdgeInsets = UIEdgeInsetsMake(0,[UIScreen mainScreen].bounds.size.width-40, 0, 0);
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        button.imageView.contentMode = UIViewContentModeCenter;
        [button addTarget:self action:@selector(buttonCilck:) forControlEvents:UIControlEventTouchUpInside];
        self.arroewBtn = button;
        [self addSubview:button];
        //        //创建albe 显示当前在线人数
        //        UILabel * LalbeRight = [[UILabel alloc]init];
        //        LalbeRight.textAlignment = NSTextAlignmentCenter;
        //        _label = LalbeRight;
        //        [self addSubview:_label];
    }
    return self;
}
-(void)buttonCilck:(UIButton*)sender
{
    
    self.groupModel.isOpen = !self.groupModel.isOpen;
    if ([self.delegate respondsToSelector:@selector(regionHeadView:)]) {
        [self.delegate regionHeadView:self];
    }
    
}
-(void)didMoveToSuperview
{
    _arroewBtn.imageView.transform = self.groupModel.isOpen ? CGAffineTransformMakeRotation(M_PI) :CGAffineTransformMakeRotation(0);
    
}
-(void)layoutSubviews
{
    
    [super layoutSubviews];
    _arroewBtn.frame = CGRectMake(0, 0, self.width, 49);
    _arroewBtn.backgroundColor =[UIColor whiteColor];
    
//     _arroewBtn.backgroundColor = UIColorFromRGB(0x464646);
    //    _label.frame = CGRectMake(self.frame.size.width - 70, 0, 60, self.frame.size.height);
}
-(void)setGroupModel:(THGroupModel *)groupModel
{
    _groupModel = groupModel;
    [_arroewBtn setTitle:@"广东" forState:UIControlStateNormal];
   
}
@end
