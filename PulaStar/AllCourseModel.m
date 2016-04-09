//
//  AllCourseModel.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/2.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllCourseModel.h"


@implementation AllCourseItem
@synthesize branchName,classRoomName,courseId,courseName,courseNo,durationMinute,endTime,fileId,iconId,maxStudentNum,price,startHour,startMinute,startTime;
@end

@implementation AllCourseList
@synthesize count,Rows;
+ (Class)Rows_class {
    return [AllCourseItem class];
}
@end



@implementation AllCourseModel

+(void)getAllCourse:(int)sortId sort:(int)sort page:(int)page size:(int)size success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure
{
    NSString* url = [NSString stringWithFormat:courseUrl,sortId,(page-1)*size,page*size - 1,sort];
    [[XBApi SharedXBApi] requestWithURL:url paras:nil type:XBHttpResponseType_Json success:success failure:failure];
}

/*
+(void)getGoodsPeriodByCodeId:(int)codeId success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure
{
    NSString* url = [NSString stringWithFormat:oyGoodsByCodeId,codeId];
    [[XBApi SharedXBApi] requestWithURL:url paras:nil type:XBHttpResponseType_Json success:success failure:failure];
}
*/

@end
