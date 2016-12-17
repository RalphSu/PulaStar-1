//
//  AllMyWorkView.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/20.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllMyWorkView.h"
#import "AllMyWorkModel.h"
#import "AllMyWorkItemCell.h"
#import "MyCourseVC.h"

@interface AllMyWorkView ()<UITableViewDataSource,UITableViewDelegate,AllMyWorkItemCellDelegate>
{
    __weak id<AllMyWorkViewDelegate> delegate;
    
    __block UITableView     *tbView;
    __block NSMutableArray  *arrActivities;
    
    __block int       curPage;
    __block int       proType;
    __block int       proSort;
}

@end

@implementation AllMyWorkView
@synthesize delegate;


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
/*
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
*/


#pragma mark - get data
- (void)getDatas:(NSString *)userNo block:(void (^)(void))block
{
    [AllMyWorkModel getAllMyWork:(NSString *)userNo success:^(AFHTTPRequestOperation* operation, NSObject* result){
        [tbView.pullToRefreshView stopAnimating];
        [tbView.infiniteScrollingView stopAnimating];
        if(block!=NULL)
            block();
        
        
        NSMutableArray *arrayList = [[NSMutableArray alloc] init];
        NSArray *recordArray = [(NSDictionary*)result objectForKey:@"records"];
        
        
        for (id workRecord in recordArray)
        {
            NSString *workEffectDate = [(NSDictionary*)workRecord objectForKey:@"workEffectDate"];
            NSString *workId = [(NSDictionary*)workRecord objectForKey:@"id"];
            NSString *workRate = [(NSDictionary*)workRecord objectForKey:@"rate"];
            NSString *workNo = [(NSDictionary*)workRecord objectForKey:@"no"];
            NSString *workCourseNo = [(NSDictionary*)workRecord objectForKey:@"courseNo"];
            NSString *workBranchNo = [(NSDictionary*)workRecord objectForKey:@"branchNo"];
            NSString *workComments = [(NSDictionary*)workRecord objectForKey:@"comments"];
            NSDictionary *icon = [(NSDictionary*)workRecord objectForKey:@"icon"];
            NSString *workIconFileId = [(NSDictionary*)icon objectForKey:@"fileId"];
            NSString *workIconId = [(NSDictionary*)icon objectForKey:@"id"];
            NSString *workIconName = [(NSDictionary*)icon objectForKey:@"name"];
            
            NSDictionary *workGetItem = [[NSMutableDictionary alloc] initWithObjectsAndKeys:workEffectDate,@"workEffectDate",workId,@"workId",workRate,@"workRate",workNo,@"workNo",workCourseNo,@"workCourseNo",workBranchNo,@"workBranchNo",workComments,@"workComments",workIconFileId,@"workIconFileId",workIconId,@"workIconId",workIconName,@"workIconName",nil];
           
            
            [arrayList addObject:workGetItem];
        }


        AllMyWorkList *myWorkGetList = [[AllMyWorkList alloc] init];
        myWorkGetList.Rows = arrayList;
        myWorkGetList.count = [[NSNumber alloc] initWithInteger:[arrayList count]];
        
        
        if(!arrActivities)
            arrActivities = [NSMutableArray arrayWithArray:myWorkGetList.Rows];
        else
            [arrActivities addObjectsFromArray:myWorkGetList.Rows];
        
        
        [tbView reloadData];
        [tbView setShowsInfiniteScrolling:arrActivities.count < [myWorkGetList.count intValue]];
    }   failure:^(NSError* error){
        [tbView.pullToRefreshView stopAnimating];
        [tbView.infiniteScrollingView stopAnimating];
        [[XBToastManager ShardInstance] showtoast:[NSString stringWithFormat:@"获取作品异常，请检查网络"]];
    }];
}

