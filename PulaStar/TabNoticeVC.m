//
//  TabNoticeVC.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/5.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TabNoticeVC.h"
#import "AllNoticeView.h"

typedef enum
{
    TbViewType_Type = 0,
    TbViewType_Order = 1
}TbViewType;

@interface TabNoticeVC ()<UITableViewDataSource,UITableViewDelegate,AllNoticeViewDelegate>
{
    
    AllNoticeView      *allNoticeView;
    
    UITableView     *tbViewType;
    
    TbViewType      tbType;
    
    NSArray         *arrOfType;
    NSArray         *arrOfTypeImage;
    NSArray         *arrOfOrder;
    NSArray         *arrOfOrderFlag;
    NSInteger       indexType;
    NSInteger       indexOrder;
}
@end

@implementation TabNoticeVC

- (id)init
{
    self = [super init];
    /*
    if(self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showNewPro:) name:kDidShowNewPro object:nil];
    }
     */
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通　 告";
    [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:NOTIFY_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imgLine1 = [[UIImageView alloc] initWithFrame:CGRectMake(mainWidth / 2 + 0.5, 0, 0.5, 43.5)];
    imgLine1.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    [self.view addSubview:imgLine1];
    
    UIImageView *imgLine2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 43.5, mainWidth, 0.5)];
    imgLine2.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    [self.view addSubview:imgLine2];
    
    tbViewType = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tbViewType.delegate = self;
    tbViewType.dataSource = self;
    tbViewType.backgroundColor = [UIColor whiteColor];
    tbViewType.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tbViewType.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    tbType = TbViewType_Type;
    
    allNoticeView = [[AllNoticeView alloc] initWithOrder:CGRectMake(0, 0, mainWidth, self.view.bounds.size.height) indexOrder:[[arrOfOrderFlag objectAtIndex:indexOrder] intValue]];
    allNoticeView.delegate = self;
    allNoticeView.proType = [[[arrOfTypeImage objectAtIndex:0] stringByReplacingOccurrencesOfString:@"sort" withString:@""] intValue];
    [self.view addSubview:allNoticeView];
}
/*
-(void)doClickCourse:(NSString*)searchId courseNo:(NSString*)courseNo courseName:(NSString*)courseName coursePrice:(NSString*)coursePrice;
{
    courseDetailVC* vc = [[courseDetailVC alloc] initWithCourseInfo:searchId courseNo:courseNo courseName:courseName coursePrice:coursePrice];
    
    
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
*/

#pragma mark - notify
/*
- (void)showNewPro:(NSNotification*)obj
{
    indexOrder = [obj.object intValue];
    
    if(allNoticeView)
        [allNoticeView setTypeAndOrder:[[[arrOfTypeImage objectAtIndex:indexType] stringByReplacingOccurrencesOfString:@"sort" withString:@""] intValue] sort:[[arrOfOrderFlag objectAtIndex:indexOrder] intValue]];
}
*/

#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tbType == TbViewType_Type ? arrOfType.count : arrOfOrder.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return mainHeight/2.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
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
    
    [allNoticeView setTypeAndOrder:[[[arrOfTypeImage objectAtIndex:indexType] stringByReplacingOccurrencesOfString:@"sort" withString:@""] intValue] sort:[[arrOfOrderFlag objectAtIndex:indexOrder] intValue]];
}
@end
