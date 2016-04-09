//
//  AllActivityModel.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/5.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllActivityModel.h"


@implementation AllActivityItem

@synthesize activityPrice,activityId,activityNo,activityTitle,activityContent,activityUpdateTime,activityIconFileId,activityIconId;

@end

@implementation AllActivityList

@synthesize count,Rows;
+ (Class)Rows_class {
    return [AllActivityItem class];
}
@end



@implementation AllActivityModel

+(void)getAllActivity:(int)sortId sort:(int)sort page:(int)page size:(int)size success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure
{
    NSString* url = [NSString stringWithFormat:activityUrl,sortId,(page-1)*size,page*size - 1,sort];
    [[XBApi SharedXBApi] requestWithURL:url paras:nil type:XBHttpResponseType_Json success:success failure:failure];
}

@end