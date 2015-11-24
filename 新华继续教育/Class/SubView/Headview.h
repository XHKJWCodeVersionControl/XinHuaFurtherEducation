//
//  Headview.h
//  QQList
//
//  Created by 李李贤军 on 15/7/13.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THGroupModel.h"
@class Headview;
@protocol HeaderVeiwDelegate<NSObject>

-(void)clickViews:(Headview*)headView;

@end
@interface Headview : UITableViewHeaderFooterView
@property(nonatomic,assign)id <HeaderVeiwDelegate>delegate;
@property(nonatomic,strong)THGroupModel * groupModel;
@property(nonatomic,assign)BOOL isOpen;
@property(nonatomic,strong)UIButton * arroewBtn;
+(instancetype)headerView:(UITableView*)tableView;
@end
