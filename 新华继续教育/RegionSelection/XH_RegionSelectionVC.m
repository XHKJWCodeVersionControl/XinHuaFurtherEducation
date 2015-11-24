//
//  XH_RegionSelectionVC.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/8/16.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "XH_RegionSelectionVC.h"
#import "XH_LoginVC.h"
#import "RegionHeadView.h"
#import "THFriendModel.h"
#import "THGroupModel.h"
#import "LoginAndRegisterRequest.h"
#import "XH_AFRequestState.h"
@interface XH_RegionSelectionVC ()<UITableViewDataSource,UITableViewDelegate,regionHeadViewDelegate>
@property(nonatomic,strong)NSArray * regionArray;
@property(nonatomic,strong)UIButton * regionButton;
@property(nonatomic,strong)NSArray * detailArray;
@property(nonatomic,strong)UIButton * detailBtn;
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * dataArray;
@property(nonatomic,strong)NSArray * dataLoadArray;
@property(nonatomic,strong) RegionHeadView * head;
@property(nonatomic,strong)NSMutableArray  * topDataArray;

@end

@implementation XH_RegionSelectionVC
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
    
//    /*测试**/
//    [[LoginAndRegisterRequest loginWithSucc:^(NSDictionary *DataDic) {
//        
//      
//
//        
//    }] addNotifaction:[MBProgressHUD mbHubShow]];
    
    self.dataLoadArray = [NSArray array];
    self.view.backgroundColor =[UIColor whiteColor];
    self.view.backgroundColor = UIColorFromRGB(0xeeeeee);
    [self setStatus];
   [self createView];
    
     [self  loadData];
    }
-(void)loadData
{

[[XH_AFRequestState regionSelectionWithSucc:^(NSDictionary *DataDic) {
 
    
  self.dataLoadArray = (NSArray*)DataDic[@"Data"];
    
    
    
    
   
//    
//    for (int  i = 0; i < self.dataArray.count; i++) {
//        if ([[NSString stringWithFormat:@"%d",self.dataArray[i][@"CitysList"][0][@"TopState"]] isEqualToString:[NSString stringWithFormat:@"%d",1]] ) {
//            
////        [self.topDataArray addObject:self.dataArray[i][@"CitysList"][0][@"AreaName"]];
//            self.topDataArray = [NSMutableArray arrayWithObject:self.dataArray[i][@"CitysList"][0]];
//            
//        }
//    }
    
    
    
//    /*置顶地区**/
//    [self regionView];
//    //tableView地区
//    [self createView];
    
}] addNotifaction:[MBProgressHUD mbHubShow]];
}
-(void)createView
{
    int count ;
   if([[NSString stringWithFormat:@"%d",(int)self.regionArray.count % 4] isEqual:[NSString stringWithFormat:@"%d",0]])
   {
       count = (int)self.regionArray.count/4;
   }else
   {
    count = (int)self.regionArray.count/4+1;
   }

    UITableView *   tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44+36*count, WIDETH,HEIGHT-64-49-36*count )];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    self.tableView = tableView;
        [self.view addSubview:tableView];
    self.tableView.backgroundColor = UIColorFromRGB(0xeeeeee);
    self.tableView.sectionHeaderHeight = 50;
   [self clipExtraCellLine:self.tableView];

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return  self.dataArray.count;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    THGroupModel * groupModel = self.dataArray[section];
   
    NSInteger count = groupModel.isOpen?1:0;
    return count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"freighdCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
//    THGroupModel * groupModel = self.dataArray[indexPath.section];
//    THFriendModel * freightModel = groupModel.friends[indexPath.row];
//    
//    
//    cell.textLabel.text = freightModel.name;
//    cell.detailTextLabel.text = freightModel.intro;
    
    self.regionArray = @[@"北京",@"天津",@"甘肃",@"青海",@"新疆",@"安徽",@"宁夏",@"淮安",@"福州",@"新疆建设兵团"];
    for (int i = 0; i < self.regionArray.count; i++) {
        self.regionButton =[[UIButton alloc] initWithFrame:CGRectMake(15+i%4*(WIDETH-23)/4.0, i/4*36+5, (WIDETH-30-24)/4.0, 28)];
        //        self.regionButton
        //        .backgroundColor = [UIColor redColor];
        [cell addSubview:self.regionButton];
        [self.regionButton setTitle:self.regionArray[i] forState:UIControlStateNormal];
        [self.regionButton setTitleColor:UIColorFromRGB(0x36B256) forState:UIControlStateNormal];
        self.regionButton.backgroundColor =[UIColor whiteColor];
        self.regionButton.titleLabel.font = [UIFont systemFontOfSize:11];
        [self.regionButton addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = UIColorFromRGB(0xeeeeee);
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 110;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    RegionHeadView * head = [RegionHeadView regionheadView:tableView];
    
    head.delegate = self;
    head.groupModel = self.dataArray[section];
    
    self.head = head;

    return head;
    
    
    
}
-(void)clipExtraCellLine:(UITableView*)tableView
{
    UIView * view = [[UIView alloc] init];
    view.backgroundColor =[UIColor clearColor];
    [self.tableView setTableFooterView:view];
}
-(void)regionHeadView:(RegionHeadView *)View
{
    [self.tableView reloadData];

}

#pragma mark -- 导航
-(void)setStatus
{
    [baseClass baseNavcontroller:self titleStr:@"新华会计网"];
/*收缩框**/
    [self search];
    /*置顶地区**/
    [self regionView];
}
-(void)regionView
{
    
    self.regionArray = @[@"北京",@"天津",@"北京",@"天津",@"甘肃",@"青海",@"新疆",@"安徽",@"宁夏",@"淮安",@"福州",@"新疆建设兵团"];
    for (int i = 0; i < self.regionArray.count; i++) {
        self.regionButton =[[UIButton alloc] initWithFrame:CGRectMake(15+i%4*(WIDETH-23)/4.0, 44+i/4*36, (WIDETH-30-24)/4.0, 28)];
//        self.regionButton
//        .backgroundColor = [UIColor redColor];
        [self.view addSubview:self.regionButton];
        [self.regionButton setTitle:self.regionArray[i] forState:UIControlStateNormal];
        [self.regionButton setTitleColor:UIColorFromRGB(0x36B256) forState:UIControlStateNormal];
        self.regionButton.backgroundColor =[UIColor whiteColor];
        self.regionButton.titleLabel.font = [UIFont systemFontOfSize:11];
        [self.regionButton addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)btnClick
{
    XH_LoginVC * login = [[XH_LoginVC alloc] init];
    NSLog(@"111");
//    login.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

    [self.navigationController pushViewController:login animated:YES];
    }
-(void)search{
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(15, 8, WIDETH-30, 28)];
    [self.view addSubview:bgView];
    bgView.backgroundColor = [UIColor whiteColor];
    UIImageView * leftView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 7, 14, 14)];
    leftView.image = [UIImage imageNamed:@"28x28"];
    [bgView addSubview:leftView];
    
    UITextField * textFiled = [[UITextField alloc] initWithFrame:CGRectMake(34, 0, bgView.frame.size.width-34, 28)];
    textFiled.placeholder = @"请入城市名或拼音";
    textFiled.font = [UIFont systemFontOfSize:12];
    textFiled.textColor = UIColorFromRGB(0x797979);
    [bgView addSubview:textFiled];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
