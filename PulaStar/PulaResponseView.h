//
//  PulaResponseView.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/4/12.
//  Copyright © 2016年 caniggiagoal. All rights reserved.
//

#ifndef PulaResponseView_h
#define PulaResponseView_h

#import <UIKit/UIKit.h>

@interface PulaResponseView : UIView
{
    IBOutlet UIImageView *_imgView;
    IBOutlet UILabel *_responseLabel;
}

@property (copy, nonatomic) NSString *imgName;
@property (copy, nonatomic) NSString *response;

@end

#endif /* PulaResponseView_h */
