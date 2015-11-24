//
//  XH_AFRequestState.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/8/16.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "XH_AFRequestState.h"

@implementation XH_AFRequestState
/*地区选择**/
+(AFRequestState*)regionSelectionWithSucc:(void(^)(NSDictionary * DataDic))succ
{
    return [self postRequestWithUrl:[NSString stringWithFormat:@"%@UnionAreaDisplay.asmx/UnionList",base_Url] param:nil succ:succ];
}
/*年份选择**/
+(AFRequestState*)CourseSelectionWithSucc:(void(^)(NSDictionary * DataDic))succ withUser_Id:(NSString *)userId withUnionID:(NSString*)unionID
{
    
    NSDictionary * param = @{@"Key":[AppDelegate instance].token,@"UserID":userId ,@"UnionID":unionID};
    return [self postRequestWithUrl:[NSString stringWithFormat:@"%@YearCourses.asmx/GetYearCourses",base_Url] param:param succ:succ];
    
}
@end
