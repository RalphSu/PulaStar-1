//
//  MyWorkDetaiVC.m
//  OneYuan
//
//  Created by CaniggiaGoal on 16/3/21.
//  Copyright © 2016年 Peter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyWorkDetaiVC.h"
#import "AllMyWorkItemCell.h"
#import "AppDelegate.h"

@interface MyWorkDetailVC ()
{
    __weak id<MyWorkCellDelegate> delegate;
    AllMyWorkItem      *_myItem;
    AllMyWorkItem      *_myItem1;
    int current_row;
    
    UIImageView *imgProLeft;
    UIImageView *imgProRight;
    
    UILabel     *timeLeft;
    UILabel     *timeRight;
    UILabel     *dianPingLeft;
    UILabel     *dianPingRight;
    UILabel     *dateLeft;
    UILabel     *dateRight;
    UIImageView *levelImageLeft;
    UIImageView *levelImageRight;
    
}

@end


@implementation MyWorkDetailVC
@synthesize delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        imgProLeft = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10 ,(mainWidth/2 - 15), mainHeight/4)];
        
        //imgProLeft.image = [UIImage imageNamed:@"noimage"];
        imgProLeft.layer.borderWidth = 0.5;
        imgProLeft.layer.cornerRadius = 5;
        imgProLeft.layer.borderColor = [[UIColor hexFloatColor:@"dedede"] CGColor];
        imgProLeft.layer.masksToBounds = YES;
        
        imgProLeft.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleLeftTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doClickMyWorkTabsRowIndex0)];
        [imgProLeft addGestureRecognizer:singleLeftTap];
        
        [self addSubview:imgProLeft];
        
        dateLeft = [[UILabel alloc]initWithFrame:CGRectMake(10,10 + mainHeight/4,(mainWidth/2 - 15)/4 + 1, 15)];
        [self addSubview:dateLeft];
        
        timeLeft = [[UILabel alloc]initWithFrame:CGRectMake(10 + (mainWidth/2 - 15)/4,10 + mainHeight/4,(mainWidth/2 - 15)*0.75 - 1 , 15)];
        [self addSubview:timeLeft];
        
        
        dianPingLeft = [[UILabel alloc]initWithFrame:CGRectMake(10,25 + mainHeight/4,(mainWidth/2 - 15)/4, 15)];
        [self addSubview:dianPingLeft];
        
        levelImageLeft = [[UIImageView alloc] initWithFrame:CGRectMake(10 + (mainWidth/2 - 15)/4, 25 + mainHeight/4 ,(mainWidth/2 - 15)*0.75, 15)];
        [self addSubview:levelImageLeft];
        
        imgProRight = [[UIImageView alloc] initWithFrame:CGRectMake(mainWidth/2 +5, 10 ,(mainWidth/2 - 15), mainHeight/4)];
        
        //imgProRight.image = [UIImage imageNamed:@"noimage"];
        imgProRight.layer.borderWidth = 0.5;
        imgProRight.layer.cornerRadius = 5;
        imgProRight.layer.borderColor = [[UIColor hexFloatColor:@"dedede"] CGColor];
        imgProRight.layer.masksToBounds = YES;
        
        imgProRight.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleRightTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doClickMyWorkTabsRowIndex1)];
        [imgProRight addGestureRecognizer:singleRightTap];
        
        
        [self addSubview:imgProRight];
        
        dateRight = [[UILabel alloc]initWithFrame:CGRectMake(mainWidth/2 +5,10 + mainHeight/4,(mainWidth/2 - 15)/4 + 1, 15)];
        [self addSubview:dateRight];
        
        timeRight = [[UILabel alloc]initWithFrame:CGRectMake(mainWidth/2 +5 + (mainWidth/2 - 15)/4,10 + mainHeight/4,(mainWidth/2 - 15)*0.75 - 1, 15)];
        [self addSubview:timeRight];
        
        
        dianPingRight = [[UILabel alloc] initWithFrame:CGRectMake(mainWidth/2 +5, 25 + mainHeight/4 ,(mainWidth/2 - 15)/4, 15)];
        [self addSubview:dianPingRight];
        levelImageRight = [[UIImageView alloc] initWithFrame:CGRectMake(mainWidth/2 + 5 + (mainWidth/2 - 15)/4, 25 + mainHeight/4 ,(mainWidth/2 - 15)*0.75, 15)];
        
        [self addSubview:levelImageRight];
        
        
        /*
         lblTitle = [[UILabel alloc] init];
         lblTitle.font = [UIFont systemFontOfSize:18];
         lblTitle.textColor = [UIColor grayColor];
         [self addSubview:lblTitle];
         
         bookingNum = [[UILabel alloc] init];
         bookingNum.font = [UIFont systemFontOfSize:12];
         bookingNum.textColor = [UIColor grayColor];
         [self addSubview:bookingNum];
         
         bookingTime = [[UILabel alloc] init];
         bookingTime.font = [UIFont systemFontOfSize:12];
         bookingTime.textColor = [UIColor grayColor];
         [self addSubview:bookingTime];
         */
        
    }
    return self;
}

