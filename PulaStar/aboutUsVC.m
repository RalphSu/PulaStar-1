//
//  aboutUsVC.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/15.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "forgetPasswordVC.h"
#import "aboutUsVC.h"

@interface aboutUsVC ()
{
    UITextField     *mobile;
}
@end

@implementation aboutUsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"关 于 我 们";
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof (self) wSelf = self;
    
    [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:MYINFO_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
    
    
    [self actionCustomLeftBtnWithNrlImage:@"btnback" htlImage:@"btnback" title:@"" action:^{
        [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:MYINFO_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
        
        [wSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    
    UIImageView* logo = [[UIImageView alloc] initWithFrame:CGRectMake((mainWidth/4 - 20), 30, mainWidth/4, mainWidth/4)];
    logo.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    logo.image = [UIImage imageNamed:@"pulalogo"];
    
    [self.view addSubview:logo];
    
    UILabel *company = [[UILabel alloc] initWithFrame:CGRectMake((mainWidth/2 + 5),30,(mainWidth/2 - 5), mainWidth/12)];
    company.font = [UIFont boldSystemFontOfSize:20];
    company.text = @"普拉星球";
    company.textColor = [UIColor blackColor];
    [self.view addSubview:company];
    
    UILabel *version = [[UILabel alloc] initWithFrame:CGRectMake((mainWidth/2 + 5), (32 + mainWidth/12) ,(mainWidth/2 - 5), mainWidth/12 )];
    version.font = [UIFont systemFontOfSize:16];
    version.textColor = [UIColor darkGrayColor];
    version.text = @"版本信息1.0";
    [self.view addSubview:version];
    
    UILabel *releaseDate = [[UILabel alloc] initWithFrame:CGRectMake((mainWidth/2 + 5),(34 + mainWidth/6),(mainWidth/2 - 5), mainWidth/12  )];
    releaseDate.font = [UIFont systemFontOfSize:16];
    releaseDate.text = @"发布日期2016-4-15";
    releaseDate.textColor = [UIColor darkGrayColor];
    [self.view addSubview:releaseDate];
    
    
    
    UIImageView* webSite = [[UIImageView alloc] initWithFrame:CGRectMake((mainWidth/4 -20), (mainHeight/4 + 60), 30, 30)];
    webSite.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    webSite.image = [UIImage imageNamed:@"product_ico"];
    [self.view addSubview:webSite];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake((mainWidth/4 + 20),(mainHeight/4 + 62), (mainWidth/4 - 20), mainWidth/15 )];
    label1.font = [UIFont systemFontOfSize:12];
    label1.text = @"产品官网";
    label1.textColor = [UIColor darkGrayColor];
    [self.view addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake((mainWidth/2 + 5),(mainHeight/4 + 62), (mainWidth/2 +5), mainWidth/15 )];
    label2.font = [UIFont systemFontOfSize:12];
    label2.text = @"www.zt-zoo.com";
    label2.textColor = [UIColor blueColor];
    [self.view addSubview:label2];
    
    
    
    
    UIImageView* weChat = [[UIImageView alloc] initWithFrame:CGRectMake((mainWidth/4 -20), (mainHeight/4 + 60 + 45), 30, 30)];
    weChat.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    weChat.image = [UIImage imageNamed:@"logo_wechat"];
    [self.view addSubview:weChat];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake((mainWidth/4 + 20),(mainHeight/4 + 60 + 45), (mainWidth/4 - 20), mainWidth/15 )];
    label3.font = [UIFont systemFontOfSize:12];
    label3.text = @"微信公众号";
    label3.textColor = [UIColor darkGrayColor];
    [self.view addSubview:label3];
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake((mainWidth/2 + 5),(mainHeight/4 + 60 + 45), (mainWidth/2 +5), mainWidth/15 )];
    label4.font = [UIFont systemFontOfSize:12];
    label4.text = @"PulaStar";
    label4.textColor = [UIColor blueColor];
    [self.view addSubview:label4];
    
    
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(mainWidth/4 ,(mainHeight/5 *3), mainWidth/2, mainHeight/15 )];
    //label5.font = [UIFont systemFontOfSize:16];
    label5.adjustsFontSizeToFitWidth = YES;
    label5.text = @"普拉星球 版权所有";
    label5.textAlignment = NSTextAlignmentCenter;
    //label5.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    label5.textColor = [UIColor darkGrayColor];
    [self.view addSubview:label5];
    
    UILabel *label6 = [[UILabel alloc] initWithFrame:CGRectMake(mainWidth/4,(mainHeight/5 *3 + mainHeight/15), mainWidth/2, mainHeight/15 )];
    //label6.font = [UIFont systemFontOfSize:16];
    label6.adjustsFontSizeToFitWidth = YES;
    label6.text = @"CopyRight@2016 普拉星球";
    label6.textAlignment = NSTextAlignmentCenter;
    label6.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    label6.textColor = [UIColor darkGrayColor];
    [self.view addSubview:label6];
    
    UILabel *label7 = [[UILabel alloc] initWithFrame:CGRectMake(mainWidth/4,(mainHeight/5 *3 + mainHeight/15 * 2),mainWidth/2, mainHeight/15 )];
    //label6.font = [UIFont systemFontOfSize:16];
    label7.adjustsFontSizeToFitWidth = YES;
    label7.text = @"All Rights Reserved";
    label7.textAlignment = NSTextAlignmentCenter;
    label7.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    label7.textColor = [UIColor darkGrayColor];
    [self.view addSubview:label7];
    
   }

@end