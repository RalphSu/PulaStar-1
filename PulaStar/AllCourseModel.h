//
//  AllCourseModel.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/2.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef AllCourseModel_h
#define AllCourseModel_h


#import <Foundation/Foundation.h>


@interface AllCourseItem : PulaBaseParser

@property (nonatomic,copy)NSString* branchName;
@property (nonatomic,copy)NSString* classRoomName;
@property (nonatomic,copy)NSString* courseId;
@property (nonatomic,copy)NSString* courseName;
@property (nonatomic,copy)NSString* courseNo;
@property (nonatomic,copy)NSString* durationMinute;
@property (nonatomic,copy)NSString* endTime;
@property (nonatomic,copy)NSString* fileId;
@property (nonatomic,copy)NSString* iconId;
@property (nonatomic,copy)NSString* maxStudentNum;
@property (nonatomic,copy)NSString* price;
@property (nonatomic,copy)NSString* startHour;
@property (nonatomic,copy)NSString* startMinute;
@property (nonatomic,copy)NSString* startTime;
@end

@interface AllCourseList : PulaBaseParser
@property (nonatomic,copy)NSNumber* count;
@property (nonatomic,copy)NSArray* Rows;
@end



@interface AllCourseModel : NSObject
+(void)getAllCourse:(int)sortId sort:(int)sort page:(int)page size:(int)size success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure;
/*
+(void)getGoodsPeriodByCodeId:(int)codeId success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure;*/
@end




#endif /* AllCourseModel_h */
