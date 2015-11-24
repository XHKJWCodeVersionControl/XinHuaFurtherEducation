//
//  RegionHeadView.h
//  新华继续教育
//
//  Created by 李李贤军 on 15/9/20.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THGroupModel.h"
@class RegionHeadView;
@protocol regionHeadViewDelegate <NSObject>

-(void)regionHeadView :(RegionHeadView*)View;

@end
@interface RegionHeadView : UITableViewHeaderFooterView
@property(nonatomic,assign)id <regionHeadViewDelegate>delegate;
@property(nonatomic,strong)UIButton * arroewBtn;
+(instancetype)regionheadView:(UITableView*)tableView;
@property(nonatomic,assign)BOOL isOpen;
@property(nonatomic,strong)THGroupModel * groupModel;

@end
