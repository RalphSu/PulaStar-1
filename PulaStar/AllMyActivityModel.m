//
//  AllMyActivityModel.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/20.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllMyActivityModel.h"


@implementation AllMyActivityItem

@synthesize activityPrice,activityId,activityNo,activityTitle,activityContent,activityUpdateTime,activityIconFileId,activityIconId,activityBuyCount;

@end

@implementation AllMyActivityList

@synthesize count,Rows;
+ (Class)Rows_class {
    return [AllMyActivityItem class];
}

@end

@implementation AllMyActivityModel

+(void)getAllMyActivity:(NSString *)userNo success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure
{
    NSString* url = [NSString stringWithFormat:getUserActivityUrl,userNo];
    [[XBApi SharedXBApi] requestWithURL:url paras:nil type:XBHttpResponseType_Json success:success failure:failure];
}

@end