//
//  AllMyActivityView.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/20.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>
#import "AllMyActivityView.h"
#import "AllMyActivityModel.h"
#import "AllMyActivityItemCell.h"

#define pageSize    10

@interface AllMyActivityView ()<UITableViewDataSource,UITableViewDelegate>
{
    __weak id<AllMyActivityViewDelegate> delegate;
    
    __block UITableView     *tbView;
    __block NSMutableArray  *arrActivities;
    
    __block int       curPage;
    __block int       proType;
    __block int       proSort;
}

@end

@implementation AllMyActivityView
@synthesize delegate,proType;

- (id)initWithOrder:(CGRect)frame indexOrder:(int)indexOrder
{
    proSort = indexOrder;
    self = [self initWithFrame:frame];
    if(self)
    {
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        __weak typeof (self) wSelf = self;
        
        self.backgroundColor = [UIColor redColor];
        
        tbView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, mainWidth, frame.size.height) style:UITableViewStyleGrouped];
        tbView.delegate = self;
        tbView.dataSource = self;
        tbView.backgroundColor = [UIColor whiteColor];
        tbView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        tbView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [self addSubview:tbView];
        proType = 0;
        
        NSString* userNo = [[NSUserDefaults standardUserDefaults] objectForKey:UserInfoNo];
        
        [tbView addPullToRefreshWithActionHandler:^{
            __strong typeof (wSelf) sSelf = wSelf;
            sSelf->curPage = 1;
            [wSelf getDatas:userNo block:^{
                sSelf->arrActivities = nil;
            }];
        }];
        
        [tbView addInfiniteScrollingWithActionHandler:^{
            __strong typeof (wSelf) sSelf = wSelf;
            sSelf->curPage ++;
            [wSelf getDatas:userNo block:nil];
        }];
        
        [tbView.pullToRefreshView setOYStyle];
        [tbView triggerPullToRefresh];
    }
    return self;
}

#pragma mark - set data
- (void)setTypeAndOrder:(NSString *)userNo
{

    __weak typeof (self) wSelf = self;
    
    
    [self getDatas:userNo block:^{
        __strong typeof (wSelf) sSelf = wSelf;
        sSelf->arrActivities = nil;
    }];
}



#pragma mark - get data
- (void)getDatas:(NSString*)userNo block:(void (^)(void))block
{
    [AllMyActivityModel getAllMyActivity:(NSString *)userNo success:^(AFHTTPRequestOperation* operation, NSObject* result){
        [tbView.pullToRefreshView stopAnimating];
        [tbView.infiniteScrollingView stopAnimating];
        if(block!=NULL)
            block();
        
        
        NSMutableArray *arrayList = [[NSMutableArray alloc] init];
        NSArray *recordArray = [(NSDictionary*)result objectForKey:@"records"];
        
        
        for (id activityRecord in recordArray)
        {
            NSString *activityPrice = [(NSDictionary*)activityRecord objectForKey:@"noticePrice"];
            
            NSDictionary *notice = [(NSDictionary*)activityRecord objectForKey:@"notice"];
            NSString *activityId = [(NSDictionary*)notice objectForKey:@"id"];
            NSString *activityNo = [(NSDictionary*)notice objectForKey:@"no"];
            NSString *activityTitle = [(NSDictionary*)notice objectForKey:@"title"];
            NSString *activityContent = [(NSDictionary*)notice objectForKey:@"content"];
            NSString *activityUpdateTime = [(NSDictionary*)notice objectForKey:@"updateTime"];
            NSString *activityBuyCount = [(NSDictionary*)activityRecord objectForKey:@"count"];
            NSDictionary *icon = [(NSDictionary*)activityRecord objectForKey:@"icon"];
            NSString *activityIconFileId = [(NSDictionary*)icon objectForKey:@"fileId"];
            NSString *activityIconId = [(NSDictionary*)icon objectForKey:@"id"];
            
            NSDictionary *myActivityItem = [[NSMutableDictionary alloc] initWithObjectsAndKeys:activityPrice,@"activityPrice",activityId,@"activityId",activityNo,@"activityNo",activityTitle,@"activityTitle",activityContent,@"activityContent",activityUpdateTime,@"activityUpdateTime",activityIconFileId,@"activityIconFileId",activityIconId,@"activityIconId",activityBuyCount,@"activityBuyCount",nil];
            
            [arrayList addObject:myActivityItem];
        }
        
        
        
        AllMyActivityList *activityGetList = [[AllMyActivityList alloc] init];
        activityGetList.Rows = arrayList;
        activityGetList.count = [[NSNumber alloc] initWithInteger:[arrayList count]];
        
        
        
        if(!arrActivities)
            arrActivities = [NSMutableArray arrayWithArray:activityGetList.Rows];
        else
            [arrActivities addObjectsFromArray:activityGetList.Rows];
        
        
        [tbView reloadData];
        [tbView setShowsInfiniteScrolling:arrActivities.count < [activityGetList.count intValue]];
    }   failure:^(NSError* error){
        [tbView.pullToRefreshView stopAnimating];
        [tbView.infiniteScrollingView stopAnimating];
        //[[XBToastManager ShardInstance] showtoast:[NSString stringWithFormat:@"获取商品数据异常:%@",error]];
    }];
}

#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrActivities.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
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
    
    static NSString *CellIdentifier = @"allActItemCell";
    AllMyActivityItemCell *cell = (AllMyActivityItemCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[AllMyActivityItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setMyActivityItem:[arrActivities objectAtIndex:indexPath.row] type:ActivityCellType_All];
    
    return cell;
    
}

/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *activityInfoItem = [arrActivities objectAtIndex:indexPath.row];
    
    NSString *activityPrice = [activityInfoItem objectForKey:@"activityPrice"];
    
    NSString *activityId = [activityInfoItem objectForKey:@"activityId" ];
    
    NSString *activityNo = [activityInfoItem objectForKey:@"activityNo"];
    
    NSString *activityTitle = [activityInfoItem objectForKey:@"activityTitle"];
    
    
    NSString *activityContent = [activityInfoItem objectForKey:@"activityContent"];
    
    NSString *activityUpdateTime = [activityInfoItem objectForKey:@"activityUpdateTime" ];
    
    NSString *activityIconFileId = [activityInfoItem objectForKey:@"activityIconFileId"];
    
    NSString *activityIconId = [activityInfoItem objectForKey:@"activityIconId"];
    
    
    
    if(delegate)
    {
        [delegate doClickActivity:activityPrice activityId:activityId activityNo:activityNo activityTitle:activityTitle activityContent:activityContent activityUpdateTime:activityUpdateTime activityIconFileId:activityIconFileId activityIconId: activityIconId];
    }
    
}
*/
@end