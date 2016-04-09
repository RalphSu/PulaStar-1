//
//  activityDetailVC.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/5.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "activityDetailVC.h"
#import "activityBuyVC.h"


@interface activityDetailVC ()<UITableViewDelegate>
{

    NSString *_activityPrice;
    NSString *_activityId;
    NSString *_activityNo;
    NSString *_activityTitle;
    NSString *_activityContent;
    NSString *_activityUpdateTime;
    NSString *_activityIconFileId;
    NSString *_activityIconId;
    
}
@end


@implementation activityDetailVC


- (id)initWithActivityInfo:(NSString *)activityPrice activityId:(NSString *)activityId activityNo:(NSString *)activityNo activityTitle:(NSString *)activityTitle activityContent:(NSString *)activityContent activityUpdateTime:(NSString *)activityUpdateTime activityIconFileId:(NSString *)activityIconFileId activityIconId:(NSString *)activityIconId
{
    self = [super init];
    if(self)
    {
        _activityPrice = activityPrice;
        _activityId = activityId;
        _activityNo =  activityNo;
        _activityTitle =  activityTitle;
        
        _activityContent = activityContent;
        _activityUpdateTime = activityUpdateTime;
        _activityIconFileId =  activityIconFileId;
        _activityIconId =  activityIconId;
    
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"活  动";
    __weak typeof (self) wSelf = self;
    
    [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:ACTIVITY_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
    
    NSString *url = [NSString stringWithFormat:@"http://121.40.151.183:8080/pula-sys/app/notice/appshow?id=%@",_activityId];
    
    
    [self actionCustomLeftBtnWithNrlImage:@"btnback" htlImage:@"btnback" title:@"" action:^{
        [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:ACTIVITY_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
        
        [wSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    /*后续会修改为分享到微信的图标*/
    /*
    [self actionCustomRightBtnWithNrlImage:@"search" htlImage:@"search" title:@"" action:^{
        SearchVC* vc = [[SearchVC alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [wSelf.navigationController pushViewController:vc animated:YES];
    }];
    */
    
    
    UIWebView* webView = [[UIWebView alloc] initWithFrame:CGRectMake(5,0,mainWidth - 10,mainHeight * 0.6)];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self.view addSubview: webView];
    
    
    
    UIButton *buttonBuy = [[UIButton alloc]initWithFrame:CGRectMake(mainWidth*0.2,(mainHeight * 0.6+5),mainWidth*0.6,mainHeight * 0.12)];
    
    [buttonBuy setImage:[UIImage imageNamed:@"activity_buy"] forState:UIControlStateNormal];
    
    [buttonBuy addTarget:self action:@selector(btnGotoBuyActivity) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview: buttonBuy];
    
    [webView loadRequest:request];
}


- (void)btnGotoBuyActivity
{
    activityBuyVC* vc = [[activityBuyVC alloc] initWithActivityInfo:(NSString *)_activityPrice activityId:(NSString *)_activityId activityNo:(NSString *)_activityNo activityTitle:(NSString *)_activityTitle activityContent:(NSString *)_activityContent activityUpdateTime:(NSString *)_activityUpdateTime activityIconFileId:(NSString *)_activityIconFileId activityIconId:(NSString *)_activityIconId];
    
    
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