- (void)setMyWorkItem:(AllMyWorkItem*)item workItem:(AllMyWorkItem *)item1 current_row:(int)row
{
    _myItem = item;
    _myItem1 = item1;
    
    current_row = row;
    
    NSString *image = [NSString stringWithFormat:@"fp=%@&id=%@",[(NSMutableDictionary *)item objectForKey:@"workIconFileId"],[(NSMutableDictionary *)item objectForKey:@"workIconId"]];
    
    [imgProLeft setImage_oy:workImageBaseUrl image:image];
    
    dateLeft.text = @"日期:";
    
    dateLeft.backgroundColor = [UIColor hexFloatColor:@"EE7600"];
    dateLeft.textColor = [UIColor whiteColor];
    dateLeft.font = [UIFont systemFontOfSize:12];
    dateLeft.textAlignment = NSTextAlignmentCenter;
    
    timeLeft.text = [(NSMutableDictionary *)item objectForKey:@"workEffectDate"];
    
    timeLeft.backgroundColor = [UIColor hexFloatColor:@"EE7600"];
    timeLeft.textColor = [UIColor whiteColor];
    timeLeft.font = [UIFont systemFontOfSize:12];
    timeLeft.textAlignment = NSTextAlignmentCenter;
    
    dianPingLeft.text = @"点评:";
    dianPingLeft.textColor = [UIColor hexFloatColor:@"EE7600"];
    dianPingLeft.font = [UIFont systemFontOfSize:12];
    dianPingLeft.textAlignment = NSTextAlignmentCenter;
    
    
    
    if(item1 != NULL)
    {
        NSString *image1 = [NSString stringWithFormat:@"fp=%@&id=%@",[(NSMutableDictionary *)item1 objectForKey:@"workIconFileId"],[(NSMutableDictionary *)item1 objectForKey:@"workIconId"]];
        
        [imgProRight setImage_oy:workImageBaseUrl image:image1];
        
        dateRight.text = @"日期:";
        
        dateRight.backgroundColor = [UIColor hexFloatColor:@"EE7600"];
        dateRight.textColor = [UIColor whiteColor];
        dateRight.font = [UIFont systemFontOfSize:12];
        dateRight.textAlignment = NSTextAlignmentCenter;
        
        timeRight.text = [(NSMutableDictionary *)item1 objectForKey:@"workEffectDate"];
        
        timeRight.backgroundColor = [UIColor hexFloatColor:@"EE7600"];
        timeRight.textColor = [UIColor whiteColor];
        timeRight.font = [UIFont systemFontOfSize:12];
        timeRight.textAlignment = NSTextAlignmentCenter;
        dianPingRight.text = @"点评:";
        dianPingRight.textColor = [UIColor hexFloatColor:@"EE7600"];
        dianPingRight.font = [UIFont systemFontOfSize:12];
        dianPingRight.textAlignment = NSTextAlignmentCenter;
        
    }
    
    /*
     NSString *text = [(NSMutableDictionary *)item objectForKey:@"activityTitle"];
     
     CGSize s = [text textSizeWithFont:lblTitle.font constrainedToSize:CGSizeMake((mainWidth/2 - 10), 60) lineBreakMode:NSLineBreakByCharWrapping];
     
     lblTitle.frame = CGRectMake((mainWidth/2+10), 10, s.width,s.height);
     lblTitle.numberOfLines = 0;
     lblTitle.text = text;
     
     CGSize s1 = [text textSizeWithFont:lblTitle.font constrainedToSize:CGSizeMake((mainWidth/2 - 10), 20) lineBreakMode:NSLineBreakByCharWrapping];
     
     bookingNum.frame = CGRectMake((mainWidth/2+10), 10 + 60 , s1.width,s1.height);
     bookingNum.numberOfLines = 0;
     
     NSString *string = [NSString stringWithFormat:@"预约人数:%@",[(NSMutableDictionary *)item objectForKey:@"activityBuyCount"]];
     bookingNum.text = string;
     
     CGSize s2 = [text textSizeWithFont:lblTitle.font constrainedToSize:CGSizeMake((mainWidth/3), 20) lineBreakMode:NSLineBreakByCharWrapping];
     
     bookingTime.frame = CGRectMake((mainWidth * 0.7 ), 30 + 60 , s2.width,s2.height);
     bookingTime.numberOfLines = 0;
     
     NSString *string1 = [NSString stringWithFormat:@"%@",[(NSMutableDictionary *)item objectForKey:@"activityUpdateTime"]];
     bookingTime.text = string1;
     */
    
    
}

-(void)doClickMyWorkTabsRowIndex0
{
    if(delegate)
    {
        [delegate doClickMyWorkTabs:(int)current_row index:0];
    }
    NSLog(@"!!!!!!!!!!!!!!!!");
}

-(void)doClickMyWorkTabsRowIndex1
{
    if(delegate)
    {
        [delegate doClickMyWorkTabs:(int)current_row index:1];
    }
    
    NSLog(@"DDDDDDDDDDDDDDDD");
}

@end
