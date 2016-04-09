//
//  AllActivityItemCell.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/5.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef AllActivityItemCell_h
#define AllActivityItemCell_h


#import <UIKit/UIKit.h>
#import "AllActivityModel.h"


typedef enum
{
    ActivityCellType_All,
    ActivityCellType_Search
}ActivityCellType;


@interface AllActivityItemCell : UITableViewCell

- (void)setActivityItem:(AllActivityItem*)item type:(ActivityCellType)type;
@end


#endif /* AllActivityItemCell_h */
