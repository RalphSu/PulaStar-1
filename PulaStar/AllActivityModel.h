//
//  AllActivityModel.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/5.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef AllActivityModel_h
#define AllActivityModel_h

#import <Foundation/Foundation.h>

@interface AllActivityItem : PulaBaseParser

@property (nonatomic,copy)NSString* activityPrice;
@property (nonatomic,copy)NSString* activityId;
@property (nonatomic,copy)NSString* activityNo;
@property (nonatomic,copy)NSString* activityTitle;
@property (nonatomic,copy)NSString* activityContent;
@property (nonatomic,copy)NSString* activityUpdateTime;
@property (nonatomic,copy)NSString* activityIconFileId;
@property (nonatomic,copy)NSString* activityIconId;
@end

@interface AllActivityList : PulaBaseParser
@property (nonatomic,copy)NSNumber* count;
@property (nonatomic,copy)NSArray* Rows;
@end



@interface AllActivityModel : NSObject
+(void)getAllActivity:(int)sortId sort:(int)sort page:(int)page size:(int)size success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure;
/*
 +(void)getGoodsPeriodByCodeId:(int)codeId success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure;*/
@end

#endif /* AllActivityModel_h */
