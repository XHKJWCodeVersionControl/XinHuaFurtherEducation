//
//  LoginAndRegisterRequest.h
//  新华继续教育
//
//  Created by 李李贤军 on 15/7/30.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "AFAppRequest.h"

@interface LoginAndRegisterRequest : AFAppRequest
//+(AFRequestState *)loginWithSucc:(void(^)(NSDictionary * DataDic))succ WithUserName:(NSString *)userName WithPassword:(NSString *)password;
//+(AFRequestState *)registerWithSucc:(void(^)(NSDictionary * DataDic))succ WithUserName:(NSString *)userName WithPassword:(NSString *)password WithUserType:(int)userType WithSource:(int)source WithPhoneNum:(NSString *)phoneNum WithEmail:(NSString *)email;
/*登录**/
+(AFRequestState*)loginWithSucc:(void(^)(NSDictionary * DataDic))succ withIdentityNumber:(NSString *)IdentityNumber withFullName:(NSString*)FullName withLogigType:(int)loginType withAreaCode:(int)areaCode;
////登录
//+(AFRequestState *)loginRequestWithusername:(NSString * )username WithPassword:(NSString *)password withSucc:(void(^)(NSDictionary*))succ ;
+(AFRequestState*)loginWithSucc:(void(^)(NSDictionary * DataDic))succ ;

@end
