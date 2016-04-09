//
//  AllMyActivityView.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/20.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef AllMyActivityView_h
#define AllMyActivityView_h

@protocol AllMyActivityViewDelegate <NSObject>
/*
- (void)doClickActivity:(NSString*)activityPrice activityId:(NSString*)activityId activityNo:(NSString*)activityNo activityTitle:(NSString*)activityTitle activityContent:(NSString*)activityContent activityUpdateTime:(NSString *)activityUpdateTime activityIconFileId:(NSString *)activityIconFileId activityIconId:(NSString *)activityIconId;
*/
@end

@interface AllMyActivityView : UIView
@property(nonatomic,assign)int proType;
@property(nonatomic,weak)id<AllMyActivityViewDelegate> delegate;
- (id)initWithOrder:(CGRect)frame indexOrder:(int)indexOrder;

@end

#endif /* AllMyActivityView_h */
