//
//  BaseInformation.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/9/19.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "BaseInformation.h"

@implementation BaseInformation

+(BaseInformation*)setBaseInformation
{
    return [[[NSBundle mainBundle] loadNibNamed:@"BasicInformation" owner:self options:nil] lastObject];
}

@end
