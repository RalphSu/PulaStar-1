//
//  courseDetailVC.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/2.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "courseDetailVC.h"
#import "courseBuyVC.h"
#import "KShareViewManage.h"

@interface courseDetailVC ()<UITableViewDelegate>
{
    NSString *_searchId;
    NSString *_courseNo;
    NSString *_courseName;
    NSString *_coursePrice;
}
@end


@implementation courseDetailVC


- (id)initWithCourseInfo:(NSString *)searchId courseNo:(NSString *)courseNo courseName:(NSString *)courseName coursePrice:(NSString *)coursePrice
{
    self = [super init];
    if(self)
    {
        _searchId = searchId;
        _courseNo = courseNo;
        _courseName =  courseName;
        _coursePrice =  coursePrice;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"课 程";
    __weak typeof (self) wSelf = self;
    
    [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:COURSE_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
    
    
    NSString *url = [NSString stringWithFormat:@"http://121.40.151.183:8080/pula-sys/app/timecourse/appshow?id=%@&no=%@&&color=%@",_searchId,_courseNo,@"ff7f00"];

    
    [self actionCustomLeftBtnWithNrlImage:@"btnback" htlImage:@"btnback" title:@"" action:^{
        [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:COURSE_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
        
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
    
    NSArray * array = [KShareViewManage getShareListWithType:SharedType_WeChatCircel, SharedType_WeChatFriend, nil];
    
    [self actionCustomRightBtnWithNrlImage:@"share" htlImage:@"share" title:@"" action:^{
        
     
        [KShareViewManage showViewToShareNews:[NSString stringWithFormat:@"%@课程",_courseName]
                                      Content:@"普拉星球 少儿艺术创造力研发中心"
                                        Image:[UIImage imageNamed:@"pulalogo"]
                                          Url:[NSString stringWithFormat:@"http://121.40.151.183:8080/pula-sys/app/timecourse/appshow?id=%@&no=%@&color=%@&showappstore=true",_searchId,_courseNo,@"ff7f00"]
                                     platform:array
                             inViewController:self];
        
    }];
    
    
    

    UIWebView* webView = [[UIWebView alloc] initWithFrame:CGRectMake(5,0,mainWidth - 10,mainHeight * 0.6)];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self.view addSubview: webView];
    

 
    UIButton *buttonBuy = [[UIButton alloc]initWithFrame:CGRectMake(mainWidth*0.2,(mainHeight * 0.6+5),mainWidth*0.6,mainHeight * 0.12)];
    
    [buttonBuy setImage:[UIImage imageNamed:@"course_buy"] forState:UIControlStateNormal];
    
    [buttonBuy addTarget:self action:@selector(btnGotoBuyCourse) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview: buttonBuy];
    
    [webView loadRequest:request];
}


- (void)btnGotoBuyCourse
{
    courseBuyVC* vc = [[courseBuyVC alloc] initWithCourseInfo:(NSString *)_searchId courseNo:(NSString *)_courseNo courseName:(NSString *)_courseName coursePrice:(NSString *)_coursePrice];
    
   
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];

}

@end
