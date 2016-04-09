//
//  MineLoginVC.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/12.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "LoginVC.h"
//#import "LoginModel.h"
//#import "UserInstance.h"
//#import "RegUserVC.h"
#import "MineInfoLoginVC.h"
#import "loginActionVC.h"
#import "changePasswordVC.h"
#import "forgetPasswordVC.h"

@interface MineInfoLoginVC ()
{
    //UITextField     *txtUser;
    //UITextField     *txtPwd;
}
@end

@implementation MineInfoLoginVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"账 户 管 理";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:MYINFO_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
    
    __weak typeof (self) wSelf = self;
    [self actionCustomLeftBtnWithNrlImage:@"btnback" htlImage:@"btnback" title:@"" action:^{
        [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:MYINFO_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
        
        [wSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    
    UIImageView* logo = [[UIImageView alloc] initWithFrame:CGRectMake((mainWidth/2 -60), 10, 120, 120)];
    logo.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    logo.image = [UIImage imageNamed:@"pulalogo"];
    [self.view addSubview:logo];
    
}




- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    BOOL LoginStatus = [[NSUserDefaults standardUserDefaults] boolForKey:UserLoginStatus];
    
    if(LoginStatus == FALSE)
    {
        UIButton* login = [[UIButton alloc] initWithFrame:CGRectMake(20, 140, mainWidth - 40, 44)];
        login.layer.cornerRadius = 5;
        login.backgroundColor = MYINFO_NAVBAR_COLOR;
        [login setTitle:@"登   录" forState:UIControlStateNormal];
        [login addTarget:self action:@selector(btnLoginAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:login];
        
        UIButton* forgetPassword = [[UIButton alloc] initWithFrame:CGRectMake(20, 194, mainWidth - 40, 44)];
        forgetPassword.layer.cornerRadius = 5;
        forgetPassword.backgroundColor = MYINFO_NAVBAR_COLOR;
        [forgetPassword setTitle:@"忘 记 密 码" forState:UIControlStateNormal];
        [forgetPassword addTarget:self action:@selector(btnForgetPasswordAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:forgetPassword];
        
    }
    else
    {
        //BOOL on = [[[NSUserDefaults standardUserDefaults] objectForKey:UserLoginStatus] boolValue];
        UIButton* exitLogin = [[UIButton alloc] initWithFrame:CGRectMake(20, 140, mainWidth - 40, 44)];
        exitLogin.layer.cornerRadius = 5;
        exitLogin.backgroundColor = MYINFO_NAVBAR_COLOR;
        [exitLogin setTitle:@"退 出 登 录" forState:UIControlStateNormal];
        [exitLogin addTarget:self action:@selector(btnExitLoginAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:exitLogin];
        
        UIButton* changePassword = [[UIButton alloc] initWithFrame:CGRectMake(20, 194, mainWidth - 40, 44)];
        changePassword.layer.cornerRadius = 5;
        changePassword.backgroundColor = MYINFO_NAVBAR_COLOR;
        [changePassword setTitle:@"修 改 密 码" forState:UIControlStateNormal];
        [changePassword addTarget:self action:@selector(btnChangePasswordAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:changePassword];
        
    }

    
}


#pragma mark - action
- (void)btnLoginAction
{
    loginActionVC *vc = [[loginActionVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)btnChangePasswordAction
{
    changePasswordVC *vc = [[changePasswordVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) btnExitLoginAction
{
 
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:UserInfoNo];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:UserInfoName];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:UserInfoPassword];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:UserInfoParentName];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:UserInfoMobile];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:UserInfoAge];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:UserLoginStatus];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:userlogined object:nil];
    
    __weak typeof (self) wSelf = self;
    
   [wSelf.navigationController popViewControllerAnimated:YES];
    

}

- (void)btnForgetPasswordAction
{
    forgetPasswordVC *vc = [[forgetPasswordVC alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
