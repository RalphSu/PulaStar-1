//
//  AllNoticeView.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/5.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef AllNoticeView_h
#define AllNoticeView_h

#import <UIKit/UIKit.h>

@protocol AllNoticeViewDelegate <NSObject>
//- (void)doClickNotice:(NSString*)searchId courseNo:(NSString*)courseNo courseName:(NSString*)courseName coursePrice:(NSString*)coursePrice;

@end

@interface AllNoticeView : UIView
@property(nonatomic,assign)int proType;
@property(nonatomic,weak)id<AllNoticeViewDelegate> delegate;
- (id)initWithOrder:(CGRect)frame indexOrder:(int)indexOrder;
- (void)setTypeAndOrder:(int)type sort:(int)sort;
@end

#endif /* AllNoticeView_h */
