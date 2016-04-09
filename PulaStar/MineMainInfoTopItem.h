//
//  MineMainInfoTopItem.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/8.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef MineMainInfoTopItem_h
#define MineMainInfoTopItem_h


#import <UIKit/UIKit.h>


@protocol MineMainInfoTopItemCellDelegate <NSObject>

-(void)doClickMineInfoTabs:(int)row index:(int)index;
@end

@interface MineMainInfoTopItem : UITableViewCell
@property(nonatomic,weak)id<MineMainInfoTopItemCellDelegate> delegate;

- (void)setMineNameItem:(NSString*) userName;

@end



#endif /* MineMainInfoTopItem_h */
