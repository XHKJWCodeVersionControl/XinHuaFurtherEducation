//
//  XH_RecordVC.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/8/20.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "XH_RecordVC.h"
#import "studyRecordTableViewCell.h"
@interface XH_RecordVC ()<UITableViewDelegate,UITableViewDataSource>
{}

@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * dataArray;
@end

@implementation XH_RecordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [baseClass baseNavcontroller:self titleStr:@"学习记录"];
    [self createTableView ];

}
-(void)createTableView
{
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDETH, HEIGHT)];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.tableFooterView = [[UIView alloc] init];
    tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    self.tableView = tableView;
    [self.view addSubview:tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    studyRecordTableViewCell * cell = [studyRecordTableViewCell cellTableViewCell:tableView];
        NSMutableAttributedString *markLabelStr = [[NSMutableAttributedString alloc] initWithString:cell.studyRecordLable.text];
        [markLabelStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0,1)];
    
        cell.studyRecordLable.attributedText = markLabelStr;

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 40;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
