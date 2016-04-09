

#import "UIImageView+NoMapMode.h"

@implementation UIImageView (NoMapMode)

- (void)setImage_oy:(NSString*)baseUrl image:(NSString *)image
{
    BOOL on = [[[NSUserDefaults standardUserDefaults] objectForKey:kNoMapMode] boolValue];
    if(on && ![[AFNetworkReachabilityManager sharedManager] isReachableViaWiFi])    {
        [self setImage:[UIImage imageNamed:@"noimage"]];
    }
    else
    {
        NSString* url = nil;
        if(baseUrl)
            url = [baseUrl stringByAppendingString:image];
        else
            url = image;
        [self sd_setImageWithURL:[NSURL URLWithString:url]];
    }
}
@end
