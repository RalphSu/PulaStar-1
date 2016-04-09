//
//  AllCourseItem.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/2.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AllCourseItemCell.h"
#import "AppDelegate.h"

@interface AllCourseItemCell ()
{
    CourseCellType     _type;
    AllCourseItem      *_myItem;
    
    UIImageView *imgPro;
    
    UILabel     *lblTitle;
    UILabel     *lblPrice;
    
    UILabel    *lblbranchName;
    UILabel    *lblclassRoom;
    
    
    UIProgressView  *progress;
    
    UILabel         *lblNowNum;
    UILabel         *lblAllNum;
    UILabel         *lblLeftNum;
}

@end


@implementation AllCourseItemCell

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
        lblTitle.numberOfLines = 2;
        lblTitle.font = [UIFont systemFontOfSize:20];
        lblTitle.textColor = [UIColor grayColor];
        lblTitle.lineBreakMode = NSLineBreakByTruncatingTail;
        [self addSubview:lblTitle];
        

        lblbranchName = [[UILabel alloc] init ];
        
        lblbranchName.font = [UIFont systemFontOfSize:15];
        lblbranchName.textColor = [UIColor lightGrayColor];
        [self addSubview:lblbranchName];
        
        lblclassRoom = [[UILabel alloc] init ];
        
        lblclassRoom.font = [UIFont systemFontOfSize:15];
        lblclassRoom.textColor = [UIColor lightGrayColor];
        [self addSubview:lblclassRoom];
        
    }
    return self;
}

- (void)setCourseItem:(AllCourseItem*)item type:(CourseCellType)type
{
    _type = type;
    _myItem = item;
    
    
    
    NSString *image = [NSString stringWithFormat:@"fp=%@&id=%@",[(NSMutableDictionary *)item objectForKey:@"fileId"],[(NSMutableDictionary *)item objectForKey:@"iconId"]];
    
    [imgPro setImage_oy:courseImageBaseUrl image:image];
    
    lblTitle.text = [(NSMutableDictionary *)item objectForKey:@"courseName"];
    
    CGSize s = [lblTitle.text textSizeWithFont:lblTitle.font constrainedToSize:CGSizeMake(mainWidth - 130, 40) lineBreakMode:NSLineBreakByCharWrapping];
    lblTitle.frame = CGRectMake((mainWidth/2 + 10), 15, (mainWidth/2 - 10), s.height < 40 ? s.height : 40);
    
   
    lblbranchName.text = [NSString stringWithFormat:@"分部：%@",[(NSMutableDictionary *)item objectForKey:@"branchName"] ];
    lblbranchName.frame = CGRectMake((mainWidth/2 + 10), lblTitle.frame.origin.y + lblTitle.frame.size.height + 5, mainWidth - 130, 20);
    
    
    lblclassRoom.text = [NSString stringWithFormat:@"教室：%@",[(NSMutableDictionary *)item objectForKey:@"classRoomName"] ];
    lblclassRoom.frame = CGRectMake((mainWidth/2 + 10), lblbranchName.frame.origin.y + lblbranchName.frame.size.height + 5, mainWidth - 130, 20);
    
  
}




@end
