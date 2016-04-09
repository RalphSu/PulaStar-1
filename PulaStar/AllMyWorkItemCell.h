//
//  AllMyWorkItemCell.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/20.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef AllMyWorkItemCell_h
#define AllMyWorkItemCell_h

#import "AllMyWorkModel.h"


@protocol AllMyWorkItemCellDelegate <NSObject>

- (void)doClickMyWorkTabs:(int)row index:(int)index;

@end


@interface AllMyWorkItemCell : UITableViewCell

@property(nonatomic,weak)id<AllMyWorkItemCellDelegate> delegate;

- (void)setMyWorkItem:(AllMyWorkItem*)item workItem:(AllMyWorkItem*)item1 current_row:(int)row;
@end





#endif /* AllMyWorkItemCell_h */
