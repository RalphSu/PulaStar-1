//
//  XBHttpClient.h
//  XBHttpClient
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef enum
{
    XBHttpResponseType_Json,
    XBHttpResponseType_JqueryJson,
    XBHttpResponseType_XML,
    XBHttpResponseType_Common
}XBHttpResponseType;

@interface XBHttpClient : AFHTTPRequestOperationManager


- (void)requestWithURL:(NSString *)url
                 paras:(NSDictionary *)parasDict
                  type:(XBHttpResponseType)type
               success:(void(^)(AFHTTPRequestOperation* operation, NSObject *resultObject))success
               failure:(void(^)(NSError *requestErr))failure ;

@end
