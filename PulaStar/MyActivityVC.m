//
//  MyActivityVC.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/20.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyActivityVC.h"
#import "AllMyActivityView.h"

@interface MyActivityVC ()<UITableViewDataSource,UITableViewDelegate,AllMyActivityViewDelegate>
{
    AllMyActivityView      *allActivityView;
    UITableView     *tbViewType;
    NSArray         *arrOfType;
    NSArray         *arrOfTypeImage;
    NSArray         *arrOfOrder;
    NSArray         *arrOfOrderFlag;
    NSInteger       indexType;
    NSInteger       indexOrder;
}
@end

@implementation MyActivityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我 的 活 动";
    
    [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:MYACTIVITY_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
    
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof (self) wSelf = self;
    
    [self actionCustomLeftBtnWithNrlImage:@"btnback" htlImage:@"btnback" title:@"" action:^{
        [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:MYINFO_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
        
        [wSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    UILabel *myActivityChn = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, mainWidth/3, 25)];
    
    myActivityChn.adjustsFontSizeToFitWidth = YES;
    myActivityChn.text = @"我的活动";
    myActivityChn.font = [UIFont boldSystemFontOfSize:25];
    //basicInfoChn.textAlignment = NSTextAlignmentCenter;
    
    myActivityChn.textColor = [UIColor hexFloatColor:@"EE7600"];
    
    [self.view addSubview:myActivityChn];
    
    UILabel *myActivityEng = [[UILabel alloc] initWithFrame:CGRectMake(mainWidth/3, 10, mainWidth/3, 25)];
    
    myActivityEng.adjustsFontSizeToFitWidth = YES;
    myActivityEng.text = @"My Activity";
    myActivityEng.textAlignment = NSTextAlignmentCenter;
    myActivityEng.font = [UIFont boldSystemFontOfSize:25];
    //label5.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    myActivityEng.textColor = [UIColor whiteColor];
    myActivityEng.backgroundColor = [UIColor hexFloatColor:@"EE7600"];
    
    [self.view addSubview:myActivityEng];

    /*
    UIImageView *imgLine1 = [[UIImageView alloc] initWithFrame:CGRectMake(mainWidth / 2 + 0.5, 0, 0.5, 43.5)];
    imgLine1.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    [self.view addSubview:imgLine1];
    
    UIImageView *imgLine2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 43.5, mainWidth, 0.5)];
    imgLine2.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    [self.view addSubview:imgLine2];
    */
    
    tbViewType = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tbViewType.delegate = self;
    tbViewType.dataSource = self;
    tbViewType.backgroundColor = [UIColor whiteColor];
    tbViewType.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tbViewType.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    
    allActivityView = [[AllMyActivityView alloc] initWithOrder:CGRectMake(0, 40, mainWidth, self.view.bounds.size.height - 110) indexOrder:[[arrOfOrderFlag objectAtIndex:indexOrder] intValue]];
    allActivityView.delegate = self;
    allActivityView.proType = [[[arrOfTypeImage objectAtIndex:0] stringByReplacingOccurrencesOfString:@"sort" withString:@""] intValue];
    [self.view addSubview:allActivityView];
    
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
    return 0.1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell =  nil;
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] init];
    }
        return cell;
}

/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [tbViewType reloadData];
    
    [allActivityView setTypeAndOrder:[[[arrOfTypeImage objectAtIndex:indexType] stringByReplacingOccurrencesOfString:@"sort" withString:@""] intValue] sort:[[arrOfOrderFlag objectAtIndex:indexOrder] intValue]];
}
 */
@end
