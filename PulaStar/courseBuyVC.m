//
//  courseBuyVC.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/4.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "courseBuyVC.h"
#import "buyCourseDetailTopItem.h"
#import "buyCourseDetailPriceInfoItem.h"
#import "buyCourseDetailPayMethodItem.h"

#import "payRequsestHandler.h"
#import "WXApiObject.h"
#import "WXApi.h"


@interface courseBuyVC ()<UITableViewDataSource,UITableViewDelegate>
{
    NSString *_searchId;
    NSString *_courseNo;
    NSString *_courseName;
    NSString *_coursePrice;
    
    __block UITableView     *tbView;
    __block UIButton *buyButton;
    
}
@end


@implementation courseBuyVC


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
    
    self.title = @"购 买 课 程";
    __weak typeof (self) wSelf = self;
    
    [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:COURSE_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
    
    [self actionCustomLeftBtnWithNrlImage:@"btnback" htlImage:@"btnback" title:@"" action:^{
        [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:COURSE_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
        
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
    [buyButton setBackgroundColor:COURSE_NAVBAR_COLOR];
    [buyButton setTitle:@"确 认 支 付" forState:UIControlStateNormal];
    buyButton.layer.cornerRadius = 5;
    
    [buyButton addTarget:self action:@selector(buyCourseAction) forControlEvents:UIControlEventTouchUpInside];
    
    
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
          static NSString *CellIdentifier = @"proCommonCell1";
  
           buyCourseDetailTopItemCell *cell = (buyCourseDetailTopItemCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
           if(cell == nil)
           {
           cell = [[buyCourseDetailTopItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
           }
            
            [cell  setCourseItem:_searchId courseNo:_courseNo courseName:_courseName coursePrice:_coursePrice];
           return cell;

        }
        else if(indexPath.section == 1)
        {
            
            static NSString *CellIdentifier = @"proCommonCell2";
            
            NSLog(@"COURSE PRICE %@",_coursePrice);
            if(indexPath.row == 0)
            {
                buyCourseDetailPriceInfoItem *cell = (buyCourseDetailPriceInfoItem*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
                if(cell == nil)
                {
                    cell = [[buyCourseDetailPriceInfoItem alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                }
                
                [cell  setPriceInfoItem:_coursePrice];
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
            
            static NSString *CellIdentifier = @"proCommonCell3";
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
                cell.textLabel.text = @"亲，请按时参加课程，有疑问咨询普拉星球客服人员，谢谢。";
            }
            
            
            return cell;
        }
        
        static NSString *CellIdentifier = @"productCommoneCell";
        UITableViewCell *cell =  (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        return cell;
    }



#pragma mark - action

- (void)buyCourseAction
{
    
    //创建支付签名对象
    payRequsestHandler *req = [[payRequsestHandler alloc]init];
    //初始化支付签名对象
    [req init:APP_ID mch_id:MCH_ID];
    //设置密钥
    [req setKey:PARTNER_ID];
    
     
     float i = [[NSString stringWithFormat:@"%@",_coursePrice]floatValue];
     
     if(i == 0)
     {
     [self alert:@"抱歉" msg:@"价格为0，无法购买"];
     return;
     }
    
    
    
    //获取到实际调起微信支付的参数后，在app端调起支付
    NSMutableDictionary *dict = [req sendPay_activity:(NSString *)_courseName price:(NSString *)_coursePrice buyItemNo:(NSString *)_courseNo buyItemNum:(NSString*)@"1"];
    
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

