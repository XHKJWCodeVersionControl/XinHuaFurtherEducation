//
//  ClassDetailVC.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/9/25.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "ClassDetailVC.h"
#import "detailClassView.h"
#import "studyRecordTableViewCell.h"
@interface ClassDetailVC ()<UITableViewDataSource,UITableViewDelegate>
{

}
@property(nonatomic,strong)UITableView * tableView;

@end

@implementation ClassDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
    [baseClass baseNavcontroller:self titleStr:@"课程详情"];
    [self createTableView];
}
-(void)createTableView{
    UITableView * tableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 120, WIDETH, HEIGHT - 120)];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [[UIView alloc] init];
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
-(void)createView
{
    detailClassView * detail= [detailClassView setDetailClassView];
    detail.frame = CGRectMake(0, 0, WIDETH, 120);
    [self.view addSubview:detail];
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
