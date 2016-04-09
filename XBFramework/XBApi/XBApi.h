//
//  XBApi.h
//  XBHttpClient
//


#import <Foundation/Foundation.h>
#import "XBHttpClient.h"


@interface XBApi : NSObject

+ (instancetype)SharedXBApi;

- (void)requestWithURL:(NSString *)url
                 paras:(NSDictionary *)parasDict
                  type:(XBHttpResponseType)type
               success:(void(^)(AFHTTPRequestOperation* operation, NSObject *resultObject))success
               failure:(void(^)(NSError *requestErr))failure ;
- (void)requestWithURL2:(NSString *)url
                referer:(NSString *)refer
                  paras:(NSDictionary *)parasDict
                   type:(XBHttpResponseType)type
                success:(void(^)(AFHTTPRequestOperation* operation, NSObject *resultObject))success
                failure:(void(^)(NSError *requestErr))failure;
@end
