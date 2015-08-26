//
//  LoginAndRegisterRequest.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/7/30.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "LoginAndRegisterRequest.h"

@implementation LoginAndRegisterRequest
+(AFRequestState *)loginWithSucc:(void(^)(NSDictionary * DataDic))succ WithUserName:(NSString *)userName WithPassword:(NSString *)password
{
    NSDictionary * param = @{@"username":userName,@"pw":password};
    return [self postRequestWithUrl:@"http://195.198.1.195/index.php?m=api" param:param succ:succ];
}

+(AFRequestState *)registerWithSucc:(void (^)(NSDictionary *))succ WithUserName:(NSString *)userName WithPassword:(NSString *)password WithUserType:(int)userType WithSource:(int)source WithPhoneNum:(NSString *)phoneNum WithEmail:(NSString *)email
{
    NSDictionary * param = @{@"username":userName,@"password":password,@"usertype":@(userType),@"source":@(source),@"moblie":phoneNum,@"email":email};
    return [self postRequestWithUrl:@"http://195.198.1.195/index.php?m=api&c=res" param:param succ:succ];
}



@end
