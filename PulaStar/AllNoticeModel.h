//
//  AllNoticeModel.h
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/5.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#ifndef AllNoticeModel_h
#define AllNoticeModel_h

#import <Foundation/Foundation.h>


@interface AllNoticeItem : PulaBaseParser

@property (nonatomic,copy)NSString* noticeSub;
@property (nonatomic,copy)NSString* noticeFp;
@end

@interface AllNoticeList : PulaBaseParser
@property (nonatomic,copy)NSNumber* count;
@property (nonatomic,copy)NSArray* Rows;
@end



@interface AllNoticeModel : NSObject
+(void)getAllNotice:(int)sortId sort:(int)sort page:(int)page size:(int)size success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure;

@end



#endif /* AllNoticeModel_h */
