//
//  AFAppRequest.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/7/30.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "AFAppRequest.h"
#import "Gson.h"
#import "MJRefresh.h"
#import "MBProgressHUD+Show.h"
#define EGURL @"http://195.198.1.195/index.php?m=api"
@interface AFRequestState()
@property NSMutableArray * NotfifyArray;

-(void)changeState:(id)notify;
-(void)setEnd;
-(void)start;
@end

@implementation AFRequestState

-(id)init
{
    self = [super init];
    _NotfifyArray = [NSMutableArray new];
    return self;
}

-(AFRequestState *)addNotifaction:(id)notify
{
    //    NSValue * v = [NSValue valueWithNonretainedObject:notify];
    [_NotfifyArray addObject:notify];
    
    [self changeState:notify ];
    
    return self;
}

-(void)changeState:(id)notify
{
    if( [notify isKindOfClass:[MJRefreshBaseView class]]){
        if( _running ){
            
        }
        else{
            [(MJRefreshBaseView *)notify endRefreshing];
        }
    }
    if( [notify isKindOfClass:[MBProgressHUD class]]){
        if( _running ){
            [(MBProgressHUD *)notify show:YES];
        }
        else{
            [(MBProgressHUD *)notify removeFromSuperview];
        }
        
    }}


-(void)setEnd;
{
    _running = NO;
    
    for( id notify in _NotfifyArray ){
        [self changeState:notify];
    }
    
    [_NotfifyArray removeAllObjects];
}

-(void)start
{
    _running = YES;
    
    for( id notify in _NotfifyArray ){
        [self changeState:[(NSValue *)notify nonretainedObjectValue]];
    }
}



@end
@implementation AFAppRequest

+(AFHTTPRequestOperationManager *)sharedManager
{
    static AFHTTPRequestOperationManager* _om = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _om =[[AFHTTPRequestOperationManager alloc]init];
    });
    
    return _om;
}

+(AFAppRequest*)sharedClient
{
    static AFAppRequest* _AFRequest = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _AFRequest=[[AFAppRequest alloc]init];
    });
    
    return _AFRequest;
}



+(AFRequestState *)postRequestWithUrl:(NSString *)url param:(NSDictionary *)param succ:(void (^)(id))succ
{
    return [self postRequestWithUrl:url param:param succ:succ resp:nil];
}

+(AFRequestState *)postRequestWithUrl:(NSString *)url param:(NSDictionary *)param succ:(void (^)(id))succ fail:(void (^)(int errCode, NSError * err))fail
{
    return [self postRequestWithUrl:url param:param succ:succ fail:fail resp:nil];
}
//上传数据统一错误处理
+(AFRequestState *)postRequestWithUrl:(NSString *)url param:(NSDictionary *)param succ:(void (^)(id))succ resp:(Class)resp
{
    return [self postRequestWithUrl:url param:param succ:succ fail:^(int errCode, NSError *err) {
        
        [self error_hanlde:errCode Witherr:err];
        
    } resp:resp];
}

+(AFRequestState *)postRequestWithUrl:(NSString *)url param:(NSDictionary *)param succ:(void (^)(id))succ fail:(void (^)(int errCode, NSError * err))fail resp:(Class)resp;
{
    AFRequestState * State = [AFRequestState new];
    
    AFHTTPRequestOperationManager*manager=[self sharedClient];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//     manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    manager.securityPolicy.allowInvalidCertificates = YES;
    /*设置返回时间超时**/
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 8.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    [manager GET:url parameters:param success:^(AFHTTPRequestOperation * operation, id responseObject)
     {
         [self handleResponse:responseObject Succ:succ Fail:fail Resp:resp State:State];
         
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSNumber * errcode = [NSNumber numberWithInteger:error.code];
         fail([errcode intValue],error);
         [State setEnd];
         NSLog(@"Error: %@", error);
         NSLog ( @"operation: %@" , operation. responseString );
         
     }];
    [State start];
    return State;
    
}

//统一错误处理
+(void)error_hanlde:(int)errCode Witherr:(NSError *)err
{
    
    if (errCode ==1001) {
        [MBProgressHUD creatembHub:@"其他错误"];
    }if (errCode == 1002) {
        [MBProgressHUD creatembHub:@"身份信息正确"];
    }if (errCode == 1003) {
        [MBProgressHUD creatembHub:@"接口key验证不正确"];
    }if ( errCode== 1004) {
        [MBProgressHUD creatembHub:@"用户名或密码为空"];
    }if (errCode == 1005) {
        [MBProgressHUD creatembHub:@"学习卡号或者密码为空"];
    }if (errCode == 1006) {
        [MBProgressHUD creatembHub:@"身份证号或者姓名为空"];
    }if (errCode == 1007) {
        [MBProgressHUD creatembHub:@"身份证号或者姓名不符合规则"];
    }if (errCode == 1008) {
        [MBProgressHUD creatembHub:@"学员信息不存在"];
    }if (errCode == 1009) {
        [MBProgressHUD creatembHub:@"服务器请求出错"];
    }if (errCode == 1011) {
        [MBProgressHUD creatembHub:@"没有开通课程"];
    }if (errCode == 1012) {
        [MBProgressHUD creatembHub:@"登录类型不正确"];
    }
    
}

//对象转换＋异常捕获（防崩溃）
+(void)handleResponse:(id)responseObject Succ:(void (^)(id data))succ Fail:(void (^)(int errCode, NSError * err))fail Resp:(Class)resp State:(AFRequestState *)State;
{
    
    @try
    {
        if([responseObject isKindOfClass:[NSData class]])
        {
            responseObject = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        }
        
        if( responseObject == nil )
        {
            fail(10002, nil);
            return;
        }
        
        int error_code = [[responseObject objectForKey:@"Code"] intValue];
        
        if( error_code != 0)
        {
            fail(error_code, nil);
            return;
        }
        if(!resp)
        {
            succ(responseObject);
            return;
        }
        id data = [Gson fromObj:[responseObject objectForKey:@"Data"] Cls:resp];
        
        if(data == nil && resp == [NSNull class])
        {
            succ(nil);
            return;
        }
        
        if( data == nil && resp != [NSNull class] )
        {
            fail(10001, nil);
            return;
        }
        if(succ == nil)
        {
            return;
        }
        succ(data);
    }
    @catch(GsonException * excep){
        fail(10000, nil);
    }
    @catch(NSException * excep){
        fail(50000, nil);
    }
    @finally{
        [State setEnd];
    }
}

@end
