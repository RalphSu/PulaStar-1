//
//  bookingTimePickerView.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/4/2.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef bookingTimePickerView_h
#define bookingTimePickerView_h


#import <Foundation/Foundation.h>

@class bookingTimePickerView;
@protocol bookingTimePickerViewDelegate <NSObject>

@optional
- (void)bookingTime_pickerView:(bookingTimePickerView *)pickerView didSelectRow:(NSInteger)row section:(NSInteger)section;

- (void)bookingTime_pickerViewConfirmAction:(bookingTimePickerView *)pickerView didSelectArray:(NSArray <NSNumber *> *)selectedArray;

@end

@interface bookingTimePickerView : NSObject

@property (nonatomic,strong) NSArray<NSArray<NSString *> *> *dataSource;
@property (nonatomic,assign) id<bookingTimePickerViewDelegate> delegate;

- (void)show;

- (void)dismiss;

- (void)selectedRow:(NSInteger)row section:(NSInteger)section animation:(BOOL)animation;

- (void)reloadData;
- (void)reloadDataWithSection:(NSInteger)section;

@end

#endif /* bookingTimePickerView_h */
