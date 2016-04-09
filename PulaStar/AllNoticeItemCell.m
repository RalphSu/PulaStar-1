//
//  AllNoticeItemCell.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/5.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllNoticeItemCell.h"
#import "AppDelegate.h"

@interface AllNoticeItemCell ()
{
    NoticeCellType     _type;
    AllNoticeItem      *_myItem;
    UIImageView *imgPro;
    
}

@end


@implementation AllNoticeItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        imgPro = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0 ,(mainWidth - 10), mainHeight/2.9)];
        
        imgPro.image = [UIImage imageNamed:@"noimage"];
        imgPro.layer.borderWidth = 0.5;
        imgPro.layer.cornerRadius = 5;
        imgPro.layer.borderColor = [[UIColor hexFloatColor:@"dedede"] CGColor];
        imgPro.layer.masksToBounds = YES;
        [self addSubview:imgPro];
        
    }
    return self;
}

- (void)setNoticeItem:(AllNoticeItem*)item type:(NoticeCellType)type
{
    _type = type;
    _myItem = item;
    
    
    
    NSString *image = [NSString stringWithFormat:@"fp=%@&sub=%@",[(NSMutableDictionary *)item objectForKey:@"noticeImage"],[(NSMutableDictionary *)item objectForKey:@"noticeSub"]];
    
    [imgPro setImage_oy:noticeImageBaseUrl image:image];
    
    /*
    lblTitle.text = [(NSMutableDictionary *)item objectForKey:@"courseName"];
    
    CGSize s = [lblTitle.text textSizeWithFont:lblTitle.font constrainedToSize:CGSizeMake(mainWidth - 130, 40) lineBreakMode:NSLineBreakByCharWrapping];
    lblTitle.frame = CGRectMake((mainWidth/2 + 10), 15, (mainWidth/2 - 10), s.height < 40 ? s.height : 40);
    
    
    lblbranchName.text = [NSString stringWithFormat:@"分部：%@",[(NSMutableDictionary *)item objectForKey:@"branchName"] ];
    lblbranchName.frame = CGRectMake((mainWidth/2 + 10), lblTitle.frame.origin.y + lblTitle.frame.size.height + 5, mainWidth - 130, 20);
    
    
    lblclassRoom.text = [NSString stringWithFormat:@"教室：%@",[(NSMutableDictionary *)item objectForKey:@"classRoomName"] ];
    lblclassRoom.frame = CGRectMake((mainWidth/2 + 10), lblbranchName.frame.origin.y + lblbranchName.frame.size.height + 5, mainWidth - 130, 20);
    
    */
}




@end
