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
@interface XH_ClassVC ()<UITableViewDataSource,UITableViewDelegate,HeaderVeiwDelegate>


@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * dataArray;
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
    self.title = @"2014年课程";
    [self createView];
    [self createTableView];
    
}
-(void)createTableView
{
    
    //tableView
 UITableView *   tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, WIDETH,HEIGHT) ];
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
    return header;
}
-(void)clickView
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
    XH_ClassPlayVC * v  = [[XH_ClassPlayVC alloc] init];

    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    v.str = cell.textLabel.text;
    [self.navigationController pushViewController:v animated:YES];
}

-(void)createView
{
    descriptionView * description = [descriptionView descriptionView];
    description.frame = CGRectMake(0, 10, WIDETH, 80);
    [self.view addSubview:description];
    
//    UIButton * b = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    b.backgroundColor =[UIColor redColor];
//    [b addTarget:self action:@selector(bb) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:b];
}
-(void)bb
{
//    XH_ClassPlayVC * c = [[XH_ClassPlayVC alloc] init];
    [self.navigationController pushViewController:[[XH_ClassPlayVC alloc]init] animated:YES];
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
