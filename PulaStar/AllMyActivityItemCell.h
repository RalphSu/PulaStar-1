//
//  AllMyActivityItemCell.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/20.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef AllMyActivityItemCell_h
#define AllMyActivityItemCell_h

#import <UIKit/UIKit.h>
#import "AllMyActivityModel.h"


typedef enum
{
    ActivityCellType_All,
    ActivityCellType_Search
}ActivityCellType;


@interface AllMyActivityItemCell : UITableViewCell

- (void)setMyActivityItem:(AllMyActivityItem*)item type:(ActivityCellType)type;
@end


#endif /* AllMyActivityItemCell_h */
