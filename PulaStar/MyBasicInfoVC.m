//
//  MyBasicInfoVC.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/17.
//  Copyright © 2016年 PulaStar. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "MyBasicInfoVC.h"
#import "MyLoginModel.h"

@interface MyBasicInfoVC ()
{
    UILabel     *userNo;
    UILabel     *userName;
    UILabel     *userGender;
    UILabel     *userParentName;
    UILabel     *userMobile;
    UILabel     *userAddress;
    
}
@end

@implementation MyBasicInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我 的 信 息";
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof (self) wSelf = self;
    
    [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:MYBASICINFO_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
    
    
    [self actionCustomLeftBtnWithNrlImage:@"btnback" htlImage:@"btnback" title:@"" action:^{
        [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:MYINFO_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
        
        [wSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    UILabel *basicInfoChn = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, mainWidth/3, 25)];
    
    basicInfoChn.adjustsFontSizeToFitWidth = YES;
    basicInfoChn.text = @"基本信息";
    basicInfoChn.font = [UIFont boldSystemFontOfSize:25];
    //basicInfoChn.textAlignment = NSTextAlignmentCenter;
    
    basicInfoChn.textColor = [UIColor hexFloatColor:@"cc0033"];
    
    [self.view addSubview:basicInfoChn];
    UILabel *basicInfoEng = [[UILabel alloc] initWithFrame:CGRectMake(mainWidth/3, 10, mainWidth/2, 25)];
    
    basicInfoEng.adjustsFontSizeToFitWidth = YES;
    basicInfoEng.text = @"Basic Information";
    basicInfoEng.textAlignment = NSTextAlignmentCenter;
    basicInfoEng.font = [UIFont boldSystemFontOfSize:25];
    //label5.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    basicInfoEng.textColor = [UIColor whiteColor];
    basicInfoEng.backgroundColor = [UIColor hexFloatColor:@"cc0033"];

    [self.view addSubview:basicInfoEng];
    
    
    UIImageView* line1 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 50, (mainWidth - 30), 30)];
    line1.backgroundColor = [UIColor hexFloatColor:@"CC0033"];
    [self.view addSubview:line1];
    
    UIImageView* line2 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 80 , 2, 30*6)];
    line2.backgroundColor = [UIColor hexFloatColor:@"CC0033"];
    [self.view addSubview:line2];
    
    UIImageView* line3 = [[UIImageView alloc] initWithFrame:CGRectMake(15 + (mainWidth - 30)*0.4, 80 , 2, 30*6)];
    line3.backgroundColor = [UIColor hexFloatColor:@"CC0033"];
    [self.view addSubview:line3];
    
    UIImageView* line4 = [[UIImageView alloc] initWithFrame:CGRectMake(mainWidth - 17, 80 , 2, 30*6)];
    line4.backgroundColor = [UIColor hexFloatColor:@"CC0033"];
    [self.view addSubview:line4];
    
    UILabel *no = [[UILabel alloc] initWithFrame:CGRectMake(17, 52 + 30 , (mainWidth - 30)*0.4 - 2, 28)];
    
    no.adjustsFontSizeToFitWidth = YES;
    no.text = @"学号";
    
    no.textAlignment = NSTextAlignmentCenter;
    no.font = [UIFont boldSystemFontOfSize:20];
    //label5.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    //no.textColor = [UIColor whiteColor];
    //no.backgroundColor = [UIColor blackColor];
    [self.view addSubview:no];
    
    userNo = [[UILabel alloc] initWithFrame:CGRectMake(15 + (mainWidth - 30)*0.4 + 2, 52 + 30 , (mainWidth - 30)*0.6 - 4, 28)];
    
    userNo.adjustsFontSizeToFitWidth = YES;
    //userNo.text = @"学号";
    userNo.textAlignment = NSTextAlignmentCenter;
    userNo.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:userNo];

    
    UIImageView* line5 = [[UIImageView alloc] initWithFrame:CGRectMake(17, 80 + 30, mainWidth - 34, 2)];
    line5.backgroundColor = [UIColor hexFloatColor:@"CC0033"];
    [self.view addSubview:line5];
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(17, 52 + 30*2 , (mainWidth - 30)*0.4 - 2, 28)];
    
    name.adjustsFontSizeToFitWidth = YES;
    name.text = @"姓名";
    name.textAlignment = NSTextAlignmentCenter;
    name.font = [UIFont boldSystemFontOfSize:20];
    name.backgroundColor = [UIColor hexFloatColor:@"FFC0CB"];
    //label5.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    //no.textColor = [UIColor whiteColor];
    //no.backgroundColor = [UIColor blackColor];
    [self.view addSubview:name];
    
    userName = [[UILabel alloc] initWithFrame:CGRectMake(15 + (mainWidth - 30)*0.4 + 2, 52 + 30*2, (mainWidth - 30)*0.6 - 4, 28)];
    
    userName.adjustsFontSizeToFitWidth = YES;
    //userName.text = @"姓名";
    userName.textAlignment = NSTextAlignmentCenter;
    userName.backgroundColor = [UIColor hexFloatColor:@"FFC0CB"];
    userName.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:userName];

    
    
    
    UIImageView* line6 = [[UIImageView alloc] initWithFrame:CGRectMake(17, 80 + 30 *2, mainWidth - 34, 2)];
    line6.backgroundColor = [UIColor hexFloatColor:@"CC0033"];
    [self.view addSubview:line6];
    
    
    UILabel *gender = [[UILabel alloc] initWithFrame:CGRectMake(17, 52 + 30*3 , (mainWidth - 30)*0.4 - 2, 28)];
    
    gender.adjustsFontSizeToFitWidth = YES;
    gender.text = @"性别";
    gender.textAlignment = NSTextAlignmentCenter;
    gender.font = [UIFont boldSystemFontOfSize:20];
    //label5.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    //no.textColor = [UIColor whiteColor];
    //no.backgroundColor = [UIColor blackColor];
    [self.view addSubview:gender];
    
    userGender = [[UILabel alloc] initWithFrame:CGRectMake(15 + (mainWidth - 30)*0.4 + 2, 52 + 30*3, (mainWidth - 30)*0.6 - 4, 28)];
    
    userGender.adjustsFontSizeToFitWidth = YES;
    //userGender.text = @"性别";
    userGender.textAlignment = NSTextAlignmentCenter;
    userGender.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:userGender];
    
    
    UIImageView* line7 = [[UIImageView alloc] initWithFrame:CGRectMake(17, 80 + 30 * 3, mainWidth - 34, 2)];
    line7.backgroundColor = [UIColor hexFloatColor:@"CC0033"];
    [self.view addSubview:line7];
    
    UILabel *parentName = [[UILabel alloc] initWithFrame:CGRectMake(17, 52 + 30*4 , (mainWidth - 30)*0.4 - 2, 28)];
    
    parentName.adjustsFontSizeToFitWidth = YES;
    parentName.text = @"家长姓名";
    parentName.textAlignment = NSTextAlignmentCenter;
    parentName.font = [UIFont boldSystemFontOfSize:20];
    //label5.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    //no.textColor = [UIColor whiteColor];
    //no.backgroundColor = [UIColor blackColor];
    parentName.backgroundColor = [UIColor hexFloatColor:@"FFC0CB"];
    [self.view addSubview:parentName];
    
    userParentName = [[UILabel alloc] initWithFrame:CGRectMake(15 + (mainWidth - 30)*0.4 + 2, 52 + 30*4, (mainWidth - 30)*0.6 - 4, 28)];
    
    userParentName.adjustsFontSizeToFitWidth = YES;
    //userParentName.text = @"家长姓名";
    userParentName.textAlignment = NSTextAlignmentCenter;
    userParentName.font = [UIFont boldSystemFontOfSize:20];
    userParentName.backgroundColor = [UIColor hexFloatColor:@"FFC0CB"];

    [self.view addSubview:userParentName];
    
    UIImageView* line8 = [[UIImageView alloc] initWithFrame:CGRectMake(17, 80 + 30 * 4, mainWidth - 34, 2)];
    line8.backgroundColor = [UIColor hexFloatColor:@"CC0033"];
    [self.view addSubview:line8];
    
    UILabel *mobile = [[UILabel alloc] initWithFrame:CGRectMake(17, 52 + 30*5 , (mainWidth - 30)*0.4 - 2, 28)];
    
    mobile.adjustsFontSizeToFitWidth = YES;
    mobile.text = @"联系电话";
    mobile.textAlignment = NSTextAlignmentCenter;
    mobile.font = [UIFont boldSystemFontOfSize:20];
    //label5.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    //no.textColor = [UIColor whiteColor];
    //no.backgroundColor = [UIColor blackColor];
    [self.view addSubview:mobile];
    
    userMobile = [[UILabel alloc] initWithFrame:CGRectMake(15 + (mainWidth - 30)*0.4 + 2, 52 + 30*5, (mainWidth - 30)*0.6 - 4, 28)];
    
    userMobile.adjustsFontSizeToFitWidth = YES;
    //userMobile.text = @"联系电话";
    userMobile.textAlignment = NSTextAlignmentCenter;
    userMobile.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:userMobile];
    
    
    
    UIImageView* line9 = [[UIImageView alloc] initWithFrame:CGRectMake(17, 80 + 30 * 5, mainWidth - 34, 2)];
    line9.backgroundColor = [UIColor hexFloatColor:@"CC0033"];
    [self.view addSubview:line9];
    
    UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake(17, 52 + 30*6 , (mainWidth - 30)*0.4 - 2, 28)];
    
    address.adjustsFontSizeToFitWidth = YES;
    address.text = @"家庭地址";
    address.backgroundColor = [UIColor hexFloatColor:@"FFC0CB"];
    address.textAlignment = NSTextAlignmentCenter;
    address.font = [UIFont boldSystemFontOfSize:20];
    //label5.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    //no.textColor = [UIColor whiteColor];
    //no.backgroundColor = [UIColor blackColor];
    [self.view addSubview:address];
    
    userAddress = [[UILabel alloc] initWithFrame:CGRectMake(15 + (mainWidth - 30)*0.4 + 2, 52 + 30*6, (mainWidth - 30)*0.6 - 4, 28)];
    
    userAddress.adjustsFontSizeToFitWidth = YES;
    //userAddress.text = @"家庭地址";
    userAddress.backgroundColor = [UIColor hexFloatColor:@"FFC0CB"];
    userAddress.textAlignment = NSTextAlignmentCenter;
    userAddress.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:userAddress];
    
    
    
    UIImageView* line10 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 80 + 30*6, mainWidth - 30, 2)];
    line10.backgroundColor = [UIColor hexFloatColor:@"CC0033"];
    [self.view addSubview:line10];
    
    
    UIImageView* img = [[UIImageView alloc] initWithFrame:CGRectMake(mainWidth/2 + 30 , mainHeight * 0.6, mainWidth/2 - 50 ,mainHeight * 0.2 )];
    
    img.image = [UIImage imageNamed:@"my_info_bottom_pic"];
    [self.view addSubview:img];
    

    [[XBToastManager ShardInstance] showprogress];
    
    
    NSString *studentNo = [[NSUserDefaults standardUserDefaults] objectForKey:UserInfoNo];
    NSString *studentPwd = [[NSUserDefaults standardUserDefaults] objectForKey:UserInfoPassword];;
    
    
    [MyLoginModel doUserGetInfo:studentNo pwd:studentPwd success:^(AFHTTPRequestOperation* operation, NSObject* result){
        
        BOOL error = [[(NSDictionary*)result objectForKey:@"error"] boolValue];
        
        if(error == FALSE)   //获取成功
        {
            NSDictionary *data = [(NSDictionary*)result objectForKey:@"data"];
            NSString *studentParenetName = [(NSDictionary *)data objectForKey:@"parentName"];
            NSString *studentPhone  = [(NSDictionary *)data objectForKey:@"mobile"];
            NSString *studentGender = [(NSDictionary *)data objectForKey:@"genderName"];
            NSString *studentName = [(NSDictionary *)data objectForKey:@"name"];
            NSString *studentAddress = [(NSDictionary *)data objectForKey:@"address"];
            
            userNo.text = studentNo;
            userName.text = studentName;
            userGender.text = studentGender;
            userParentName.text = studentParenetName;
            userMobile.text = studentPhone;
            userAddress.text = studentAddress;
            
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
