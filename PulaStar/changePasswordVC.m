//
//  changePassword.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/13.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "changePasswordVC.h"
#import "MyLoginModel.h"

@interface changePasswordVC ()
{
    UITextField     *oldPwd;
    UITextField     *newPwd1;
    UITextField     *newPwd2;
    
}
@end

@implementation changePasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"登    录";
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof (self) wSelf = self;
    
    [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:MYINFO_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
    
    
    
    [self actionCustomLeftBtnWithNrlImage:@"btnback" htlImage:@"btnback" title:@"" action:^{
        [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:MYINFO_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
        
        [wSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    /*
    UIView* vUser = [[UIView alloc] initWithFrame:CGRectMake(16.5, 20.5, mainWidth - 33, 131)];
    vUser.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:vUser];
    */
    
    UIImageView* line1 = [[UIImageView alloc] initWithFrame:CGRectMake(16, 20, mainWidth - 32, 0.5)];
    line1.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    [self.view addSubview:line1];
    
    
    UIImageView* imgOldPwd = [[UIImageView alloc] initWithFrame:CGRectMake(26, 32, 20, 20)];
    imgOldPwd.image = [UIImage imageNamed:@"login_password"];
    [self.view  addSubview:imgOldPwd];
    
    
    oldPwd = [[UITextField alloc] initWithFrame:CGRectMake(46, 21, mainWidth - 60, 43)];
    oldPwd.placeholder = @"请输入您的旧密码";
    oldPwd.clearButtonMode = UITextFieldViewModeWhileEditing;
    oldPwd.font = [UIFont systemFontOfSize:14];
    oldPwd.secureTextEntry = YES;
    oldPwd.text = [[NSUserDefaults standardUserDefaults] objectForKey:kLoginUsername];
    [self.view addSubview:oldPwd];

    
    UIImageView* line2 = [[UIImageView alloc] initWithFrame:CGRectMake(16, 64, mainWidth - 32, 0.5)];
    line2.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    [self.view  addSubview:line2];
    
    UIImageView* imgPwd1 = [[UIImageView alloc] initWithFrame:CGRectMake(26, 76, 20, 20)];
    imgPwd1.image = [UIImage imageNamed:@"login_password"];
    [self.view addSubview:imgPwd1];
    
    newPwd1 = [[UITextField alloc] initWithFrame:CGRectMake(46, 65,mainWidth - 60, 43)];
    newPwd1.placeholder = @"请输入您的新密码";
    newPwd1.clearButtonMode = UITextFieldViewModeWhileEditing;
    newPwd1.font = [UIFont systemFontOfSize:14];
    newPwd1.secureTextEntry = YES;
    [self.view addSubview:newPwd1];
    
    
    
    UIImageView* line3 = [[UIImageView alloc] initWithFrame:CGRectMake(16, 108, mainWidth - 32, 0.5)];
    line3.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    [self.view  addSubview:line3];
    
    
    UIImageView* imgPwd2 = [[UIImageView alloc] initWithFrame:CGRectMake(26, 120, 20, 20)];
    imgPwd2.image = [UIImage imageNamed:@"login_password"];
    [self.view addSubview:imgPwd2];
    
    
    
    newPwd2 = [[UITextField alloc] initWithFrame:CGRectMake(46, 109 , mainWidth - 60, 43)];
    newPwd2.placeholder = @"请再次输入您的新密码";
    newPwd2.clearButtonMode = UITextFieldViewModeWhileEditing;
    newPwd2.font = [UIFont systemFontOfSize:14];
    newPwd2.secureTextEntry = YES;
    [self.view addSubview:newPwd2];
    
    
    UIImageView* line6 = [[UIImageView alloc] initWithFrame:CGRectMake(16, 152, mainWidth - 32, 0.5)];
    line6.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    [self.view addSubview:line6];
    

    UIImageView* line4 = [[UIImageView alloc] initWithFrame:CGRectMake(15.5, 20, 0.5, 132)];
    line4.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    [self.view addSubview:line4];
    
    UIImageView* line5 = [[UIImageView alloc] initWithFrame:CGRectMake(mainWidth - 16.5, 20, 0.5, 132)];
    line5.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    [self.view addSubview:line5];
    
    

    
    UIButton* btnLogin = [[UIButton alloc] initWithFrame:CGRectMake(16, 166, mainWidth - 32, 44)];
    btnLogin.layer.cornerRadius = 5;
    btnLogin.backgroundColor = MYINFO_NAVBAR_COLOR;
    [btnLogin setTitle:@"确    认" forState:UIControlStateNormal];
    [btnLogin addTarget:self action:@selector(btnLoginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLogin];
    
    
}




#pragma mark - action

- (void)btnLoginAction
{
    
    if(oldPwd.text.length==0)
    {
        [[XBToastManager ShardInstance] showtoast:@"请输入旧密码"];
        return;
    }
    
    if((newPwd1.text.length==0)||(newPwd2.text.length==0))
    {
        [[XBToastManager ShardInstance] showtoast:@"请输入新密码"];
        return;
    }
    
    if(newPwd1.text !=  newPwd2.text)
    {
        [[XBToastManager ShardInstance] showtoast:@"新密码不一致"];
        return;
    }
    
    NSString* oldPassword = [[NSUserDefaults standardUserDefaults] objectForKey:UserInfoPassword];
    NSString* userNo = [[NSUserDefaults standardUserDefaults] objectForKey:UserInfoNo];
    
    if(oldPwd.text != oldPassword)
    {
        [[XBToastManager ShardInstance] showtoast:@"旧密码不正确"];
        return;
        
    }
    
    
    [[XBToastManager ShardInstance] showprogress];
    
    //__weak typeof (self) wSelf = self;
    
    [MyLoginModel doChangePassword:userNo oldPwd:oldPassword newPwd:newPwd1.text success:^(AFHTTPRequestOperation* operation, NSObject* result){
        
        BOOL error = [[(NSDictionary*)result objectForKey:@"error"] boolValue];
        
        if(error == FALSE)   //修改成功
        {
            
            [[NSUserDefaults standardUserDefaults] setObject:newPwd1.text forKey:UserInfoPassword];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            
            [[XBToastManager ShardInstance] hideprogress];
            
            [[XBToastManager ShardInstance] showtoast:@"密码修改成功"];
            
            __weak typeof (self) wSelf = self;
            
            [wSelf.navigationController popViewControllerAnimated:YES];
            
     
            
            
        }
        else   //登陆失败
        {
            [[XBToastManager ShardInstance] hideprogress];
            
            [[XBToastManager ShardInstance] showtoast:@"密码修改失败"];
            
        }
    } failure:^(NSError* error){
        
        [[XBToastManager ShardInstance] hideprogress];
        [[XBToastManager ShardInstance] showtoast:@"登陆失败,请查看网络"];
    }]; 

}




@end
