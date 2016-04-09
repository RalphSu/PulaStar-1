//
//  AllActivityItemCell.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/5.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllActivityItemCell.h"
#import "AppDelegate.h"

@interface AllActivityItemCell ()
{
    ActivityCellType     _type;
    AllActivityItem      *_myItem;
    
    UIImageView *imgPro;
    
    UILabel     *lblTitle;
    }

@end


@implementation AllActivityItemCell

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
        lblTitle.font = [UIFont systemFontOfSize:20];
        lblTitle.textColor = [UIColor grayColor];
        [self addSubview:lblTitle];
        
        
    }
    return self;
}

- (void)setActivityItem:(AllActivityItem*)item type:(ActivityCellType)type
{
    _type = type;
    _myItem = item;
    
    
    NSString *image = [NSString stringWithFormat:@"fp=%@&id=%@",[(NSMutableDictionary *)item objectForKey:@"activityIconFileId"],[(NSMutableDictionary *)item objectForKey:@"activityIconId"]];
    
    [imgPro setImage_oy:activityImageBaseUrl image:image];

    NSString *text = [(NSMutableDictionary *)item objectForKey:@"activityTitle"];
    
    CGSize s = [text textSizeWithFont:lblTitle.font constrainedToSize:CGSizeMake((mainWidth/2 - 10), 80) lineBreakMode:NSLineBreakByCharWrapping];
    
    lblTitle.frame = CGRectMake((mainWidth/2+10), 15, s.width,s.height);
    lblTitle.numberOfLines = 0;
    lblTitle.text = text;
    
}


@end
