//
//  AllActivityView.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/5.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef AllActivityView_h
#define AllActivityView_h

@protocol AllActivityViewDelegate <NSObject>
- (void)doClickActivity:(NSString*)activityPrice activityId:(NSString*)activityId activityNo:(NSString*)activityNo activityTitle:(NSString*)activityTitle activityContent:(NSString*)activityContent activityUpdateTime:(NSString *)activityUpdateTime activityIconFileId:(NSString *)activityIconFileId activityIconId:(NSString *)activityIconId;

@end

@interface AllActivityView : UIView
@property(nonatomic,assign)int proType;
@property(nonatomic,weak)id<AllActivityViewDelegate> delegate;
- (id)initWithOrder:(CGRect)frame indexOrder:(int)indexOrder;
- (void)setTypeAndOrder:(int)type sort:(int)sort;
@end


#endif /* AllActivityView_h */
