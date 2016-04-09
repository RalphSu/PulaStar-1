//
//  AllMyActivityModel.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/20.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef AllMyActivityModel_h
#define AllMyActivityModel_h


#import <Foundation/Foundation.h>

@interface AllMyActivityItem : PulaBaseParser

@property (nonatomic,copy)NSString* activityPrice;
@property (nonatomic,copy)NSString* activityId;
@property (nonatomic,copy)NSString* activityNo;
@property (nonatomic,copy)NSString* activityTitle;
@property (nonatomic,copy)NSString* activityContent;
@property (nonatomic,copy)NSString* activityUpdateTime;
@property (nonatomic,copy)NSString* activityIconFileId;
@property (nonatomic,copy)NSString* activityIconId;
@property (nonatomic,copy)NSString* activityBuyCount;
@end

@interface AllMyActivityList : PulaBaseParser
@property (nonatomic,copy)NSNumber* count;
@property (nonatomic,copy)NSArray* Rows;
@end



@interface AllMyActivityModel : NSObject
+(void)getAllMyActivity:(NSString *)userNo success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure;

@end


#endif /* AllMyActivityModel_h */
