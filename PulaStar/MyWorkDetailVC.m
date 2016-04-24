//
//  MyWorkDetailVC.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/23.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MyWorkDetailVC.h"
#import "KShareViewManage.h"

@interface MyWorkDetailVC ()
{
    UIImageView     *imgPro;
    UILabel *date;
    UILabel *time;
    UILabel *dianPing;
    UIImageView *levelImage;
    
    
    NSString *workInfoEffectDate;
    NSString *workInfoId;
    NSString *workInfoRate;
    NSString *workInfoNo;
    NSString *workInfoCourseNo;
    NSString *workInfoBranchNo;
    NSString *workInfoComments;
    NSString *workInfoIconId;
    NSString *workInfoIconFileId;
    NSString *workInfoIconName;
  
    
    
    NSString *image;
    
    
    
    
    
    
    
    
}
@end

@implementation MyWorkDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我 的 作 品";
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof (self) wSelf = self;
    
    [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:MYWORK_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
    
    
    
    [self actionCustomLeftBtnWithNrlImage:@"btnback" htlImage:@"btnback" title:@"" action:^{
        [wSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    imgPro = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10 ,(mainWidth - 20), mainHeight/2)];
    
    //imgProLeft.image = [UIImage imageNamed:@"noimage"];
    imgPro.layer.borderWidth = 0.5;
    imgPro.layer.cornerRadius = 5;
    imgPro.layer.borderColor = [[UIColor hexFloatColor:@"dedede"] CGColor];
    imgPro.layer.masksToBounds = YES;
    
    [imgPro setImage_oy:workImageBaseUrl image:image];
    
    [self.view addSubview:imgPro];
    
    date = [[UILabel alloc]initWithFrame:CGRectMake(10,20 + mainHeight/2,(mainWidth - 20)/4 + 2, 20)];
    
    date.text = @"日期:";
    
    date.backgroundColor = [UIColor hexFloatColor:@"EE7600"];
    date.textColor = [UIColor whiteColor];
    date.font = [UIFont systemFontOfSize:20];
    date.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:date];
    
    time = [[UILabel alloc]initWithFrame:CGRectMake(10 + (mainWidth - 20)/4,20 + mainHeight/2,(mainWidth - 20)*0.75, 20)];
    
    time.text = workInfoEffectDate;
    
    time.backgroundColor = [UIColor hexFloatColor:@"EE7600"];
    time.textColor = [UIColor whiteColor];
    time.font = [UIFont systemFontOfSize:20];
    time.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:time];
    
    
    dianPing = [[UILabel alloc]initWithFrame:CGRectMake(10,40 + mainHeight/2,(mainWidth - 20)/4, 30)];
    dianPing.text = @"点评:";
    dianPing.textColor = [UIColor hexFloatColor:@"EE7600"];
    dianPing.font = [UIFont systemFontOfSize:16];
    dianPing.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:dianPing];
    
    levelImage = [[UIImageView alloc] initWithFrame:CGRectMake(10 + (mainWidth - 20)*0.4, 40 + mainHeight/2 ,(mainWidth - 20)*0.5, 30)];
    
    
    NSString *string = [NSString stringWithFormat:@"star%@",workInfoRate];
    
    if([workInfoRate intValue] == 0)
    {
        string = [NSString stringWithFormat:@"star1"];
    }
    
    
    levelImage.image = [UIImage imageNamed:string];
    
    
    
    [self.view addSubview:levelImage];
    
    
    
    NSString* userName= [[NSUserDefaults standardUserDefaults] objectForKey:UserInfoName];
    
    
    NSArray * array = [KShareViewManage getShareListWithType:SharedType_WeChatCircel, SharedType_WeChatFriend, nil];
    
    [self actionCustomRightBtnWithNrlImage:@"share" htlImage:@"share" title:@"" action:^{
        
        
        [KShareViewManage showViewToShareNews:[NSString stringWithFormat:@"%@小朋友作品",userName]
                                      Content:@"普拉星球 少儿艺术创造力研发中心"
                                        Image:[UIImage imageNamed:@"pulalogo"]
                                          Url:[NSString stringWithFormat:@"http://121.40.151.183:8080/pula-sys/app/timecoursework/appshow?no=%@",workInfoNo]
                                     platform:array
                             inViewController:self];
        
    }];
    


    
}

-(MyWorkDetailVC *)initWithWorkInfo:(NSString*)workEffectDate workId:(NSString*)workId workRate:(NSString*)workRate workNo:(NSString*)workNo workCourseNo:(NSString*)workCourseNo workBranchNo:(NSString *)workBranchNo workComments:(NSString *)workComments workIconId:(NSString *)workIconId  workIconFileId:(NSString *)workIconFileId workIconName:(NSString*)workIconName
{
    
    image = [NSString stringWithFormat:@"fp=%@&id=%@",workIconFileId,workIconId];

    workInfoEffectDate = workEffectDate;
    workInfoId = workId;
    workInfoRate = workRate;
    workInfoNo =  workNo;
    workInfoCourseNo = workCourseNo;
    workInfoBranchNo = workBranchNo;
    workInfoComments = workComments;
    workInfoIconId =  workIconId;
    workInfoIconFileId = workIconFileId;
    workInfoIconName = workIconName;
    

    
    return self;
}



@end