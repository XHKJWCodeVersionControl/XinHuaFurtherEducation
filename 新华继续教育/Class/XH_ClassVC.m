//
//  XH_ClassVC.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/8/20.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "XH_ClassVC.h"
#import "descriptionView.h"
#import "XH_ClassPlayVC.h"
#import "THFriendModel.h"
#import "THGroupModel.h"
#import "Headview.h"
#import "XH_MineVC.h"
#import "XH_OnlineExamVC.h"
#import "ClassDetailVC.h"
@interface XH_ClassVC ()<UITableViewDataSource,UITableViewDelegate,HeaderVeiwDelegate>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * dataArray;
@property(nonatomic,strong)Headview * header;
@property(nonatomic,strong)NSMutableArray * topDataArray;
@end

@implementation XH_ClassVC
//加载数据
-(NSArray *)dataArray
{
    
    
    if (!_dataArray) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"ffendList.plist" ofType:nil];
        
        
        NSArray * array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray * muArray = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary * dict in array) {
            THGroupModel * model = [THGroupModel GroupWithDict:dict];
            [muArray  addObject: model];
        }
        
        _dataArray = [muArray copy];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [baseClass baseNavcontroller:self titleStr:@"2014年课程"];
    [self setNav];
    [self createTableView];
    [self createView];
    [self onlineExam];
    
}

-(void)setNav
{
    //左侧首页按钮
    UIButton * leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [leftButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(LeftClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:leftButton];
}
-(void)LeftClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark -- 在线考试
-(void)onlineExam
{
    UIView * onlineBgView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDETH, 80)];
//    onlineBgView.backgroundColor = [UIColor redColor];
    self.tableView.tableFooterView = onlineBgView;
    NSArray * titleArray = @[@"进入在线考试",@"本年度未通过"];
    for (int i = 0 ; i < titleArray.count; i++) {
        UIButton * onlineButton = [[UIButton alloc] initWithFrame:CGRectMake(25+ ((WIDETH-60)/2.0)*i+10*i, 30, (WIDETH-60)/2.0, 30)];
        if (i==0) {
            onlineButton.backgroundColor = UIColorFromRGB(0x36B256);
        }else
        {
            onlineButton.backgroundColor = UIColorFromRGB(0x464646);
        }
        [onlineButton setTitle:titleArray[i] forState:UIControlStateNormal];
        onlineButton.titleLabel.font = [UIFont systemFontOfSize:13];
        onlineButton.layer.cornerRadius = 2;
        onlineButton.layer.masksToBounds = YES;
        onlineButton.tag = 10+i;
        [onlineButton addTarget:self action:@selector(onlineButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [onlineBgView addSubview:onlineButton];
    }

}

-(void)onlineButtonClick:(UIButton *)sender
{
    switch (sender.tag) {
        case 10:
        {
            NSLog(@"进入在线考试");
            
            XH_OnlineExamVC * online =[[XH_OnlineExamVC alloc] init];
            [self.navigationController pushViewController:online animated:YES];
            
           
        }
            break;
        case 11:
        {
            
            NSLog(@"本年度未完成");
        }
            break;
            

        default:
            break;
    }

}
-(void)createTableView
{
    UITableView *   tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDETH,HEIGHT-64-49) ];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    self.tableView = tableView;
//    tableView.backgroundColor =[UIColor redColor];
    //不要分割线
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView.sectionHeaderHeight = 50;
    [self clipExtraCellLine:self.tableView];
    
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    THGroupModel * groupModel = self.dataArray[section];
    NSInteger count = groupModel.isOpen?groupModel.friends.count:0;
    return count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"freighdCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    THGroupModel * groupModel = self.dataArray[indexPath.section];
    THFriendModel * freightModel = groupModel.friends[indexPath.row];
    
    
    cell.textLabel.text = freightModel.name;
    cell.detailTextLabel.text = freightModel.intro;
    
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    Headview * header = [Headview headerView:tableView];

    header.delegate = self;
    header.groupModel = self.dataArray[section];
    self.header = header;
    return header;
    


}

-(void)clickViews:(Headview*)headView
{
    [self.tableView reloadData];
    
    
}
-(void)clipExtraCellLine:(UITableView*)tableView
{
    UIView * view = [[UIView alloc] init];
    view.backgroundColor =[UIColor clearColor];
    [self.tableView setTableFooterView:view];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    XH_ClassPlayVC * class  = [[XH_ClassPlayVC alloc] init];
//
//    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
//    class.videoPath = cell.detailTextLabel.text;
//    class.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:class animated:YES];
    
    ClassDetailVC * detail =[[ClassDetailVC alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
}

-(void)createView
{
    descriptionView * description = [descriptionView descriptionView];
    description.frame = CGRectMake(0, 10, WIDETH, 80);
    self.tableView.tableHeaderView = description;
//    [self.view addSubview:description];
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
