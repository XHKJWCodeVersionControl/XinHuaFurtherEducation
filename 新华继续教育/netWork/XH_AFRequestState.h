//
//  XH_AFRequestState.h
//  新华继续教育
//
//  Created by 李李贤军 on 15/8/16.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "AFAppRequest.h"

@interface XH_AFRequestState : AFAppRequest
/*地区选择**/
+(AFRequestState*)regionSelectionWithSucc:(void(^)(NSDictionary * DataDic))succ;
/*年份选择**/
+(AFRequestState*)CourseSelectionWithSucc:(void(^)(NSDictionary * DataDic))succ withUser_Id:(NSString *)userId withUnionID:(NSString*)unionID;
@end
