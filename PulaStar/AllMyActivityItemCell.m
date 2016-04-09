//
//  AllMyActivityItemCell.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/20.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllMyActivityItemCell.h"
#import "AppDelegate.h"

@interface AllMyActivityItemCell ()
{
    ActivityCellType     _type;
    AllMyActivityItem      *_myItem;
    
    UIImageView *imgPro;
    
    UILabel     *lblTitle;
    UILabel     *bookingNum;
    UILabel     *bookingTime;
}

@end


@implementation AllMyActivityItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        imgPro = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10 ,(mainWidth/2 - 10), 100)];
        
        imgPro.image = [UIImage imageNamed:@"noimage"];
        imgPro.layer.borderWidth = 0.5;
        imgPro.layer.cornerRadius = 5;
        imgPro.layer.borderColor = [[UIColor hexFloatColor:@"dedede"] CGColor];
        imgPro.layer.masksToBounds = YES;
        [self addSubview:imgPro];
        
        
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
        
        
    }
    return self;
}

- (void)setMyActivityItem:(AllMyActivityItem*)item type:(ActivityCellType)type
{
    _type = type;
    _myItem = item;
    
    
    NSString *image = [NSString stringWithFormat:@"fp=%@&id=%@",[(NSMutableDictionary *)item objectForKey:@"activityIconFileId"],[(NSMutableDictionary *)item objectForKey:@"activityIconId"]];
    
    [imgPro setImage_oy:activityImageBaseUrl image:image];
    
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
    
    
    
}


@end
