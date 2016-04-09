//
//  PulaBaseVC.h


#import <UIKit/UIKit.h>

@interface PulaBaseVC : XBBaseVC

- (void)addCartAnimation:(UIImageView*)sourceView;

#pragma mark - Empty
- (void)showEmpty;
- (void)showEmpty:(CGRect)frame;
- (void)hideEmpty;

#pragma mark - load
- (void)showLoad;
- (void)hideLoad;
@end
