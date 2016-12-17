//
//  MyLoginModel.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/12.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyLoginModel.h"
/*
@implementation LoginParser
@synthesize state;
@end

@implementation LoginOkParser
@synthesize code;
@end
*/
@implementation MyLoginModel

+ (void)doUserLogin:(NSString*)name pwd:(NSString*)pwd success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure
{
    NSString* url = [NSString stringWithFormat:loginUrl,name,pwd];
    [[XBApi SharedXBApi] requestWithURL:url paras:nil type:XBHttpResponseType_JqueryJson success:success    failure:failure];
}


+ (void)doUserGetInfo:(NSString*)name pwd:(NSString*)pwd success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure
{
    NSString* url = [NSString stringWithFormat:getUserInfoUrl,name,pwd];
    [[XBApi SharedXBApi] requestWithURL:url paras:nil type:XBHttpResponseType_JqueryJson success:success    failure:failure];
}

+ (NSInteger)getUserAge:(NSString *)birthday
{
    if(birthday == nil)
        return 4;
    //NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    //[dateFormatter setDateFormat:@"MM/dd/yyyy"];
    //NSDate *date = [dateFormatter dateFromString:birthday];
    long long birth = [birthday longLongValue];
    
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:(NSTimeInterval)birth/1000];
    
    // 出生日期转换 年月日
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:date];
    NSInteger brithDateYear  = [components1 year];
    NSInteger brithDateDay   = [components1 day];
    NSInteger brithDateMonth = [components1 month];
    
    // 获取系统当前 年月日
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:[NSDate date]];
    NSInteger currentDateYear  = [components2 year];
    NSInteger currentDateDay   = [components2 day];
    NSInteger currentDateMonth = [components2 month];
    
    // 计算年龄
    NSInteger iAge = currentDateYear - brithDateYear - 1;
    if ((currentDateMonth > brithDateMonth) || (currentDateMonth == brithDateMonth && currentDateDay >= brithDateDay)) {
        iAge++;
    }
    
    return iAge;
    
    
}


+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSString *all = @"^1\\d{10}$";
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regentestAll = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",all];
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES)
        ||([regentestAll evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}



+ (void)doChangePassword:(NSString*)name oldPwd:(NSString*)oldPwd  newPwd:(NSString*)newPwd success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure
{
    NSString* url = [NSString stringWithFormat:changePasswordUrl,name,oldPwd,newPwd];
    [[XBApi SharedXBApi] requestWithURL:url paras:nil type:XBHttpResponseType_JqueryJson success:success    failure:failure];
}

+ (void)resetPassword:(NSString*)mobile success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure
{
    NSString* url = [NSString stringWithFormat:resetPasswordUrl,mobile];
    [[XBApi SharedXBApi] requestWithURL:url paras:nil type:XBHttpResponseType_JqueryJson success:success    failure:failure];
}

+ (void)getUserCourseInfo:(NSString*)name success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure
{
    NSString* url = [NSString stringWithFormat:getUserCourseUrl,name];
    [[XBApi SharedXBApi] requestWithURL:url paras:nil type:XBHttpResponseType_JqueryJson success:success    failure:failure];
}

+ (void)auditionCreate:(NSString *)parentName studentName:(NSString *)studentName branchNo:(NSString *)branchNo bookingTime:(NSString *)bookingTime age:(NSString*)age phone:(NSString *)phone success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure

{
    NSString *url = [NSString stringWithFormat:auditionCreateUrl,parentName,studentName,branchNo,bookingTime,age,phone];
    
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [[XBApi SharedXBApi] requestWithURL:url paras:nil type:XBHttpResponseType_JqueryJson success:success    failure:failure];
}




@end