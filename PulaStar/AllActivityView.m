//
//  AllActivityView.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/5.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllActivityView.h"
#import "AllActivityModel.h"
#import "AllActivityItemCell.h"

#define pageSize    10

@interface AllActivityView ()<UITableViewDataSource,UITableViewDelegate>
{
    __weak id<AllActivityViewDelegate> delegate;
    
    __block UITableView     *tbView;
    __block NSMutableArray  *arrActivities;
    
    __block int       curPage;
    __block int       proType;
    __block int       proSort;
}

@end

@implementation AllActivityView
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
        [tbView addPullToRefreshWithActionHandler:^{
            __strong typeof (wSelf) sSelf = wSelf;
            sSelf->curPage = 1;
            [wSelf getDatas:sSelf->proType sort:sSelf->proSort block:^{
                sSelf->arrActivities = nil;
            }];
        }];
        
        [tbView addInfiniteScrollingWithActionHandler:^{
            __strong typeof (wSelf) sSelf = wSelf;
            sSelf->curPage ++;
            [wSelf getDatas:sSelf->proType sort:sSelf->proSort block:nil];
        }];
        
        [tbView.pullToRefreshView setOYStyle];
        [tbView triggerPullToRefresh];
    }
    return self;
}

#pragma mark - set data
- (void)setTypeAndOrder:(int)type sort:(int)sort
{
    proType = type;
    proSort = sort;
    curPage = 1;
    __weak typeof (self) wSelf = self;
    [self getDatas:proType sort:proSort block:^{
        __strong typeof (wSelf) sSelf = wSelf;
        sSelf->arrActivities = nil;
    }];
}



#pragma mark - get data
- (void)getDatas:(int)type sort:(int)sort block:(void (^)(void))block
{
    [AllActivityModel getAllActivity:type sort:sort page:curPage size:pageSize success:^(AFHTTPRequestOperation* operation, NSObject* result){
        [tbView.pullToRefreshView stopAnimating];
        [tbView.infiniteScrollingView stopAnimating];
        if(block!=NULL)
            block();
        
        
        NSMutableArray *arrayList = [[NSMutableArray alloc] init];
        NSArray *recordArray = [(NSDictionary*)result objectForKey:@"records"];
        
        
        for (id activityRecord in recordArray)
        {
            NSString *activityPrice = [(NSDictionary*)activityRecord objectForKey:@"noticePrice"];
            NSString *activityId = [(NSDictionary*)activityRecord objectForKey:@"id"];
            NSString *activityNo = [(NSDictionary*)activityRecord objectForKey:@"no"];
            NSString *activityTitle = [(NSDictionary*)activityRecord objectForKey:@"title"];
            NSString *activityContent = [(NSDictionary*)activityRecord objectForKey:@"content"];
            NSString *activityUpdateTime = [(NSDictionary*)activityRecord objectForKey:@"updateTime"];
            NSDictionary *icon = [(NSDictionary*)activityRecord objectForKey:@"icon"];
            NSString *activityIconFileId = [(NSDictionary*)icon objectForKey:@"fileId"];
            NSString *activityIconId = [(NSDictionary*)icon objectForKey:@"id"];
            
            NSDictionary *activityItem = [[NSMutableDictionary alloc] initWithObjectsAndKeys:activityPrice,@"activityPrice",activityId,@"activityId",activityNo,@"activityNo",activityTitle,@"activityTitle",activityContent,@"activityContent",activityUpdateTime,@"activityUpdateTime",activityIconFileId,@"activityIconFileId",activityIconId,@"activityIconId",nil];
            
            [arrayList addObject:activityItem];
        }
        
        
        
        AllActivityList *activityGetList = [[AllActivityList alloc] init];
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
    AllActivityItemCell *cell = (AllActivityItemCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[AllActivityItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setActivityItem:[arrActivities objectAtIndex:indexPath.row] type:ActivityCellType_All];
    
    return cell;
    
}

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

@end
