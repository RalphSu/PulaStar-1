//
//  AllNoticeView.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/5.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllNoticeView.h"
#import "AllNoticeModel.h"
#import "AllNoticeItemCell.h"

#define pageSize    10

@interface AllNoticeView ()<UITableViewDataSource,UITableViewDelegate>
{
    __weak id<AllNoticeViewDelegate> delegate;
    
    __block UITableView     *tbView;
    __block NSMutableArray  *arrNotice;
    
    __block int       curPage;
    __block int       proType;
    __block int       proSort;
}

@end

@implementation AllNoticeView
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
                sSelf->arrNotice = nil;
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
        sSelf->arrNotice = nil;
    }];
}



#pragma mark - get data
- (void)getDatas:(int)type sort:(int)sort block:(void (^)(void))block
{
    [AllNoticeModel getAllNotice:type sort:sort page:curPage size:pageSize success:^(AFHTTPRequestOperation* operation, NSObject* result){
        [tbView.pullToRefreshView stopAnimating];
        [tbView.infiniteScrollingView stopAnimating];
        
        if(block!=NULL)
            block();
        
        
        NSMutableArray *arrayList = [[NSMutableArray alloc] init];
        NSArray *recordArray = [(NSDictionary*)result objectForKey:@"data"];
        
        
        for (id noticeRecord in recordArray)
        {
            NSString *noticeSub = [(NSDictionary*)noticeRecord objectForKey:@"sub"];
            NSString *noticeImage = [(NSDictionary*)noticeRecord objectForKey:@"fp"];
            
            NSDictionary *noticeItem = [[NSMutableDictionary alloc] initWithObjectsAndKeys:noticeSub,@"noticeSub",noticeImage,@"noticeImage",nil];
            
            
           [arrayList addObject:noticeItem];
        }
        
        
        
        AllNoticeList *noticeGetList = [[AllNoticeList alloc] init];
        noticeGetList.Rows = arrayList;
        noticeGetList.count = [[NSNumber alloc] initWithInteger:[arrayList count]];
        
        NSLog(@"arrayList %@",arrayList);
        
        
        if(!arrNotice)
            arrNotice = [NSMutableArray arrayWithArray:noticeGetList.Rows];
        else
            [arrNotice addObjectsFromArray:noticeGetList.Rows];
        
        
        [tbView reloadData];
        [tbView setShowsInfiniteScrolling:arrNotice.count < [noticeGetList.count intValue]];
        
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
    return arrNotice.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return mainHeight/2.8;
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
    
    static NSString *CellIdentifier = @"allNoticeItemCell";
    AllNoticeItemCell *cell = (AllNoticeItemCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[AllNoticeItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setNoticeItem:[arrNotice objectAtIndex:indexPath.row] type:NoticeCellType_All];
    
    return cell;
}

/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *cousrInfoItem = [arrNotice objectAtIndex:indexPath.row];
    
    NSString *searchIdItem = [cousrInfoItem objectForKey:@"courseId"];
    
    NSString *courseNoItem = [cousrInfoItem objectForKey:@"courseNo" ];
    
    NSString *courseNameItem = [cousrInfoItem objectForKey:@"courseName"];
    
    NSString *coursePriceItem = [cousrInfoItem objectForKey:@"price"];
    
    
    if(delegate)
    {
        [delegate doClickCourse:searchIdItem courseNo:courseNoItem courseName:courseNameItem coursePrice:coursePriceItem];
    }
    
}
*/
@end
