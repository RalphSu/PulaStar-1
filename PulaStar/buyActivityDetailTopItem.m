//
//  buyActivityDetailTopItem.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/5.
//  Copyright © 2016年 PulaStar. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "buyActivityDetailTopItem.h"
#import "AppDelegate.h"

@interface buyActivityDetailTopItemCell ()
{
    
    UIImageView *imgPro;
    
    UILabel     *lblTitle;
    UILabel     *lblPrice;
    
    UILabel    *lblBuyNum;
}

@end


@implementation buyActivityDetailTopItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        imgPro = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10 ,80, 60)];
        
        imgPro.image = [UIImage imageNamed:@"pula_logo_rec"];
        imgPro.layer.borderWidth = 0.5;
        imgPro.layer.cornerRadius = 5;
        imgPro.layer.borderColor = [[UIColor hexFloatColor:@"dedede"] CGColor];
        imgPro.layer.masksToBounds = YES;
        [self addSubview:imgPro];
        
        lblTitle = [[UILabel alloc] init];
        lblTitle.numberOfLines = 2;
        lblTitle.font = [UIFont systemFontOfSize:18];
        //lblTitle.textColor = [UIColor grayColor];
        lblTitle.lineBreakMode = NSLineBreakByTruncatingTail;
        [self addSubview:lblTitle];
        
        
        lblBuyNum = [[UILabel alloc] init ];
        
        lblBuyNum.font = [UIFont systemFontOfSize:15];
        //lblBuyNum.textColor = [UIColor grayColor];
        [self addSubview:lblBuyNum];
        
        /*
         lblclassRoom = [[UILabel alloc] init ];
         
         lblclassRoom.font = [UIFont systemFontOfSize:15];
         lblclassRoom.textColor = [UIColor lightGrayColor];
         [self addSubview:lblclassRoom]; */
        
    }
    return self;
}


- (void)setActivityItem:(NSString*)activityPrice activityId:(NSString*)activityId activityNo:(NSString*)activityNo activityTitle:(NSString*)activityTitle activityContent:(NSString*)activityContent activityUpdateTime:(NSString*)activityUpdateTime activityIconFileId:(NSString*)activityIconFileId activityIconId: (NSString*)activityIconId;

{
    
    lblTitle.text = activityTitle;
    
    CGSize s = [lblTitle.text textSizeWithFont:lblTitle.font constrainedToSize:CGSizeMake(mainWidth - 130, 40) lineBreakMode:NSLineBreakByCharWrapping];
    lblTitle.frame = CGRectMake(100, 15, (mainWidth/2 - 10), s.height < 40 ? s.height : 40);
    
    
    lblBuyNum.text = @"数量：1";
    lblBuyNum.frame = CGRectMake(100, lblTitle.frame.origin.y + lblTitle.frame.size.height + 5, (mainWidth/2 - 10), 20);
    
    /*
     lblclassRoom.text = coursePrice;
     lblclassRoom.frame = CGRectMake((mainWidth/2 + 10), lblbranchName.frame.origin.y + lblbranchName.frame.size.height + 5, mainWidth - 130, 20);
     */
    
}

@end
