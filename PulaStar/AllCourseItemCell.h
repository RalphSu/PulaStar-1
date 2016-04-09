//
//  AllCourseItem.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/2.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef AllCourseItem_h
#define AllCourseItem_h


#import <UIKit/UIKit.h>
#import "AllCourseModel.h"


typedef enum
{
    CourseCellType_All,
    CourseCellType_Search
}CourseCellType;


@interface AllCourseItemCell : UITableViewCell

- (void)setCourseItem:(AllCourseItem*)item type:(CourseCellType)type;
@end


#endif /* AllCourseItem_h */
