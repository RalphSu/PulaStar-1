//
//  forgetPasswordVC.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/13.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>

#import "forgetPasswordVC.h"
#import "MyLoginModel.h"

@interface forgetPasswordVC ()
{
    UITextField     *mobile;
}
@end

@implementation forgetPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"密 码 重 置";
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof (self) wSelf = self;
    
    [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:MYINFO_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
    
    
    [self actionCustomLeftBtnWithNrlImage:@"btnback" htlImage:@"btnback" title:@"" action:^{
        [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:MYINFO_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
        
        [wSelf.navigationController popViewControllerAnimated:YES];
    }];
    

    UIImageView* line1 = [[UIImageView alloc] initWithFrame:CGRectMake(16, 20, mainWidth - 32, 0.5)];
    line1.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    [self.view addSubview:line1];
    
    
    mobile = [[UITextField alloc] initWithFrame:CGRectMake(16, 21, mainWidth - 32, 43)];
    mobile.placeholder = @"请输入您注册的手机";
    mobile.clearButtonMode = UITextFieldViewModeWhileEditing;
    mobile.font = [UIFont systemFontOfSize:14];
    //oldPwd.secureTextEntry = YES;
    mobile.text = [[NSUserDefaults standardUserDefaults] objectForKey:kLoginUsername];
    [self.view addSubview:mobile];
    
    
    UIImageView* line2 = [[UIImageView alloc] initWithFrame:CGRectMake(16, 64, mainWidth - 32, 0.5)];
    line2.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    [self.view  addSubview:line2];
    
   
    UIImageView* line4 = [[UIImageView alloc] initWithFrame:CGRectMake(15.5, 20, 0.5, 44)];
    line4.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    [self.view addSubview:line4];
    
    UIImageView* line5 = [[UIImageView alloc] initWithFrame:CGRectMake(mainWidth - 16.5, 20, 0.5, 44)];
    line5.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    [self.view addSubview:line5];
    
    
    
    
    UIButton* btnLogin = [[UIButton alloc] initWithFrame:CGRectMake(16, 84, mainWidth - 32, 44)];
    btnLogin.layer.cornerRadius = 5;
    btnLogin.backgroundColor = MYINFO_NAVBAR_COLOR;
    [btnLogin setTitle:@"确    认" forState:UIControlStateNormal];
    [btnLogin addTarget:self action:@selector(btnResetPwdAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLogin];
    
    
}




#pragma mark - action

- (void)btnResetPwdAction
{
    
    if(mobile.text.length != 11)
    {
        [[XBToastManager ShardInstance] showtoast:@"请输入正确的号码"];
        return;
    }

    
    
    [[XBToastManager ShardInstance] showprogress];
    
 
    [MyLoginModel resetPassword:mobile.text  success:^(AFHTTPRequestOperation* operation, NSObject* result){
        
        BOOL error = [[(NSDictionary*)result objectForKey:@"error"] boolValue];
        
        if(error == FALSE)   //修改成功
        {
            
            
            [[XBToastManager ShardInstance] hideprogress];
            
            [[XBToastManager ShardInstance] showtoast:@"密码重置成功"];
            
            __weak typeof (self) wSelf = self;
            
            [wSelf.navigationController popViewControllerAnimated:YES];
            
            
        }
        else   //修改失败
        {
            [[XBToastManager ShardInstance] hideprogress];
            
            [[XBToastManager ShardInstance] showtoast:@"密码重置失败,请核对手机号码信息"];
            
        }
    } failure:^(NSError* error){
        
        [[XBToastManager ShardInstance] hideprogress];
        [[XBToastManager ShardInstance] showtoast:@"密码重置失败,请查看网络"];
    }];
    
}




@end
