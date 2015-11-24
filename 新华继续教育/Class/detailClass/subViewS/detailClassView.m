//
//  detailClassView.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/9/25.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "detailClassView.h"

@implementation detailClassView

+(detailClassView*)setDetailClassView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"detailClassView" owner:self options:nil] lastObject];
}
@end
