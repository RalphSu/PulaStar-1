//
//  TabMineInfoVC.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/8.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TabMineInfoVC.h"
#import "MineMainInfoTopItem.h"
#import "MineMainInfoMiddleItem.h"
#import "MineMainInfoBottomItem.h"
#import "MineInfoLoginVC.h"
#import "buyCourseDetailTopItem.h"
#import "buyCourseDetailPriceInfoItem.h"
#import "buyCourseDetailPayMethodItem.h"
#import "Constants.h"
#import "MineMainInfoMiddleItem.h"
#import "MineMainInfoBottomItem.h"
#import "loginActionVC.h"
#import "aboutUsVC.h"
#import "MyBasicInfoVC.h"
#import "MyCourseVC.h"
#import "MyActivityVC.h"
#import "MyWorkVC.h"
#import "bookingVC.h"

@interface TabMineInfoVC ()<UITableViewDataSource,UITableViewDelegate,MineMainInfoMiddleItemCellDelegate,MineMainInfoBottomItemCellDelegate>


{
    /*
    NSString *_searchId;
    NSString *_courseNo;
    NSString *_courseName;
    NSString *_coursePrice;
    */
    __block UITableView     *tbView;
    __block UIButton *buyButton;
    
}
@end


@implementation TabMineInfoVC



- (void)viewDidLoad {
    
    [super viewDidLoad];
    

    [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:MYINFO_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
    
    /*
       [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithRenderColor:NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
    */
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"我 的 信 息";
    //__weak typeof (self) wSelf = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didLoginOk) name:userlogined object:nil];
    /*
    [self actionCustomLeftBtnWithNrlImage:@"btnback" htlImage:@"btnback" title:@"" action:^{
        [wSelf.navigationController popViewControllerAnimated:YES];
    }];
    */
    
    tbView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, mainWidth, mainHeight) style:UITableViewStyleGrouped];
    tbView.delegate = self;
    tbView.dataSource = self;
    tbView.backgroundColor = [UIColor whiteColor];
    tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tbView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:tbView];
    
    
}


- (void)getData
{
    __weak typeof (self) wSelf = self;
    [tbView.pullToRefreshView stopAnimating];
    [wSelf hideLoad];
}

- (void)didLoginOk
{
    [tbView reloadData];
}


