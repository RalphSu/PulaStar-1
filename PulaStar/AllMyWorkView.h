//
//  AllMyWorkView.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/20.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef AllMyWorkView_h
#define AllMyWorkView_h

@protocol AllMyWorkViewDelegate <NSObject>

- (void)doClickWork:(NSString*)workEffectDate workId:(NSString*)workId workRate:(NSString*)workRate workNo:(NSString*)workNo workCourseNo:(NSString*)workCourseNo workBranchNo:(NSString *)workBranchNo workComments:(NSString *)workComments workIconId:(NSString *)workIconId  workIconFileId:(NSString *)workIconFileId workIconName:(NSString*)workIconName;

@end

@interface AllMyWorkView : UIView
//@property(nonatomic,assign)int proType;
@property(nonatomic,weak)id<AllMyWorkViewDelegate> delegate;
//- (id)initWithOrder:(CGRect)frame indexOrder:(int)indexOrder;
//- (void)setTypeAndOrder:(int)type sort:(int)sort;
@end


#endif /* AllMyWorkView_h */
