//
//  MineMainInfoBottomItem.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/8.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef MineMainInfoBottomItem_h
#define MineMainInfoBottomItem_h

#import <UIKit/UIKit.h>

@protocol MineMainInfoBottomItemCellDelegate <NSObject>

-(void)doClickMineBottomItemTabs:(int)index;
@end


@interface MineMainInfoBottomItem : UITableViewCell

@property(nonatomic,weak)id<MineMainInfoBottomItemCellDelegate> delegate;

- (void)MineMainInfoBottomItem:(NSString*)buttonName row:(int)row;

@end



#endif /* MineMainInfoBottomItem_h */
