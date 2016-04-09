//
//  AllCourseView.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/2.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllCourseView.h"
#import "AllCourseModel.h"
#import "AllCourseItemCell.h"

#define pageSize    10

@interface AllCourseView ()<UITableViewDataSource,UITableViewDelegate>
{
    __weak id<AllCourseViewDelegate> delegate;
    
    __block UITableView     *tbView;
    __block NSMutableArray  *arrCourses;
    
    __block int       curPage;
    __block int       proType;
    __block int       proSort;
}

@end

@implementation AllCourseView
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
                sSelf->arrCourses = nil;
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
        sSelf->arrCourses = nil;
    }];
}



#pragma mark - get data
- (void)getDatas:(int)type sort:(int)sort block:(void (^)(void))block
{
    [AllCourseModel getAllCourse:type sort:sort page:curPage size:pageSize success:^(AFHTTPRequestOperation* operation, NSObject* result){
        [tbView.pullToRefreshView stopAnimating];
        [tbView.infiniteScrollingView stopAnimating];
        if(block!=NULL)
            block();
        

        NSMutableArray *arrayList = [[NSMutableArray alloc] init];
        NSArray *recordArray = [(NSDictionary*)result objectForKey:@"records"];
        
        
        for (id courseRecord in recordArray)
        {
            NSString *courseId = [(NSDictionary*)courseRecord objectForKey:@"id"];
            NSString *courseNo = [(NSDictionary*)courseRecord objectForKey:@"no"];
            NSString *courseName = [(NSDictionary*)courseRecord objectForKey:@"name"];
            NSString *branchName = [(NSDictionary*)courseRecord objectForKey:@"branchName"];
            
            NSString *classRoomName = [(NSDictionary*)courseRecord objectForKey:@"classRoomName"];
            NSString *durationMinute = [(NSDictionary*)courseRecord objectForKey:@"durationMinute"];
            NSString *endTime = [(NSDictionary*)courseRecord objectForKey:@"endTime"];
            NSString *startTime = [(NSDictionary*)courseRecord objectForKey:@"startTime"];
            
            NSString *maxStudentNum = [(NSDictionary*)courseRecord objectForKey:@"maxStudentNum"];
            NSString *price = [(NSDictionary*)courseRecord objectForKey:@"price"];
            
            NSString *startHour = [(NSDictionary*)courseRecord objectForKey:@"startHour"];
            NSString *startMinute = [(NSDictionary*)courseRecord objectForKey:@"startMinute"];
            NSDictionary *icon = [(NSDictionary*)courseRecord objectForKey:@"icon"];
            NSString *fileId = [(NSDictionary*)icon objectForKey:@"fileId"];
            NSString *iconId = [(NSDictionary*)icon objectForKey:@"id"];
            
            NSDictionary *courseItem = [[NSMutableDictionary alloc] initWithObjectsAndKeys:courseId,@"courseId",courseNo,@"courseNo",courseName,@"courseName",branchName,@"branchName",classRoomName,@"classRoomName",durationMinute,@"durationMinute",endTime,@"endTime",startTime,@"startTime",maxStudentNum,@"maxStudentNum",price,@"price",startHour,@"startHour",startMinute,@"startMinute",fileId,@"fileId",iconId,@"iconId",nil];

            
            [arrayList addObject:courseItem];
        }
        
        
        
        AllCourseList *courseGetList = [[AllCourseList alloc] init];
        courseGetList.Rows = arrayList;
        courseGetList.count = [[NSNumber alloc] initWithInteger:[arrayList count]];
        
        
        
        if(!arrCourses)
            arrCourses = [NSMutableArray arrayWithArray:courseGetList.Rows];
        else
            [arrCourses addObjectsFromArray:courseGetList.Rows];
        
        
        [tbView reloadData];
        [tbView setShowsInfiniteScrolling:arrCourses.count < [courseGetList.count intValue]];
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
    return arrCourses.count;
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

    static NSString *CellIdentifier = @"allCourseItemCell";
    AllCourseItemCell *cell = (AllCourseItemCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[AllCourseItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setCourseItem:[arrCourses objectAtIndex:indexPath.row] type:CourseCellType_All];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *cousrInfoItem = [arrCourses objectAtIndex:indexPath.row];
    
    NSString *searchIdItem = [cousrInfoItem objectForKey:@"courseId"];

    NSString *courseNoItem = [cousrInfoItem objectForKey:@"courseNo" ];
    
    NSString *courseNameItem = [cousrInfoItem objectForKey:@"courseName"];
    
    NSString *coursePriceItem = [cousrInfoItem objectForKey:@"price"];
    

    if(delegate)
    {
        [delegate doClickCourse:searchIdItem courseNo:courseNoItem courseName:courseNameItem coursePrice:coursePriceItem];
    }
    
}

@end
