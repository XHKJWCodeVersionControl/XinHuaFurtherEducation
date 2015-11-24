//
//  downCell.h
//  down
//
//  Created by lixianjun on 15/10/6.
//  Copyright (c) 2015年 lixianjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface downCell : UITableViewCell
@property (copy, nonatomic) NSString *url;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (weak, nonatomic) IBOutlet UIButton *openButton;
@property (weak, nonatomic) IBOutlet UIButton *downloadButton;
@property (weak, nonatomic) IBOutlet UILabel *lable;

-(void)config;
@end
