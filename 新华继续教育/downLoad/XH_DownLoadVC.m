//
//  XH_DownLoadVC.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/8/20.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "XH_DownLoadVC.h"
#import "THFriendModel.h"
#import "THGroupModel.h"
#import "Headview.h"
#import "AppDelegate.h"
/*
 下载
 *
 */
#import <MediaPlayer/MediaPlayer.h>
#import "downCell.h"
#import "MJDownload.h"
#import "XH_DownLoadPlayViewController.h"
@interface XH_DownLoadVC ()<UITableViewDataSource,UITableViewDelegate,HeaderVeiwDelegate>
@property(nonatomic,strong)UITableView  * tableView;
@property(nonatomic,strong)NSArray * dataArray;
@property(nonatomic,strong)Headview * header;
@property (strong, nonatomic) NSMutableArray *urls;
@end

@implementation XH_DownLoadVC
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden= NO;
    [AppDelegate instance].ori_flag = 0;
}
-(void)viewDidAppear:(BOOL)animated
{
[AppDelegate instance].ori_flag = 0;
}

////加载数据
//-(NSArray *)dataArray
//{
//    
//    
//    if (!_dataArray) {
//        NSString * path = [[NSBundle mainBundle] pathForResource:@"ffendList.plist" ofType:nil];
//        
//        
//        NSArray * array = [NSArray arrayWithContentsOfFile:path];
//        NSMutableArray * muArray = [NSMutableArray arrayWithCapacity:array.count];
//        for (NSDictionary * dict in array) {
//            THGroupModel * model = [THGroupModel GroupWithDict:dict];
//            [muArray  addObject: model];
//        }
//        
//        _dataArray = [muArray copy];
//    }
//    return _dataArray;
//}
//
- (NSMutableArray *)urls
{
    if (!_urls) {
        self.urls = [NSMutableArray array];
        for (int i = 1; i<=10; i++) {
            [self.urls addObject:[NSString stringWithFormat:@"http://120.25.226.186:32812/resources/videos/minion_%02d.mp4", i]];
            //            [self.urls addObject:[NSString stringWithFormat:@"http://localhost:8080/MJServer/resources/big_videos/%02d.mp4", i]];
        }
    }
    return _urls;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [baseClass baseNavcontroller:self titleStr:@"已下载课程"];
    [self createTableView];
}
-(void)createTableView
{
    UITableView  * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDETH, HEIGHT-49)];
    tableView.delegate =self;
    tableView.dataSource = self;
    self.tableView = tableView;
//    tableView.tableFooterView = [[UIView alloc] init];
//    self.tableView.sectionHeaderHeight = 50;

    [self.view addSubview:tableView];

}
#pragma mark - Table view data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.urls.count;
}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    
//    
//    return 3;
//
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    
//    THGroupModel * groupModel = self.dataArray[section];
//    NSInteger count = groupModel.isOpen?groupModel.friends.count:0;
//    return count;
//    
//}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString * identifier = @"freighdCell";
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
//    }
//    THGroupModel * groupModel = self.dataArray[indexPath.section];
//    THFriendModel * freightModel = groupModel.friends[indexPath.row];
//    
//    
//    cell.textLabel.text = freightModel.name;
//    cell.detailTextLabel.text = freightModel.intro;
//    
//    return cell;
    static NSString *ID = @"id";
    downCell  * cell =[tableView dequeueReusableCellWithIdentifier:ID];
    
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"downCell" owner:self options:nil] lastObject];
    }
    cell.url = self.urls[indexPath.row];
    
    [cell config];
    return cell;
}
//-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    Headview * header = [Headview headerView:tableView];
//    
//    header.delegate = self;
//    header.groupModel = self.dataArray[section];
//    self.header = header;
//    return header;
//    
//    
//    
//}
//-(void)clickViews:(Headview*)headView
//{
//    [self.tableView reloadData];
//    
//    
//}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 控制状态
    MJDownloadInfo *info = [[MJDownloadManager defaultManager] downloadInfoForURL:self.urls[indexPath.row]];
    if (info.state == MJDownloadStateCompleted)
    {
//        UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
//        
//        MPMoviePlayerViewController *mpc = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:info.file]];
//        [vc presentViewController:mpc animated:YES completion:nil];
        
        XH_DownLoadPlayViewController * downPlay =[[XH_DownLoadPlayViewController alloc] initWithContentURL:[NSURL fileURLWithPath:info.file]];
        //缓存播放
        [downPlay.moviePlayer prepareToPlay];
        // 立即播放
        [downPlay.moviePlayer play];
        self.navigationController.navigationBarHidden= YES;
        [AppDelegate instance].ori_flag = 1;
        //播放
        [self presentViewController:downPlay animated:YES completion:nil];
        
    }
}
//- (BOOL)shouldAutorotate {
//    return NO;
//}
//
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
//    return YES;
//    
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }


@end
