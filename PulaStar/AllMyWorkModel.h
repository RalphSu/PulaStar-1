//
//  AllMyWorkModel.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/20.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef AllMyWorkModel_h
#define AllMyWorkModel_h

#import <Foundation/Foundation.h>

@interface AllMyWorkItem : PulaBaseParser

@property (nonatomic,copy)NSString* workEffectDate;
@property (nonatomic,copy)NSString* workId;
@property (nonatomic,copy)NSString* workRate;
@property (nonatomic,copy)NSString* workNo;
@property (nonatomic,copy)NSString* workCourseNo;
@property (nonatomic,copy)NSString* workBranchNo;
@property (nonatomic,copy)NSString* workComments;
@property (nonatomic,copy)NSString* workIconFileId;
@property (nonatomic,copy)NSString* workIconId;
@property (nonatomic,copy)NSString* workIconName;
@end

@interface AllMyWorkList : PulaBaseParser
@property (nonatomic,copy)NSNumber* count;
@property (nonatomic,copy)NSArray* Rows;
@end



@interface AllMyWorkModel : NSObject
+(void)getAllMyWork:(NSString *)userNo success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure;

@end

#endif /* AllMyWorkModel_h */
