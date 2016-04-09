//
//  MineMainInfoMiddleItem.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/8.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef MineMainInfoMiddleItem_h
#define MineMainInfoMiddleItem_h

#import <UIKit/UIKit.h>

@protocol MineMainInfoMiddleItemCellDelegate <NSObject>

- (void)doClickMineInfoTabs:(int)row index:(int)index;
@end


@interface MineMainInfoMiddleItem : UITableViewCell

@property(nonatomic,weak)id<MineMainInfoMiddleItemCellDelegate> delegate;

- (void)setMineInfoImageItem:(NSString*)leftImageName rightImageName:(NSString *)rightImageName row:(int)row;

@end





#endif /* MineMainInfoMiddleItem_h */
