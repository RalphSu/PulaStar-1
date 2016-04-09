//
//  activityBuyVC.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/5.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef activityBuyVC_h
#define activityBuyVC_h


#import <UIKit/UIKit.h>

@interface activityBuyVC : PulaBaseVC

- (id)initWithActivityInfo:(NSString *)activityPrice activityId:(NSString *)activityId activityNo:(NSString *)activityNo activityTitle:(NSString *)activityTitle activityContent:(NSString *)activityContent activityUpdateTime:(NSString *)activityUpdateTime activityIconFileId:(NSString *)activityIconFileId
            activityIconId:(NSString *)activityIconId;
@end

#endif /* activityBuyVC_h */
