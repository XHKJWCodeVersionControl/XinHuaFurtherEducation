//
//  descriptionView.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/8/21.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "descriptionView.h"

@implementation descriptionView
+(descriptionView*)descriptionView
{

    return [[[NSBundle mainBundle] loadNibNamed:@"description" owner:self options:nil] lastObject];
}



@end