#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 3)
        return 2;
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL loginStatus = [[[NSUserDefaults standardUserDefaults] objectForKey:UserLoginStatus] boolValue];
    
    if(indexPath.section == 0)
        return 60;
    
    if(loginStatus == TRUE)
      {
        if((indexPath.section == 3)&&(indexPath.row == 1))
        {
            return 60;
        }
        else if((indexPath.section == 3 )&&(indexPath.row == 0))
        {
            return 0;
        }
        else
        {
          return mainWidth/3 + 20;
        }
      }
     else
     {
         if((indexPath.section == 3)&&(indexPath.row == 1))
         {
             return 60;
         }
         else if((indexPath.section == 3 )&&(indexPath.row == 0))
         {
             return 60;
         }
         else
         {
             return 0;
         }
     }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    if((section == 0) ||(section == 3))
    return 15;
    
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if((section == 0) ||(section == 3))
    return 5;
    
    return 5;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL loginStatus = [[[NSUserDefaults standardUserDefaults] objectForKey:UserLoginStatus] boolValue];
    
    if(indexPath.section == 0)
    {
        static NSString *CellIdentifier = @"mineInfoCommonCell1";
        
        MineMainInfoTopItem *cell = (MineMainInfoTopItem*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil)
        {
            cell = [[MineMainInfoTopItem alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        NSString *userName = [[NSUserDefaults standardUserDefaults] objectForKey:UserInfoName];
                              
        if(userName == nil)
           userName = @"未登录";
                              
        [cell setMineNameItem:userName];
        
        return cell;
        
        
    }
    else if(indexPath.section == 1)
    {
        
        if (loginStatus == TRUE) {
            static NSString *CellIdentifier = @"mineInfoCommonCell2";
            MineMainInfoMiddleItem *cell = (MineMainInfoMiddleItem*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
            if(cell == nil)
            {
                cell = [[MineMainInfoMiddleItem alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            
            NSString *imageLeft = @"my_info";
            NSString *imageRight = @"my_course";
            
            [cell setMineInfoImageItem:imageLeft rightImageName:imageRight row:1];
            
            [cell setDelegate:self];
            
            return cell;
        }
        
    }
        
    
    else if (indexPath.section == 2)
    {
        if (loginStatus == TRUE) {
        static NSString *CellIdentifier = @"mineInfoCommonCell3";
        if(indexPath.row == 0)
        {
            
            
            MineMainInfoMiddleItem *cell = (MineMainInfoMiddleItem*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
            if(cell == nil)
            {
                cell = [[MineMainInfoMiddleItem alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            
            
            NSString *imageLeft = @"my_activity";
            NSString *imageRight = @"my_work";
            
            [cell setMineInfoImageItem:imageLeft rightImageName:imageRight row:0];
            [cell setDelegate:self];
            
            return cell;
        }
        
        }
    }
    
    else if (indexPath.section == 3)
    {
        static NSString *CellIdentifier = @"mineInfoCommonCell4";
        BOOL loginStatus = [[[NSUserDefaults standardUserDefaults] objectForKey:UserLoginStatus] boolValue];
        
        if(indexPath.row == 1)
        {
        
           MineMainInfoBottomItem *cell = (MineMainInfoBottomItem*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
           if(cell == nil)
           {
            cell = [[MineMainInfoBottomItem alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
           }
        
           //[cell  setCourseItem:_searchId courseNo:_courseNo courseName:_courseName coursePrice:_coursePrice];
        
            NSString *buttonName = @"关 于 我 们";
        
            [cell MineMainInfoBottomItem:buttonName row:1];
            [cell setDelegate:self];
           //[cell.contentView setBackgroundColor: [UIColor redColor] ];
        
           return cell;
        }
        else if(loginStatus != TRUE)
        {
            MineMainInfoBottomItem *cell = (MineMainInfoBottomItem*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
            if(cell == nil)
            {
                cell = [[MineMainInfoBottomItem alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            
            //[cell  setCourseItem:_searchId courseNo:_courseNo courseName:_courseName coursePrice:_coursePrice];
            
            NSString *buttonName = @"我 要 试 听";
            
            [cell MineMainInfoBottomItem:buttonName row:0];
            [cell setDelegate:self];
            //[cell.contentView setBackgroundColor: [UIColor redColor] ];
            
            return cell;

        }
    }
    
    
    static NSString *CellIdentifier = @"mineInfoCommonCell";
    UITableViewCell *cell =  (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    return cell;
}


 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
 
    if(indexPath.section == 0)
    {
     MineInfoLoginVC *vc = [[MineInfoLoginVC alloc] init];
     vc.hidesBottomBarWhenPushed = YES;
     [self.navigationController pushViewController:vc animated:YES];
    }
     
}


#pragma mark - mine info delegate
- (void)doClickMineInfoTabs:(int)row index:(int)index
{
    if(row == 1)
    {   if(index == 0)
        {
          MyBasicInfoVC* vc = [[MyBasicInfoVC alloc] init];
          vc.hidesBottomBarWhenPushed = YES;
         [self.navigationController pushViewController:vc animated:YES];
        }
        else
        {
            MyCourseVC* vc = [[MyCourseVC alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    }
    else
    {
        if(index == 0)
        {
            MyActivityVC* vc = [[MyActivityVC alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else
        {
            MyWorkVC* vc = [[MyWorkVC alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}



- (void)doClickMineBottomItemTabs:(int)row
{
    if(row == 0)
    {
    
        bookingVC* vc = [[bookingVC alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else
    {
        aboutUsVC* vc = [[aboutUsVC alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
        
    
   }

@end
