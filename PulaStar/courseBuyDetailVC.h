//
//  courseBuyDetailVC.h
//  OneYuan
//
//  Created by CaniggiaGoal on 16/3/5.
//  Copyright © 2016年 Peter. All rights reserved.
//

#ifndef courseBuyDetailVC_h
#define courseBuyDetailVC_h

#import <UIKit/UIKit.h>

@interface courseBuyDetailVC: OneBaseVC

- (id)initWithCourseInfo:(NSString*)searchId courseNo:(NSString*)courseNo courseName:(NSString*)courseName coursePrice:(NSString*)coursePrice;
@end

/*

@interface ProductBuyCell : UITableViewCell

- (void)setBuy:(ProdcutBuyItem*)item;
@end
 
*/

#endif /* courseBuyDetailVC_h */
