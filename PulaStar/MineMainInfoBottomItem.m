//
//  MineMainInfoBottomItem.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/8.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import "MineMainInfoBottomItem.h"
#import "AppDelegate.h"
#import "MineInfoLoginVC.h"


@interface MineMainInfoBottomItem () <MineMainInfoBottomItemCellDelegate>
{
    __weak id<MineMainInfoBottomItemCellDelegate> delegate;
    int current_row;
    UIButton *bottomButton;
}

@end


@implementation MineMainInfoBottomItem
@synthesize delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        bottomButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, mainWidth, 40)];
        [bottomButton setBackgroundColor:MYINFO_NAVBAR_COLOR];
        //[aboutUsButton setTitle:@"确认支付" forState:UIControlStateNormal];
         bottomButton.layer.cornerRadius = 0;
        [bottomButton addTarget:self action:@selector(bottomButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:bottomButton];
        
             
        
    }
    return self;
}

- (void)bottomButtonAction
{
    if(delegate)
    {
        [delegate doClickMineBottomItemTabs:(int)current_row];
    }
  
    
}
- (void)MineMainInfoBottomItem:(NSString*)buttonName row:(int)row

{
    current_row = row;
    [bottomButton setTitle:buttonName forState:UIControlStateNormal];
}

@end
