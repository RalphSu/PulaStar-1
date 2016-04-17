//
//  OrderPaymentVC.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/4/17.
//  Copyright © 2016年 caniggiagoal. All rights reserved.
//

#ifndef OrderPaymentVC_h
#define OrderPaymentVC_h

/// 支付类型
typedef enum : NSUInteger {
    /// 支付宝支付
    kAliPayType,
    /// 微信支付
    kWeixinPayType,
} PayType;

typedef NS_ENUM(NSInteger, OrderType) {
    /**
     *  活动订单
     */
    kOrderTypeActivity = 0,
    /**
     *  课程订单
     */
    kOrderTypeCourse,
};





#import "PulaBaseVC.h"
//#import "OrderProductCell.h"

@class OrderModel;


extern NSString *const kOrderPaymentViewControllerDidReceivedMessageNotification;

/// 支付未成功通知
extern NSString *const kOrderPaymentViewControllerDidPayUnsuccessedNotification;


@interface OrderPaymentViewController : PulaBaseVC


/// 总金额
@property (nonatomic, readwrite, assign) float totalMoney;

/// 此方法已不再使用
- (instancetype)initPayOrder:(OrderModel*)payOrder  withPayType:(PayType)payType orderType:(OrderType)orderType;

/// 已有订单号和预付id
- (instancetype)initPrepayID:(NSString *)prepayID orderNumber:(NSString*)ordernum payType:(PayType)payType;

/// 合并订单初始化
- (instancetype)initWithProducts:(NSArray*)products withPayType:(PayType)payType orderType:(OrderType)orderType;





@end

#endif /* OrderPaymentVC_h */
