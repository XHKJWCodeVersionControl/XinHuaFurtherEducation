//
//  downCell.m
//  down
//
//  Created by lixianjun on 15/10/6.
//  Copyright (c) 2015年 lixianjun. All rights reserved.
//

#import "downCell.h"
#import "MJDownload.h"
#import "MJProgressView.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation downCell

- (void)setUrl:(NSString *)url
{
   _url = [url copy];
    // 设置文字
    self.lable.text = [url lastPathComponent];
    // 控制状态J
    MJDownloadInfo *info = [[MJDownloadManager defaultManager] downloadInfoForURL:url];
    //下载完成
    if (info.state == MJDownloadStateCompleted) {
        self.openButton.hidden = NO;
        self.downloadButton.hidden = YES;
        self.progressView.hidden = YES;
        [self.openButton setBackgroundImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
        // 即将下载（等待下载）
    } else if (info.state == MJDownloadStateWillResume) {
        self.openButton.hidden = YES;
        self.downloadButton.hidden = NO;
        self.progressView.hidden = NO;
        
        [self.downloadButton setBackgroundImage:[UIImage imageNamed:@"clock"] forState:UIControlStateNormal];
        //其他状态
    } else {
        self.openButton.hidden = YES;
        self.downloadButton.hidden = NO;
        
        //没有下载的任务
        if (info.state == MJDownloadStateNone ) {
            self.progressView.hidden = YES;
            //有下载的任务
        } else {
            self.progressView.hidden = NO;
            
            if (info.totalBytesExpectedToWrite) {
                self.progressView.progress = 1.0 * info.totalBytesWritten / info.totalBytesExpectedToWrite;
                
            } else {
                self.progressView.progress = 0.0;
                
            }
        }
        
        
        if (info.state == MJDownloadStateResumed) {
            [self.downloadButton setBackgroundImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
        } else {
            [self.downloadButton setBackgroundImage:[UIImage imageNamed:@"download"] forState:UIControlStateNormal];
        }
    }

}
-(void)config
{

}
//下载
- (IBAction)downClick:(UIButton *)sender
{
    MJDownloadInfo *info = [[MJDownloadManager defaultManager] downloadInfoForURL:self.url];
    
    if (info.state == MJDownloadStateResumed || info.state == MJDownloadStateWillResume) {
        
        
        
        [[MJDownloadManager defaultManager] suspend:info.url];
    } else {
        [[MJDownloadManager defaultManager] download:self.url progress:^(NSInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytesExpectedToWrite) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.url = self.url;
            });
        } state:^(MJDownloadState state, NSString *file, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.url = self.url;
            });
        }];
    }

    
}
//播放
- (IBAction)openClick:(id)sender
{
    
//    MJDownloadInfo *info = [[MJDownloadManager defaultManager] downloadInfoForURL:self.url];
//    
//    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
//    
//    MPMoviePlayerViewController *mpc = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:info.file]];
//    [vc presentViewController:mpc animated:YES completion:nil];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
