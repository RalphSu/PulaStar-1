//
//  XBBaseVC.h


#import <UIKit/UIKit.h>

@interface XBBaseVC : UIViewController


#pragma mark UI related properties & functions
@property (nonatomic, assign) BOOL showBackBtn;
@property (nonatomic, assign) BOOL shareFriend;
@property (nonatomic,   copy) NSString *itemTitle;
@property (nonatomic,   copy) NSString *requestURL;
@property (nonatomic, strong) UIButton *navLeftBtn;
@property (nonatomic, strong) UIButton *navRightBtn;


- (void)actionCustomLeftBtnWithNrlImage:(NSString *)nrlImage htlImage:(NSString *)hltImage
                                  title:(NSString *)title
                                 action:(void(^)())btnClickBlock;
- (void)actionCustomRightBtnWithNrlImage:(NSString *)nrlImage htlImage:(NSString *)hltImage
                                   title:(NSString *)title
                                  action:(void(^)())btnClickBlock;
@end
