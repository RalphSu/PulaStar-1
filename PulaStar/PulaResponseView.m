//
//  PulaResponseView.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/4/12.
//  Copyright © 2016年 caniggiagoal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PulaResponseView.h"

@implementation PulaResponseView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

- (void)setResponse:(NSString *)response1
{
    _response = response1;
    [_responseLabel setText:response1];
}

- (void)setImgName:(NSString *)imgName1
{
    _imgName = imgName1;
    [_imgView setImage:[UIImage imageNamed:imgName1]];
}

@end
