//
//  MineMainInfoMiddleItem.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/8.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import "MineMainInfoMiddleItem.h"
#import "AppDelegate.h"


@interface MineMainInfoMiddleItem () <MineMainInfoMiddleItemCellDelegate>
{
    __weak id<MineMainInfoMiddleItemCellDelegate> delegate;
    int current_row;
    UIImageView *imgLeft;
    UIImageView *imgRight;
}

@end


@implementation MineMainInfoMiddleItem
@synthesize delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        imgLeft = [[UIImageView alloc] initWithFrame:CGRectMake(mainWidth/9, 10 ,mainWidth/3, mainWidth/3 +20)];
        
        imgLeft.image = [UIImage imageNamed:@"camera"];
        imgLeft.layer.borderWidth = 0;
        imgLeft.layer.cornerRadius = 1;
        imgLeft.layer.borderColor = [[UIColor hexFloatColor:@"00000000"] CGColor];
        imgLeft.layer.masksToBounds = YES;
        
        imgLeft.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleLeftTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doClickMineInfoTabsRowIndex0)];
        [imgLeft addGestureRecognizer:singleLeftTap];
    
        
        [self addSubview:imgLeft];
        

        imgRight = [[UIImageView alloc] initWithFrame:CGRectMake(mainWidth/2 + mainWidth/18, 10 ,mainWidth/3, mainWidth/3 + 20)];
        
        imgRight.image = [UIImage imageNamed:@"camera"];
        imgRight.layer.borderWidth = 0;
        imgRight.layer.cornerRadius = 1;
        imgRight.layer.borderColor = [[UIColor hexFloatColor:@"00000000"] CGColor];
        imgRight.layer.masksToBounds = YES;
        imgRight.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleRightTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doClickMineInfoTabsRowIndex1)];
        [imgRight addGestureRecognizer:singleRightTap];

        [self addSubview:imgRight];
        
        
        
    }
    return self;
}

-(void)doClickMineInfoTabsRowIndex0
{
    if(delegate)
     {
     [delegate doClickMineInfoTabs:(int)current_row index:0];
     }
    //NSLog(@"!!!!!!!!!!!!!!!!");
}

-(void)doClickMineInfoTabsRowIndex1
{
    if(delegate)
     {
     [delegate doClickMineInfoTabs:(int)current_row index:1];
     }
    
    //NSLog(@"DDDDDDDDDDDDDDDD");
}

/*
- (void)UesrClickedLeft
{
    NSLog(@"!!!!!!!!!!!!!!!!");
}

- (void)UesrClickedRight
{
    NSLog(@"fffff");
}
*/

- (void)setMineInfoImageItem:(NSString*)leftImageName rightImageName:rightImageName row:(int)row

{
    current_row  = row;
    imgLeft.image = [UIImage imageNamed:leftImageName];
    
    imgRight.image = [UIImage imageNamed:rightImageName];
}

@end
