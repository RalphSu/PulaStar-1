//
//  courseDetailVC.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/2.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef courseDetailVC_h
#define courseDetailVC_h

#import <UIKit/UIKit.h>

@interface courseDetailVC : PulaBaseVC

- (id)initWithCourseInfo:(NSString*)searchId courseNo:(NSString*)courseNo courseName:(NSString*)courseName coursePrice:(NSString*)coursePrice;
@end

#endif /* courseDetailVC_h */