#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (arrActivities.count + 1)/2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return mainHeight/4 + 40;
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
    
    AllMyWorkItemCell *cell = (AllMyWorkItemCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell = [[AllMyWorkItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //indexPath.row*2
    if(arrActivities.count < ((indexPath.row + 1)*2))
    
    {
        [cell setMyWorkItem:[arrActivities objectAtIndex:(indexPath.row *2)] workItem:nil current_row:(int)indexPath.row ];
    }
    else
   
    {
     [cell setMyWorkItem:[arrActivities objectAtIndex:(indexPath.row *2)] workItem:[arrActivities objectAtIndex:(indexPath.row*2 + 1)]
             current_row:(int)indexPath.row];
    }
    
    cell.delegate = self;
    
    return cell;
    
}
/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *workInfoItem = [arrActivities objectAtIndex:indexPath.row];
    
    NSString *workEffectDate = [workInfoItem objectForKey:@"workEffectDate"];

    NSString *workId = [workInfoItem objectForKey:@"workId"];
    
    NSString *workRate = [workInfoItem objectForKey:@"workRate" ];
    
    NSString *workNo = [workInfoItem objectForKey:@"workNo"];
    
    NSString *workCourseNo = [workInfoItem objectForKey:@"workCourseNo"];
    
    
    NSString *workBranchNo = [workInfoItem objectForKey:@"workBranchNo"];
    
    NSString *workComments = [workInfoItem objectForKey:@"workComments" ];
    
    NSString *workIconId = [workInfoItem objectForKey:@"workIconId"];
    
    NSString *workIconField = [workInfoItem objectForKey:@"workIconField"];
    
    NSString *workIconName = [workInfoItem objectForKey:@"workIconName"];
    
    
    if(delegate)
    {
      [delegate doClickWork:(NSString*)workEffectDate workId:(NSString*)workId workRate:(NSString*)workRate workNo:(NSString*)workNo workCourseNo:(NSString*)workCourseNo workBranchNo:(NSString *)workBranchNo workComments:(NSString *)workComments workIconId:(NSString *)workIconId  workIconField:(NSString *)workIconField workIconName:(NSString*)workIconName];
    }
    
}
*/

#pragma mark - my work delegate
-(void)doClickMyWorkTabs:(int)row index:(int)index
{
    
    NSDictionary *workInfoItem = [arrActivities objectAtIndex:(row *2 + index)];
    
    if(workInfoItem == nil)
        return;
    
    NSString *workEffectDate = [workInfoItem objectForKey:@"workEffectDate"];
    
    NSString *workId = [workInfoItem objectForKey:@"workId"];
    
    NSString *workRate = [workInfoItem objectForKey:@"workRate" ];
    
    NSString *workNo = [workInfoItem objectForKey:@"workNo"];
    
    NSString *workCourseNo = [workInfoItem objectForKey:@"workCourseNo"];
    
    
    NSString *workBranchNo = [workInfoItem objectForKey:@"workBranchNo"];
    
    NSString *workComments = [workInfoItem objectForKey:@"workComments" ];
    
    NSString *workIconId = [workInfoItem objectForKey:@"workIconId"];
    
    NSString *workIconFileId = [workInfoItem objectForKey:@"workIconFileId"];
    
    NSString *workIconName = [workInfoItem objectForKey:@"workIconName"];
    
    if(delegate)
    {
        [delegate doClickWork:(NSString*)workEffectDate workId:(NSString*)workId workRate:(NSString*)workRate workNo:(NSString*)workNo workCourseNo:(NSString*)workCourseNo workBranchNo:(NSString *)workBranchNo workComments:(NSString *)workComments workIconId:(NSString *)workIconId  workIconFileId:(NSString *)workIconFileId workIconName:(NSString*)workIconName];
    }
    
    
    /*
     if(row == 1)
     {   if(index == 0)
     {
     MyCourseVC* vc = [[MyCourseVC alloc] init];
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
     MyCourseVC* vc = [[MyCourseVC alloc] init];
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
     */
}



@end
