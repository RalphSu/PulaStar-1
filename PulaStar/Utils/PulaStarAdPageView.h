

#import <UIKit/UIKit.h>

@protocol PulaStarAdPageViewDelegate <NSObject>
- (void)click:(int)index;
@end

@interface PulaStarAdPageView : UIView
@property(nonatomic,weak)id<PulaStarAdPageViewDelegate> delegate;
- (void)setAds:(NSArray*)imgNameArr;
@end
