//
//  ExamDescriptionView.m
//  新华继续教育
//
//  Created by 李李贤军 on 15/9/19.
//  Copyright (c) 2015年 XH. All rights reserved.
//

#import "ExamDescriptionView.h"

@implementation ExamDescriptionView
+(ExamDescriptionView*)setExamDescriptionView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ExamDescription" owner:self options:nil] lastObject];
}

@end
