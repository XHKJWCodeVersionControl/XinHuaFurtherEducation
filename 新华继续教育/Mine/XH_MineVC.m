//
//  XH_MineVC.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/9/20.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "XH_MineVC.h"
#import "MineView.h"
#import "TH_ImagePickerVC.h"
@interface XH_MineVC ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIAlertViewDelegate>
{
}
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)MineView * mine;
@end

@implementation XH_MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MineView * mine = [MineView setMineView];
    mine.frame = CGRectMake(0, 0, WIDETH, HEIGHT-49);
    self.mine = mine;
    [self.view addSubview:mine];
    [mine.switchButton addTarget:self action:@selector(swithChBtn:) forControlEvents:UIControlEventValueChanged];
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    if ([user objectForKey:@"headPoetrait"]) {
        NSData *decodedImageData   = [[NSData alloc] initWithBase64EncodedString:[user objectForKey:@"headPoetrait"] options:0];
        //加载image
        UIImage *_decodedImage = [UIImage imageWithData:decodedImageData];
        [self.mine setIconImage:_decodedImage];

    }
        /*头像设置**/
    mine.HeadPortrait.layer.cornerRadius = 30;
    mine.HeadPortrait.layer.masksToBounds = YES;
    [mine.HeadPortrait addTarget:self action:@selector(HeadPortraitClick) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark -  - 头像设置
-(void)HeadPortraitClick
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从相册选择", nil];
    [actionSheet showInView:self.tableView];

}
-(void)swithChBtn:(id)sender
{
    UISwitch *newSwitch=(UISwitch *)sender;
    
    if (newSwitch.isOn) {
        
        NSLog(@"On");
        
    }else{
        
        NSLog(@"Off");
        
    }
    

}

#pragma mark ActionSheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:
            [self openCamera];
            break;
        case 1:
            [self openPicture];
            break;
        case 2:
            
            break;
    }
}
#pragma mark -打开相机
- (void)openCamera
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = sourceType;
    [self presentViewController:picker animated:YES completion:nil];
}
#pragma mark -打开图库
- (void)openPicture
{
    if (![TH_ImagePickerVC isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
        return;
    
    TH_ImagePickerVC *picVC = [[TH_ImagePickerVC alloc] init];
    picVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picVC.delegate = self;
    
    //    UINavigationController * picNav = [[UINavigationController alloc] initWithRootViewController:picVC];
    [self presentViewController:picVC animated:YES completion:nil];
    //    [self.navigationController pushViewController:picVC animated:YES];
}
#pragma mark
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
     [picker dismissViewControllerAnimated:YES completion:nil];
     UIImage *portraitImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [self.mine setIconImage:portraitImg];
    
     NSData *data = UIImageJPEGRepresentation(portraitImg, 1.0f);
      NSString *encodedImageStr = [data base64EncodedStringWithOptions:0];
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    [user setObject:encodedImageStr forKey:@"headPoetrait"];

    [user synchronize];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
