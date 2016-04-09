//
//  AllNoticeModel.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/5.
//  Copyright © 2016年 PulaStar. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "AllNoticeModel.h"


@implementation AllNoticeItem
@synthesize noticeSub,noticeFp;
@end

@implementation AllNoticeList
@synthesize count,Rows;
+ (Class)Rows_class {
    return [AllNoticeItem class];
}
@end



@implementation AllNoticeModel

+(void)getAllNotice:(int)sortId sort:(int)sort page:(int)page size:(int)size success:(void(^)(AFHTTPRequestOperation* operation, NSObject* result))success failure:(void(^)(NSError* error))failure
{
    NSString* url = noticeUrl;
    
    NSLog(@"noticeURL %@",noticeUrl);
    
    [[XBApi SharedXBApi] requestWithURL:url paras:nil type:XBHttpResponseType_Json success:success failure:failure];
}



@end
