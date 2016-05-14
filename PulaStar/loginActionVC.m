//
//  loginActionVC.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/12.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "loginActionVC.h"
#import "MyLoginModel.h"

@interface loginActionVC ()
{
    UITextField     *txtUser;
    UITextField     *txtPwd;
}
@end

@implementation loginActionVC

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
    
    UIImageView* line1 = [[UIImageView alloc] initWithFrame:CGRectMake(16, 20, mainWidth - 32, 0.5)];
    line1.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    [self.view addSubview:line1];
    
    UIImageView* line3 = [[UIImageView alloc] initWithFrame:CGRectMake(16, 108, mainWidth - 32, 0.5)];
    line3.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    [self.view addSubview:line3];
    
    UIImageView* line4 = [[UIImageView alloc] initWithFrame:CGRectMake(16, 20, 0.5, 88)];
    line4.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    [self.view addSubview:line4];
    
    UIImageView* line5 = [[UIImageView alloc] initWithFrame:CGRectMake(mainWidth - 16, 20, 0.5, 88)];
    line5.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    [self.view addSubview:line5];
    
    UIView* vUser = [[UIView alloc] initWithFrame:CGRectMake(16.5, 20.5, mainWidth - 33, 87)];
    vUser.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:vUser];
    
    UIImageView* line2 = [[UIImageView alloc] initWithFrame:CGRectMake(16, 64, mainWidth - 32, 0.5)];
    line2.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    [self.view addSubview:line2];
    
    UIImageView* imgUser = [[UIImageView alloc] initWithFrame:CGRectMake(10, 12, 20, 20)];
    imgUser.image = [UIImage imageNamed:@"login_name"];
    [vUser addSubview:imgUser];
    
    txtUser = [[UITextField alloc] initWithFrame:CGRectMake(35, 0, vUser.frame.size.width - 35, 44)];
    txtUser.placeholder = @"请输入您的账号";
    txtUser.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtUser.font = [UIFont systemFontOfSize:14];
    txtUser.text = [[NSUserDefaults standardUserDefaults] objectForKey:kLoginUsername];
    [vUser addSubview:txtUser];
    
    UIImageView* imgPwd = [[UIImageView alloc] initWithFrame:CGRectMake(10, 56, 20, 20)];
    imgPwd.image = [UIImage imageNamed:@"login_password"];
    [vUser addSubview:imgPwd];
    
    txtPwd = [[UITextField alloc] initWithFrame:CGRectMake(35, 44, vUser.frame.size.width - 35, 44)];
    txtPwd.placeholder = @"请输入您的密码";
    txtPwd.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtPwd.font = [UIFont systemFontOfSize:14];
    txtPwd.secureTextEntry = YES;
    [vUser addSubview:txtPwd];
    
    UIButton* btnLogin = [[UIButton alloc] initWithFrame:CGRectMake(16, 120, mainWidth - 32, 44)];
    btnLogin.layer.cornerRadius = 5;
    btnLogin.backgroundColor = MYINFO_NAVBAR_COLOR;
    [btnLogin setTitle:@"登    录" forState:UIControlStateNormal];
    [btnLogin addTarget:self action:@selector(btnLoginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLogin];
    

}




#pragma mark - action

- (void)btnLoginAction
{
    if(txtUser.text.length==0)
    {
        [[XBToastManager ShardInstance] showtoast:@"请输入账号"];
        return;
    }
    if(txtPwd.text.length==0)
    {
        [[XBToastManager ShardInstance] showtoast:@"请输入密码"];
        return;
    }
    [[XBToastManager ShardInstance] showprogress];
    
    //__weak typeof (self) wSelf = self;
    
    [MyLoginModel doUserLogin:txtUser.text pwd:txtPwd.text success:^(AFHTTPRequestOperation* operation, NSObject* result){
    
        BOOL error = [[(NSDictionary*)result objectForKey:@"error"] boolValue];
        
        if(error == FALSE)   //登陆成功
        {
            
            NSDictionary *data = [(NSDictionary*)result objectForKey:@"data"];
            NSString *name = [(NSDictionary *)data objectForKey:@"name"];
            
            
            [[NSUserDefaults standardUserDefaults] setObject:name forKey:UserInfoName];
            [[NSUserDefaults standardUserDefaults] setObject:txtUser.text forKey:UserInfoNo];
            [[NSUserDefaults standardUserDefaults] setObject:txtPwd.text forKey:UserInfoPassword];
            [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:UserLoginStatus];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:userlogined object:nil];
            
            [[XBToastManager ShardInstance] hideprogress];
            
            [[XBToastManager ShardInstance] showtoast:@"登录成功"];
            
            [MyLoginModel doUserGetInfo:txtUser.text pwd:txtPwd.text success:^(AFHTTPRequestOperation* operation2, NSObject* result2){
                BOOL error2 = [[(NSDictionary*)result2 objectForKey:@"error"] boolValue];
                
                if(error2 == FALSE)
                {
                    NSDictionary *data2 = [(NSDictionary*)result2 objectForKey:@"data"];
                    NSString *parenetName = [(NSDictionary *)data2 objectForKey:@"parentName"];
                    NSString *phone  = [(NSDictionary *)data2 objectForKey:@"mobile"];
                    NSString *birthday = [(NSDictionary *)data2 objectForKey:@"birthday"];
                    NSInteger age = [MyLoginModel getUserAge:(NSString *)birthday];
                    
                    [[NSUserDefaults standardUserDefaults] setObject:parenetName forKey:UserInfoParentName];
                    [[NSUserDefaults standardUserDefaults] setObject:phone forKey:UserInfoMobile];
                    //[[NSUserDefaults standardUserDefaults] setObject:txtPwd.text forKey:UserInfoPassword];
                    [[NSUserDefaults standardUserDefaults] setInteger:age forKey:UserInfoAge];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    
                }
                
            }failure:^(NSError* error2){
                
                
            }];
            
            __weak typeof (self) wSelf = self;
            
            [wSelf.navigationController popViewControllerAnimated:YES];
           

            
        
        }
        else   //登陆失败
        {
            [[XBToastManager ShardInstance] hideprogress];
            
            [[XBToastManager ShardInstance] showtoast:@"登录失败，请检查用户名或密码"];
            
        }
            } failure:^(NSError* error){
        
        [[XBToastManager ShardInstance] hideprogress];
        [[XBToastManager ShardInstance] showtoast:@"登录失败,请查看网络"];
    }];
    
}




@end
