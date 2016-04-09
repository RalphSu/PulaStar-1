//
//  MyWorkVC.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/20.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyWorkVC.h"
#import "AllMyWorkView.h"
#import "MyCourseVC.h"
#import "AllMyWorkItemCell.h"
#import "MyWorkDetailVC.h"

@interface MyWorkVC ()<UITableViewDataSource,UITableViewDelegate,AllMyWorkViewDelegate>

{
    AllMyWorkView      *allMyWorkView;
    __block UITableView     *tbViewType;
    __block NSArray         *arrOfType;
    __block NSArray         *arrOfTypeImage;
    __block NSArray         *arrOfOrder;
    __block NSArray         *arrOfOrderFlag;
    __block NSInteger       indexType;
    __block NSInteger       indexOrder;
}
@end

@implementation MyWorkVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我 的 作 品";
    self.view.backgroundColor = [UIColor whiteColor];
     __weak typeof (self) wSelf = self;
    
    [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:MYWORK_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
    
    
    [self actionCustomLeftBtnWithNrlImage:@"btnback" htlImage:@"btnback" title:@"" action:^{
        [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:MYINFO_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
        
        [wSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    UILabel *myActivityChn = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, mainWidth/3, 25)];
    
    myActivityChn.adjustsFontSizeToFitWidth = YES;
    myActivityChn.text = @"我的作品";
    myActivityChn.font = [UIFont boldSystemFontOfSize:25];
    //basicInfoChn.textAlignment = NSTextAlignmentCenter;
    
    myActivityChn.textColor = [UIColor hexFloatColor:@"EE7600"];
    
    [self.view addSubview:myActivityChn];
    
    UILabel *myActivityEng = [[UILabel alloc] initWithFrame:CGRectMake(mainWidth/3, 10, mainWidth/3, 25)];
    
    myActivityEng.adjustsFontSizeToFitWidth = YES;
    myActivityEng.text = @"My Work";
    myActivityEng.textAlignment = NSTextAlignmentCenter;
    myActivityEng.font = [UIFont boldSystemFontOfSize:25];
    //label5.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    myActivityEng.textColor = [UIColor whiteColor];
    myActivityEng.backgroundColor = [UIColor hexFloatColor:@"EE7600"];
    
    [self.view addSubview:myActivityEng];
    
    tbViewType = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tbViewType.delegate = self;
    tbViewType.dataSource = self;
    tbViewType.backgroundColor = [UIColor whiteColor];
    tbViewType.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tbViewType.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    allMyWorkView = [[AllMyWorkView alloc] initWithFrame:CGRectMake(0, 0, mainWidth, self.view.bounds.size.height - 110)];
    allMyWorkView.delegate = self;
    
    [self.view addSubview:allMyWorkView];
    
}



-(void)doClickWork:(NSString*)workEffectDate workId:(NSString*)workId workRate:(NSString*)workRate workNo:(NSString*)workNo workCourseNo:(NSString*)workCourseNo workBranchNo:(NSString *)workBranchNo workComments:(NSString *)workComments workIconId:(NSString *)workIconId  workIconFileId:(NSString *)workIconFileId workIconName:(NSString*)workIconName
{
    
    MyWorkDetailVC* vc = [[MyWorkDetailVC alloc] initWithWorkInfo:(NSString*)workEffectDate workId:(NSString*)workId workRate:(NSString*)workRate workNo:(NSString*)workNo workCourseNo:(NSString*)workCourseNo workBranchNo:(NSString *)workBranchNo workComments:(NSString *)workComments workIconId:(NSString *)workIconId  workIconFileId:(NSString *)workIconFileId workIconName:(NSString*)workIconName];
    
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell =  nil;
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] init];
    }
    /*
    cell.textLabel.text = tbType == TbViewType_Type ? [NSString stringWithFormat:@"        %@", [arrOfType objectAtIndex:indexPath.row]] : [arrOfOrder objectAtIndex:indexPath.row];
    if(tbType == TbViewType_Type)
    {
        NSString* name = [arrOfTypeImage objectAtIndex:indexPath.row];
        if(indexPath.row == indexType)
        {
            name = [NSString stringWithFormat:@"%@_checked",name];
            cell.textLabel.textColor = mainColor;
            
            UIImageView* imgOK = [[UIImageView alloc] initWithFrame:CGRectMake(mainWidth - 32, 14, 20, 16)];
            imgOK.image = [UIImage imageNamed:@"screening_select"];
            [cell addSubview:imgOK];
        }
        else
        {
            name = [NSString stringWithFormat:@"%@_normal",name];
        }
        UIImageView* img = [[UIImageView alloc] initWithFrame:CGRectMake(16, 10, 24, 24)];
        img.image = [UIImage imageNamed:name];
        [cell addSubview:img];
    }
    else
    {
        if(indexPath.row == indexOrder)
        {
            cell.textLabel.textColor = mainColor;
            
            UIImageView* imgOK = [[UIImageView alloc] initWithFrame:CGRectMake(mainWidth - 32, 14, 20, 16)];
            imgOK.image = [UIImage imageNamed:@"screening_select"];
            [cell addSubview:imgOK];
        }
    } */
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [tbViewType reloadData];
    /*
    [allActivityView setTypeAndOrder:[[[arrOfTypeImage objectAtIndex:indexType] stringByReplacingOccurrencesOfString:@"sort" withString:@""] intValue] sort:[[arrOfOrderFlag objectAtIndex:indexOrder] intValue]];
     */
}





@end
