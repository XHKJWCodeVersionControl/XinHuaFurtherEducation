//
//  studyRecordTableViewCell.h
//  新华继续教育
//
//  Created by 李李贤军 on 15/9/19.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface studyRecordTableViewCell : UITableViewCell
+(instancetype)cellTableViewCell:(UITableView*)tableView;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *classTitleLable;
@property (weak, nonatomic) IBOutlet UILabel *studyRecordLable;

@end
