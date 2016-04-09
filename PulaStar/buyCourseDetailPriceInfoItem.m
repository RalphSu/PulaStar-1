//
//  buyCourseDetailPriceInfoItem.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/5.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "buyCourseDetailPriceInfoItem.h"
#import "AppDelegate.h"

@interface buyCourseDetailPriceInfoItem ()
{
    
    UIImageView *imgPro;
    
    UILabel     *lblTitle;
    UILabel     *lblPrice;
    
    UILabel    *lblBuyNum;
    UILabel    *lblclassRoom;
    
    
    UIProgressView  *progress;
    
    UILabel         *lblNowNum;
    UILabel         *lblAllNum;
    UILabel         *lblLeftNum;
}

@end


@implementation buyCourseDetailPriceInfoItem

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
 
        lblTitle = [[UILabel alloc] init ];
        
        lblTitle.font = [UIFont systemFontOfSize:15];
        
        [self addSubview:lblTitle];
        
        
        lblPrice = [[UILabel alloc] init ];
        
        lblPrice.font = [UIFont systemFontOfSize:15];
        lblPrice.textColor = [UIColor redColor];

        [self addSubview:lblPrice];
        
        
    }
    return self;
}

- (void)setPriceInfoItem:(NSString*)coursePrice;

{
    
    lblTitle.text = @"应付金额";
    
    lblTitle.frame = CGRectMake(10, 15, 100, 20);
    
    NSString *price = [[NSString alloc] init];
    
    price = [NSString stringWithFormat:@"¥ %@",coursePrice];
    
    lblPrice.text = price;
    
    lblPrice.frame = CGRectMake(mainWidth - 60, 15, 100, 20);
    
}

@end
