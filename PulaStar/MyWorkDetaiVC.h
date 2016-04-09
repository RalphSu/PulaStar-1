//
//  MyWorkDetaiVC.h
//  OneYuan
//
//  Created by CaniggiaGoal on 16/3/21.
//  Copyright © 2016年 Peter. All rights reserved.
//

#ifndef MyWorkDetaiVC_h
#define MyWorkDetaiVC_h

@protocol MyWorkCellDelegate <NSObject>

- (void)doClickMyWorkTabs:(int)row index:(int)index;
@end



@interface MyWorkDetailVC : OneBaseVC

@property(nonatomic,weak)id<MyWorkCellDelegate> delegate;

- (void)setMyWorkItem:(AllMyWorkItem*)item workItem:(AllMyWorkItem*)item1 current_row:(int)row;
@end





@interface MyWorkDetailVC : OneBaseVC

@end

#endif /* MyWorkDetaiVC_h */
