//
//  activityBuyVC.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/5.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "activityBuyVC.h"
#import "buyActivityDetailTopItem.h"
#import "buyActivityDetailPriceInfoItem.h"
#import "buyCourseDetailPayMethodItem.h"

#import "payRequsestHandler.h"
#import "WXApiObject.h"
#import "WXApi.h"



@interface activityBuyVC ()<UITableViewDataSource,UITableViewDelegate>
{
    
    NSString *_activityPrice;
    NSString *_activityId;
    NSString *_activityNo;
    NSString *_activityTitle;
    NSString *_activityContent;
    NSString *_activityUpdateTime;
    NSString *_activityIconFileId;
    NSString *_activityIconId;
    
    __block UITableView     *tbView;
    __block UIButton *buyButton;
    
}
@end


@implementation activityBuyVC


- (id)initWithActivityInfo:(NSString *)activityPrice activityId:(NSString *)activityId activityNo:(NSString *)activityNo activityTitle:(NSString *)activityTitle activityContent:(NSString *)activityContent activityUpdateTime:(NSString *)activityUpdateTime activityIconFileId:(NSString *)activityIconFileId
            activityIconId:(NSString *)activityIconId;
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
    
    self.title = @"购 买 活 动";
    __weak typeof (self) wSelf = self;
    
    [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:ACTIVITY_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
    
    
    [self actionCustomLeftBtnWithNrlImage:@"btnback" htlImage:@"btnback" title:@"" action:^{
        [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:ACTIVITY_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
        
        [wSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    [WXApi registerApp:APP_ID withDescription:@"PulaStar"];
    
    tbView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, mainWidth, 370) style:UITableViewStyleGrouped];
    tbView.delegate = self;
    tbView.dataSource = self;
    tbView.backgroundColor = [UIColor hexFloatColor:@"f8f8f8"];
    tbView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tbView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:tbView];
    
    buyButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 360, mainWidth - 40, 40)];
    
    //UIButton* btnCalc = [[UIButton alloc] initWithFrame:CGRectMake(mainWidth - 70, 7, 60, 30)];
    [buyButton setBackgroundColor:ACTIVITY_NAVBAR_COLOR];
    [buyButton setTitle:@"确 认 支 付" forState:UIControlStateNormal];
    buyButton.layer.cornerRadius = 5;
    
    [buyButton addTarget:self action:@selector(buyActivityAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:buyButton];
    
}


- (void)getData
{
    __weak typeof (self) wSelf = self;
    [tbView.pullToRefreshView stopAnimating];
    [wSelf hideLoad];
}


#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if(section == 0)
    {
        return 1;
    }
    
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 0)
        return 80;
    
    if(indexPath.row == 0)
        return 40;
    
    if(indexPath.row == 1)
        return 60;
    
    return 50;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0)
        return 0.1;
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if(indexPath.section == 0)
    {
        
        
        static NSString *CellIdentifier = @"actCommonCell1";
        
        
        buyActivityDetailTopItemCell *cell = (buyActivityDetailTopItemCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil)
        {
            cell = [[buyActivityDetailTopItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        
        [cell setActivityItem:(NSString*)_activityPrice activityId:(NSString*)_activityId activityNo:(NSString*)_activityNo activityTitle:(NSString*)_activityTitle activityContent:(NSString*)_activityContent activityUpdateTime:(NSString*)_activityUpdateTime activityIconFileId:(NSString*)_activityIconFileId activityIconId: (NSString*)_activityIconId];

        
        return cell;
        
        
    }
    else if(indexPath.section == 1)
    {
        
        static NSString *CellIdentifier = @"actCommonCell2";
        
        NSLog(@"act PRICE %@",_activityPrice);
        if(indexPath.row == 0)
        {
            buyActivityDetailPriceInfoItem *cell = (buyActivityDetailPriceInfoItem*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
            if(cell == nil)
            {
                cell = [[buyActivityDetailPriceInfoItem alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            
            [cell  setPriceInfoItem:_activityPrice];
            return cell;
            
            
        }
        else if (indexPath.row == 1)
        {
            
            buyCourseDetailPayMethodItem *cell =  (buyCourseDetailPayMethodItem*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
            if(cell == nil)
            {
                cell = [[buyCourseDetailPayMethodItem alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            
            return cell;
        }
        
        
        //return cell;
    }
    else if (indexPath.section == 2)
    {
        
        static NSString *CellIdentifier = @"actCommonCell3";
        UITableViewCell *cell =  (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        if(indexPath.row == 0)
        {
            cell.textLabel.text = @"温馨提示";
            cell.textLabel.textColor = [UIColor redColor];
            
        }
        else if (indexPath.row == 1)
        {
            cell.textLabel.textColor = [UIColor grayColor];
            cell.textLabel.numberOfLines = 2;
            cell.textLabel.text = @"亲，请按时参加活动，有疑问咨询普拉星球客服人员，谢谢。";
        }
        
        
        return cell;
    }
    
    static NSString *CellIdentifier = @"actCommoneCell";
    UITableViewCell *cell =  (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    return cell;
}


#pragma mark - action

- (void)buyActivityAction
{
    
    //创建支付签名对象
    payRequsestHandler *req = [[payRequsestHandler alloc]init];
    //初始化支付签名对象
    [req init:APP_ID mch_id:MCH_ID];
    //设置密钥
    [req setKey:PARTNER_ID];
    
    
    
    float i = [[NSString stringWithFormat:@"%@",_activityPrice]floatValue];
    
    if(i == 0)
    {
       [self alert:@"抱歉" msg:@"价格为0，无法购买"];
        return;
    }
    
    
    
    //获取到实际调起微信支付的参数后，在app端调起支付
    NSMutableDictionary *dict = [req sendPay_activity:(NSString *)_activityTitle price:(NSString *)_activityPrice  buyItemNo:(NSString *)_activityNo buyItemNum:(NSString*)@"1" type:(NSString *)@"activity"];
   
    if(dict == nil){
        //错误提示
        NSString *debug = [req getDebugifo];
        
        [self alert:@"提示信息" msg:debug];
        
        NSLog(@"%@\n\n",debug);
    }else{
        NSLog(@"%@\n\n",[req getDebugifo]);
        //[self alert:@"确认" msg:@"下单成功，点击OK后调起支付！"];
        
        NSMutableString *stamp  = [dict objectForKey:@"timestamp"];
        
        //调起微信支付
        PayReq* req             = [[PayReq alloc] init];
        
        req.openID              = [dict objectForKey:@"appid"];
        req.partnerId           = [dict objectForKey:@"partnerid"];
        req.prepayId            = [dict objectForKey:@"prepayid"];
        req.nonceStr            = [dict objectForKey:@"noncestr"];
        req.timeStamp           = stamp.intValue;
        req.package             = [dict objectForKey:@"package"];
        req.sign                = [dict objectForKey:@"sign"];
        
        [WXApi sendReq:req];
    }

        
}

//客户端提示信息
- (void)alert:(NSString *)title msg:(NSString *)msg
{
    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alter show];
    
}



@end

