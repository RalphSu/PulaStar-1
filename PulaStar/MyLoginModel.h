//
//  MyLoginModel.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/12.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef MyLoginModel_h
#define MyLoginModel_h

#import <Foundation/Foundation.h>

@interface LoginParser : PulaBaseParser
@property (nonatomic,copy)NSNumber* state;
@end

@interface LoginOkParser : PulaBaseParser
@end

@interface MyLoginModel : NSObject

+ (void)doUserLogin:(NSString*)name pwd:(NSString*)pwd success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure;

+ (void)doUserGetInfo:(NSString*)name pwd:(NSString*)pwd success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure;

+ (NSInteger)getUserAge:(NSString *)birthday;

+ (void)doChangePassword:(NSString*)name oldPwd:(NSString*)oldPwd  newPwd:(NSString*)newPwd success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure;

+ (void)resetPassword:(NSString*)mobile success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure;

+ (void)getUserCourseInfo:(NSString*)name success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure;

+ (BOOL)isMobileNumber:(NSString *)mobileNum;

+ (void)auditionCreate:(NSString *)parentName studentName:(NSString *)studentName branchNo:(NSString *)branchNo bookingTime:(NSString *)bookingTime age:(NSString *)age phone:(NSString *)phone success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure;
@end


#endif /* MyLoginModel_h */
