//
//  buyCourseDetailPayMethodItem.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/5.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "buyCourseDetailPayMethodItem.h"

@interface buyCourseDetailPayMethodItem ()
{
    
    UIImageView *imgPro;
    
    UILabel     *lblTitle;
    UILabel     *lblTips;
}

@end

@implementation buyCourseDetailPayMethodItem

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        imgPro = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 30)];
        imgPro.image = [UIImage imageNamed:@"wechat"];
        imgPro.layer.borderWidth = 0;
        imgPro.layer.cornerRadius = 1;
        imgPro.layer.borderColor = [[UIColor hexFloatColor:@"dedede"] CGColor];
        imgPro.layer.masksToBounds = YES;
        [self addSubview:imgPro];
        
        lblTitle = [[UILabel alloc] init];
        lblTitle.numberOfLines = 2;
        lblTitle.font = [UIFont systemFontOfSize:15];
        lblTitle.textColor = [UIColor grayColor];
        lblTitle.lineBreakMode = NSLineBreakByTruncatingTail;
        [self addSubview:lblTitle];
        
        lblTips = [[UILabel alloc] init];
        lblTips.font = [UIFont systemFontOfSize:12];
        lblTips.textColor = [UIColor lightGrayColor];
        [self addSubview:lblTips];
        
        [self setProItem];
    }
    return self;
}

- (void)setProItem
{

    lblTitle.text = @"微信支付";
    CGSize s = [lblTitle.text textSizeWithFont:lblTitle.font constrainedToSize:CGSizeMake(mainWidth - 80, 40) lineBreakMode:NSLineBreakByCharWrapping];
    lblTitle.frame = CGRectMake(60, 10, mainWidth - 80, s.height < 40 ? s.height : 40);
    
    lblTips.text = @"推荐安装微信5.0版本以上的用户使用";
    lblTips.frame = CGRectMake(60, lblTitle.frame.origin.y  + lblTitle.frame.size.height + 5, mainWidth - 80, 20);
    

 
}

@end
