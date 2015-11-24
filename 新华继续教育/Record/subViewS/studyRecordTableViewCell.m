//
//  studyRecordTableViewCell.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/9/19.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "studyRecordTableViewCell.h"

@implementation studyRecordTableViewCell
+(instancetype)cellTableViewCell:(UITableView*)tableView
{
    static NSString *identifier = @"studyRecordTableViewCell";
    studyRecordTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell  =[[[NSBundle mainBundle] loadNibNamed:@"studyRecordTableViewCell" owner:self options:nil] lastObject];
    }
    return cell;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
