//
//  AllNoticeItemCell.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/5.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef AllNoticeItemCell_h
#define AllNoticeItemCell_h


#import <UIKit/UIKit.h>
#import "AllNoticeModel.h"


typedef enum
{
    NoticeCellType_All,
    NoticeCellType_Search
}NoticeCellType;


@interface AllNoticeItemCell : UITableViewCell

- (void)setNoticeItem:(AllNoticeItem*)item  type:(NoticeCellType)type;
@end





#endif /* AllNoticeItemCell_h */
