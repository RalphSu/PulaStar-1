//
//  activityDetailVC.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/5.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef activityDetailVC_h
#define activityDetailVC_h

#import <UIKit/UIKit.h>

@interface activityDetailVC : PulaBaseVC

- (id)initWithActivityInfo:(NSString *)activityPrice activityId:(NSString *)activityId activityNo:(NSString *)activityNo activityTitle:(NSString *)activityTitle activityContent:(NSString *)activityContent activityUpdateTime:(NSString *)activityUpdateTime activityIconFileId:(NSString *)activityIconFileId
            activityIconId:(NSString *)activityIconId;
@end


#endif /* activityDetailVC_h */
