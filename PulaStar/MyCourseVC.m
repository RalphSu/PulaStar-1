//
//  MyCourseVC.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/19.
//  Copyright © 2016年 PulaStar. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "MyCourseVC.h"
#import "MyLoginModel.h"

@interface MyCourseVC ()
{
    UILabel     *expireDate;
    UILabel     *systemCourse;
    UILabel     *specialCourse;
    UILabel     *gongfangCourse;
    UILabel     *memActCourse;
    UIProgressView *progress;
    UILabel *courseProgress;
    UILabel     *courseTime;
}
@end

@implementation MyCourseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我 的 课 程";
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof (self) wSelf = self;
    
    [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:MYCOURSE_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
    
    
    [self actionCustomLeftBtnWithNrlImage:@"btnback" htlImage:@"btnback" title:@"" action:^{
        [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:MYINFO_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
        
        [wSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    UILabel *myCourseChn = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, mainWidth/3, 25)];
    
    myCourseChn.adjustsFontSizeToFitWidth = YES;
    myCourseChn.text = @"我的课程";
    myCourseChn.font = [UIFont boldSystemFontOfSize:25];
    //basicInfoChn.textAlignment = NSTextAlignmentCenter;
    
    myCourseChn.textColor = [UIColor hexFloatColor:@"66cc33"];
    
    [self.view addSubview:myCourseChn];
    
    UILabel *myCourseEng = [[UILabel alloc] initWithFrame:CGRectMake(mainWidth/3, 10, mainWidth/2, 25)];
    
    myCourseEng.adjustsFontSizeToFitWidth = YES;
    myCourseEng.text = @"My Course";
    myCourseEng.textAlignment = NSTextAlignmentCenter;
    myCourseEng.font = [UIFont boldSystemFontOfSize:25];
    //label5.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    myCourseEng.textColor = [UIColor whiteColor];
    myCourseEng.backgroundColor = [UIColor hexFloatColor:@"66cc33"];
    
    [self.view addSubview:myCourseEng];
    
    
    UIImageView* line1 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 50, (mainWidth - 30), 2)];
    line1.backgroundColor = [UIColor hexFloatColor:@"66cc33"];
    [self.view addSubview:line1];
    
    UIImageView* line2 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 50 , 2, 30*5)];
    line2.backgroundColor = [UIColor hexFloatColor:@"66cc33"];
    [self.view addSubview:line2];
    
    UIImageView* line3 = [[UIImageView alloc] initWithFrame:CGRectMake(15 + (mainWidth - 30)*0.3, 50 , 2, 30*5)];
    line3.backgroundColor = [UIColor hexFloatColor:@"66cc33"];
    [self.view addSubview:line3];
    
    UIImageView* line4 = [[UIImageView alloc] initWithFrame:CGRectMake(mainWidth - 17, 50 , 2, 30*5)];
    line4.backgroundColor = [UIColor hexFloatColor:@"66cc33"];
    [self.view addSubview:line4];
    
    UILabel *courseExpireDate = [[UILabel alloc] initWithFrame:CGRectMake(17, 52 + 30*0 , (mainWidth - 30)*0.3 - 2, 28)];
    
    courseExpireDate.adjustsFontSizeToFitWidth = YES;
    courseExpireDate.text = @"有效期";
    
    courseExpireDate.textAlignment = NSTextAlignmentCenter;
    courseExpireDate.font = [UIFont boldSystemFontOfSize:18];
    //label5.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    //no.textColor = [UIColor whiteColor];
    //no.backgroundColor = [UIColor blackColor];
    [self.view addSubview:courseExpireDate];
    
    expireDate = [[UILabel alloc] initWithFrame:CGRectMake(15 + (mainWidth - 30)*0.3 + 2, 52 + 30*0 , (mainWidth - 30)*0.7 - 4, 28)];
    
    expireDate.adjustsFontSizeToFitWidth = YES;
    //userNo.text = @"学号";
    expireDate.textAlignment = NSTextAlignmentCenter;
    expireDate.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:expireDate];
    
    
    UIImageView* line5 = [[UIImageView alloc] initWithFrame:CGRectMake(17, 50 + 30, mainWidth - 34, 2)];
    line5.backgroundColor = [UIColor hexFloatColor:@"66cc33"];
    [self.view addSubview:line5];
    
    UILabel *userSystemCourse = [[UILabel alloc] initWithFrame:CGRectMake(17, 52 + 30*1 , (mainWidth - 30)*0.3 - 2, 28)];
    
    userSystemCourse.adjustsFontSizeToFitWidth = YES;
    userSystemCourse.text = @"系统课程";
    userSystemCourse.textAlignment = NSTextAlignmentCenter;
    userSystemCourse.font = [UIFont boldSystemFontOfSize:18];
    userSystemCourse.backgroundColor = [UIColor hexFloatColor:@"CCFFCC"];
    //label5.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    //no.textColor = [UIColor whiteColor];
    //no.backgroundColor = [UIColor blackColor];
    [self.view addSubview:userSystemCourse];
    
    systemCourse = [[UILabel alloc] initWithFrame:CGRectMake(15 + (mainWidth - 30)*0.3 + 2, 52 + 30*1, (mainWidth - 30)*0.7 - 4, 28)];
    
    systemCourse.adjustsFontSizeToFitWidth = YES;
    //userName.text = @"姓名";
    systemCourse.textAlignment = NSTextAlignmentCenter;
    systemCourse.backgroundColor = [UIColor hexFloatColor:@"CCFFCC"];
    systemCourse.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:systemCourse];
    
    
    
    
    UIImageView* line6 = [[UIImageView alloc] initWithFrame:CGRectMake(17, 80 + 30 *1, mainWidth - 34, 2)];
    line6.backgroundColor = [UIColor hexFloatColor:@"66cc33"];
    [self.view addSubview:line6];
    
    
    UILabel *userSpecialCourse = [[UILabel alloc] initWithFrame:CGRectMake(17, 52 + 30*2 , (mainWidth - 30)*0.3 - 2, 28)];
    
    userSpecialCourse.adjustsFontSizeToFitWidth = YES;
    userSpecialCourse.text = @"特殊课程";
    userSpecialCourse.textAlignment = NSTextAlignmentCenter;
    userSpecialCourse.font = [UIFont boldSystemFontOfSize:18];
    //label5.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    //no.textColor = [UIColor whiteColor];
    //no.backgroundColor = [UIColor blackColor];
    [self.view addSubview:userSpecialCourse];
    
    specialCourse = [[UILabel alloc] initWithFrame:CGRectMake(15 + (mainWidth - 30)*0.3 + 2, 52 + 30*2, (mainWidth - 30)*0.7 - 4, 28)];
    
    specialCourse.adjustsFontSizeToFitWidth = YES;
    //userGender.text = @"性别";
    specialCourse.textAlignment = NSTextAlignmentCenter;
    specialCourse.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:specialCourse];
    
    
    UIImageView* line7 = [[UIImageView alloc] initWithFrame:CGRectMake(17, 80 + 30 * 2, mainWidth - 34, 2)];
    line7.backgroundColor = [UIColor hexFloatColor:@"66cc33"];
    [self.view addSubview:line7];
    
    UILabel *userGongFangCourse = [[UILabel alloc] initWithFrame:CGRectMake(17, 52 + 30*3 , (mainWidth - 30)*0.3 - 2, 28)];
    
    userGongFangCourse.adjustsFontSizeToFitWidth = YES;
    userGongFangCourse.text = @"艺术工坊";
    userGongFangCourse.textAlignment = NSTextAlignmentCenter;
    userGongFangCourse.font = [UIFont boldSystemFontOfSize:18];
    //label5.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    //no.textColor = [UIColor whiteColor];
    //no.backgroundColor = [UIColor blackColor];
    userGongFangCourse.backgroundColor = [UIColor hexFloatColor:@"CCFFCC"];
    [self.view addSubview:userGongFangCourse];
    
    gongfangCourse = [[UILabel alloc] initWithFrame:CGRectMake(15 + (mainWidth - 30)*0.3 + 2, 52 + 30*3, (mainWidth - 30)*0.7 - 4, 28)];
    
    gongfangCourse.adjustsFontSizeToFitWidth = YES;
    //userParentName.text = @"家长姓名";
    gongfangCourse.textAlignment = NSTextAlignmentCenter;
    gongfangCourse.font = [UIFont systemFontOfSize:18];
    gongfangCourse.backgroundColor = [UIColor hexFloatColor:@"CCFFCC"];
    
    [self.view addSubview:gongfangCourse];
    
    UIImageView* line8 = [[UIImageView alloc] initWithFrame:CGRectMake(17, 80 + 30 * 3, mainWidth - 34, 2)];
    line8.backgroundColor = [UIColor hexFloatColor:@"66cc33"];
    [self.view addSubview:line8];
    
    UILabel *userMemActCourse = [[UILabel alloc] initWithFrame:CGRectMake(17, 52 + 30*4 , (mainWidth - 30)*0.3 - 2, 28)];
    
    userMemActCourse.adjustsFontSizeToFitWidth = YES;
    userMemActCourse.text = @"会员活动";
    userMemActCourse.textAlignment = NSTextAlignmentCenter;
    userMemActCourse.font = [UIFont boldSystemFontOfSize:18];
    //label5.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    //no.textColor = [UIColor whiteColor];
    //no.backgroundColor = [UIColor blackColor];
    [self.view addSubview:userMemActCourse];
    
    memActCourse = [[UILabel alloc] initWithFrame:CGRectMake(15 + (mainWidth - 30)*0.3 + 2, 52 + 30*4, (mainWidth - 30)*0.7 - 4, 28)];
    
    memActCourse.adjustsFontSizeToFitWidth = YES;
    //userMobile.text = @"联系电话";
    memActCourse.textAlignment = NSTextAlignmentCenter;
    memActCourse.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:memActCourse];
    
    
    
    UIImageView* line9 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 80 + 30 * 4, mainWidth - 30, 2)];
    line9.backgroundColor = [UIColor hexFloatColor:@"66cc33"];
    [self.view addSubview:line9];
    
    
    UILabel *systemCourseTitle = [[UILabel alloc] initWithFrame:CGRectMake(15, 85 + 30 * 4, mainWidth/4, 20)];
    
    systemCourseTitle.adjustsFontSizeToFitWidth = YES;
    systemCourseTitle.text = @"系统课程";
    systemCourseTitle.textAlignment = NSTextAlignmentCenter;
    systemCourseTitle.font = [UIFont boldSystemFontOfSize:20];
    //label5.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    systemCourseTitle.textColor = [UIColor whiteColor];
    systemCourseTitle.backgroundColor = [UIColor hexFloatColor:@"66cc33"];
    
    [self.view addSubview:systemCourseTitle];


    UIImageView* img = [[UIImageView alloc] initWithFrame:CGRectMake(15 , 85 + 20 + 30 * 4, mainWidth - 30 ,mainHeight * 0.2 )];
    
    img.image = [UIImage imageNamed:@"student_grade"];
    [self.view addSubview:img];

    UILabel *levelTitle = [[UILabel alloc] initWithFrame:CGRectMake(15, 85 + 20 + 30 * 4 + mainHeight * 0.2, mainWidth/4, 20)];
    
    levelTitle.adjustsFontSizeToFitWidth = YES;
    
    //NSString *title = [NSString stringWithFormat:@"您的等级为:%d级",level ];
    
    levelTitle.text = @"您的等级为:";
    levelTitle.textAlignment = NSTextAlignmentCenter;
    levelTitle.font = [UIFont boldSystemFontOfSize:20];
    //label5.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    levelTitle.textColor = [UIColor blackColor];
    //levelTitle.backgroundColor = [UIColor hexFloatColor:@"66cc33"];
    
    [self.view addSubview:levelTitle];
 
    progress = [[UIProgressView alloc] initWithFrame:CGRectMake(15, 87 + 20*2 + 30 * 4 + mainHeight * 0.2, mainWidth - 30, 10)];
    progress.progressTintColor = mainColor;
    [self.view  addSubview:progress];
    
   
    UILabel *courseProgressTitle = [[UILabel alloc] initWithFrame:CGRectMake(15, 85 + 10 + 20*2 + 30 * 4 + mainHeight * 0.2, mainWidth/6, 20)];
    
    courseProgressTitle.adjustsFontSizeToFitWidth = YES;
    
    //NSString *title = [NSString stringWithFormat:@"您的等级为:%d级",level ];
    
    courseProgressTitle.text = @"课程进度为";
    courseProgressTitle.textAlignment = NSTextAlignmentCenter;
    courseProgressTitle.font = [UIFont boldSystemFontOfSize:14];
    //label5.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    //levelTitle.textColor = [UIColor whiteColor];
    //levelTitle.backgroundColor = [UIColor hexFloatColor:@"66cc33"];
    
    [self.view addSubview:courseProgressTitle];
    
    courseProgress = [[UILabel alloc] initWithFrame:CGRectMake(15 + mainWidth/6, 85 + 10 + 20*2 + 30 * 4 + mainHeight * 0.2, mainWidth/4, 20)];
    
    //courseProgress.adjustsFontSizeToFitWidth = YES;
    
    //NSString *title = [NSString stringWithFormat:@"您的等级为:%d级",level ];
    
    //courseProgress.text = @"课程进度为 ";
    courseProgress.textAlignment = NSTextAlignmentLeft;
    courseProgress.font = [UIFont boldSystemFontOfSize:14];
    //label5.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    //levelTitle.textColor = mainColor;
    //levelTitle.backgroundColor = [UIColor hexFloatColor:@"66cc33"];
    
    [self.view addSubview:courseProgress];
    
    courseTime = [[UILabel alloc] initWithFrame:CGRectMake(15 , 85 + 10 + 20*3 + 30 * 4 + mainHeight * 0.2, mainWidth - 30, 20)];
    
    //courseProgress.adjustsFontSizeToFitWidth = YES;
    
    //NSString *title = [NSString stringWithFormat:@"您的等级为:%d级",level ];
    
    //courseProgress.text = @"课程进度为 ";
    courseTime.textAlignment = NSTextAlignmentCenter;
    courseTime.font = [UIFont boldSystemFontOfSize:14];
    //label5.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    courseTime.textColor = [UIColor blackColor];
    //levelTitle.backgroundColor = [UIColor hexFloatColor:@"66cc33"];
    
    [self.view addSubview:courseTime];
    
    [[XBToastManager ShardInstance] showprogress];
    
    
    NSString *studentNo = [[NSUserDefaults standardUserDefaults] objectForKey:UserInfoNo];
    
    [MyLoginModel getUserCourseInfo:studentNo success:^(AFHTTPRequestOperation* operation, NSObject* result){
        
        int recordsReturned = [[(NSDictionary*)result objectForKey:@"recordsReturned"] intValue];
        
        if(recordsReturned != 0)   //获取成功
        {
            NSArray *recordArray = [(NSDictionary*)result objectForKey:@"records"];
            
            
            NSDictionary *record = [recordArray objectAtIndex:0];
            
            NSString *createTime = [(NSDictionary *)record objectForKey:@"createTime"];
            NSString *userCourseTime  = [(NSDictionary *)record objectForKey:@"courseTime"];
            NSString *updateTime = [(NSDictionary *)record objectForKey:@"courseTime"];
            
            int userLevel = [[(NSDictionary *)record objectForKey:@"level"] intValue];
            
            NSString * paidCount = [(NSDictionary *)record objectForKey:@"paiedCount"] ;
            NSString * usedCount = [(NSDictionary *)record objectForKey:@"usedCount"] ;
            NSString * specialCourseCount = [(NSDictionary *)record objectForKey:@"specialCourseCount"] ;
            
            NSString * usedSpecialCourseCount = [(NSDictionary *)record objectForKey:@"usedSpecialCourseCount"] ;
            NSString * huoDongCount = [(NSDictionary *)record objectForKey:@"huodongCount"] ;
            NSString * usedHuodongCount = [(NSDictionary *)record objectForKey:@"usedHuodongCount"] ;
            
            NSString * gongFangCount = [(NSDictionary *)record objectForKey:@"gongfangCount"] ;
            NSString * usedGongFangCount = [(NSDictionary *)record objectForKey:@"usedGongFangCount"] ;
            
            
            expireDate.text = updateTime;
            
            systemCourse.text =  [NSString stringWithFormat:@"总课券%@次,已使用%@次!",paidCount,usedCount];
            specialCourse.text = [NSString stringWithFormat:@"总课券%@次,已使用%@次!",specialCourseCount,usedSpecialCourseCount];
            gongfangCourse.text = [NSString stringWithFormat:@"总课券%@次,已使用%@次!",gongFangCount,usedGongFangCount];
            memActCourse.text = [NSString stringWithFormat:@"总课券%@次,已使用%@次!",huoDongCount,usedHuodongCount];
            
            NSString *userLevelTitle = [NSString stringWithFormat:@"您的等级为:%d级",userLevel ];
            
            levelTitle.text = userLevelTitle;
            
            
            if((paidCount != nil) &&([paidCount intValue] != 0))
             {
              progress.progress = [usedCount floatValue]/[paidCount floatValue] ;
                
              float pro = [usedCount floatValue]/[paidCount floatValue] * 100;
              courseProgress.text = [NSString stringWithFormat:@"%d%@", (int)pro ,@"%" ];
                 
             }
            
            courseTime.text = userCourseTime;
            
            [[XBToastManager ShardInstance] hideprogress];
            
            
            
            
        }
        else   //获取失败
        {
            [[XBToastManager ShardInstance] hideprogress];
            
            [[XBToastManager ShardInstance] showtoast:@"获取用户信息失败，请重新登录"];
            
        }
    } failure:^(NSError* error){
        
        [[XBToastManager ShardInstance] hideprogress];
        [[XBToastManager ShardInstance] showtoast:@"获取用户信息失败,请查看网络"];
    }];
    
}



@end
