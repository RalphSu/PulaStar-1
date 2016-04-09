//
//  MineMainInfoTopItem.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/8.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import "MineMainInfoTopItem.h"
#import "AppDelegate.h"

@interface MineMainInfoTopItem ()<MineMainInfoTopItemCellDelegate>
{
     __weak id<MineMainInfoTopItemCellDelegate> delegate;
    UIImageView *imgPro;
    UIImageView *imgArrow;
    UILabel     *lblTitle;
    
}

@end


@implementation MineMainInfoTopItem
@synthesize delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = MYINFO_NAVBAR_COLOR;
        
        imgPro = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15 ,30, 30)];
        
        imgPro.image = [UIImage imageNamed:@"touxiang"];
        imgPro.layer.borderWidth = 0.5;
        imgPro.layer.cornerRadius = 15;
        imgPro.layer.borderColor = [[UIColor hexFloatColor:@"dedede"] CGColor];
        imgPro.layer.masksToBounds = YES;
        [self addSubview:imgPro];
        
        lblTitle = [[UILabel alloc] init];
        lblTitle.numberOfLines = 1;
        lblTitle.font = [UIFont systemFontOfSize:18];
        lblTitle.textColor = [UIColor whiteColor];
        lblTitle.lineBreakMode = NSLineBreakByTruncatingTail;
        [self addSubview:lblTitle];
        
        imgArrow = [[UIImageView alloc] initWithFrame:CGRectMake(mainWidth - 40, 20 ,15, 20)];
        
        imgArrow.image = [UIImage imageNamed:@"arrow"];
        imgArrow.layer.borderWidth = 0;
        imgArrow.layer.cornerRadius = 0;
        imgArrow.layer.borderColor = [[UIColor hexFloatColor:@"00000000"] CGColor];
        imgArrow.layer.masksToBounds = YES;
        [self addSubview:imgArrow];
        
        
        
    }
    return self;
}


- (void)setMineNameItem:(NSString*) userName

{
    
    lblTitle.text = userName;
    
    CGSize s = [lblTitle.text textSizeWithFont:lblTitle.font constrainedToSize:CGSizeMake(100, 40) lineBreakMode:NSLineBreakByCharWrapping];
    lblTitle.frame = CGRectMake(60, 20, 100, s.height < 40 ? s.height : 40);
    
    
 
}

@end
