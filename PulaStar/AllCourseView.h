//
//  AllCourseView.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/2.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef AllCourseView_h
#define AllCourseView_h

#import <UIKit/UIKit.h>

@protocol AllCourseViewDelegate <NSObject>
- (void)doClickCourse:(NSString*)searchId courseNo:(NSString*)courseNo courseName:(NSString*)courseName coursePrice:(NSString*)coursePrice;

@end

@interface AllCourseView : UIView
@property(nonatomic,assign)int proType;
@property(nonatomic,weak)id<AllCourseViewDelegate> delegate;
- (id)initWithOrder:(CGRect)frame indexOrder:(int)indexOrder;
- (void)setTypeAndOrder:(int)type sort:(int)sort;
@end

#endif /* AllCourseView_h */
