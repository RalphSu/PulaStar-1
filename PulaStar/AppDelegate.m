

#import "AppDelegate.h"
#import "TabNoticeVC.h"
#import "TabCourseVC.h"
#import "TabActivityVC.h"
#import "APService.h"

#import "TabCourseVC.h"
#import "TabMineInfoVC.h"
#import "PulaResponseView.h"

//#import "WXApi.h"

#define oyUseLib    0

@interface AppDelegate () <UITabBarControllerDelegate>


@end

@implementation AppDelegate


- (UIViewController*)loadFramework
{
    NSLog(@"%@",NSHomeDirectory());
    NSString* libFile = [NSString stringWithFormat:@"%@/Documents/OY.framework",NSHomeDirectory()];
    //判断一下有没有这个文件的存在　如果没有直接跳出
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:libFile]) {
        NSLog(@"There isn't have the file");
        return nil;
    }
    
    //复制到程序中
    NSError *error = nil;
    
    NSBundle *frameworkBundle = [NSBundle bundleWithPath:libFile];
    if (frameworkBundle && [frameworkBundle load]) {
        NSLog(@"bundle load framework success.");
    }else {
        NSLog(@"bundle load framework err:%@",error);
        return nil;
    }
    
    Class pacteraClass = NSClassFromString(@"OYMainClass");
    if (!pacteraClass) {
        NSLog(@"Unable to get TestDylib class");
        return nil;
    }
    
    NSObject *pacteraObject = [pacteraClass new];//必须new
    NSArray* vcs = [pacteraObject performSelector:@selector(getMainTabVC:appDelegate:) withObject:_window withObject:self];
    
    [frameworkBundle unload];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = vcs;
    tabBarController.delegate = self;
    
    
    // customise TabBar UI Effect
    [UITabBar appearance].tintColor = BG_COLOR;
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:TABBAR_TEXT_NOR_COLOR} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:MYINFO_NAVBAR_COLOR} forState:UIControlStateSelected];
    
    // customise NavigationBar UI Effect
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithRenderColor:BG_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16.],NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    
    UITabBar *tabBar = tabBarController.tabBar;
    tabBar.backgroundColor = BG_COLOR;

    
    return tabBarController;
}

- (UITabBarController*)setRootVC:(BOOL)bShowCart
{
    
    /*
    TabHomeVC *homeVC = [[TabHomeVC alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    UIImage *unselectedImage = [UIImage imageNamed:@"tab-home"];
    UIImage *selectedImage = [UIImage imageNamed:@"tab-home-s"];
    
    homeVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页"
                                                      image:[unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                              selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    homeVC.tabBarItem.tag = 0;
    */
    
    /*
    UIViewController *homeVC = [[UIViewController alloc] init];
    
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    UIImage *unselectedImage = [UIImage imageNamed:@"tab-home"];
    UIImage *selectedImage = [UIImage imageNamed:@"tab-home-s"];
    homeVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"活动"
                                                      image:[unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                              selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    homeVC.tabBarItem.tag = 0;
    */
    
    TabActivityVC *activityVC = [[TabActivityVC alloc] init];
    
    UINavigationController *activityNav = [[UINavigationController alloc] initWithRootViewController:activityVC];
    
    UIImage *unselectedImage = [UIImage imageNamed:@"tab-activity"];
    UIImage *selectedImage = [UIImage imageNamed:@"tab-activity-s"];
    activityVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"活动"
                                                      image:[unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                              selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    activityVC.tabBarItem.tag = 0;
    
    
    [activityVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:TABBAR_TEXT_NOR_COLOR} forState:UIControlStateNormal];
    
    [activityVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:MYINFO_NAVBAR_COLOR} forState:UIControlStateSelected];
    
    /*
    
    TabProductVC *proVC = [[TabProductVC alloc] init];
    UINavigationController *proNav = [[UINavigationController alloc] initWithRootViewController:proVC];
    unselectedImage = [UIImage imageNamed:@"tab-pro"];
    selectedImage = [UIImage imageNamed:@"tab-pro-s"];
    
    proNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"课程"
                                                      image:[unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                              selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    proNav.tabBarItem.tag = 1;
   */
    
    TabCourseVC *courseVC = [[TabCourseVC alloc] init];
    UINavigationController *courseNav = [[UINavigationController alloc] initWithRootViewController:courseVC];
    unselectedImage = [UIImage imageNamed:@"tab-course"];
    selectedImage = [UIImage imageNamed:@"tab-course-s"];
    
    [courseNav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:TABBAR_TEXT_NOR_COLOR} forState:UIControlStateNormal];
    
    [courseNav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:MYINFO_NAVBAR_COLOR} forState:UIControlStateSelected];
    
    courseNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"课程"
                                                      image:[unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                              selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    courseNav.tabBarItem.tag = 1;
    

    
  /*
    UIViewController *newVc = [[UIViewController alloc] init];
    
    UINavigationController *newNav = [[UINavigationController alloc] initWithRootViewController:newVc];
    
    unselectedImage = [UIImage imageNamed:@"tab-new"];
    selectedImage = [UIImage imageNamed:@"tab-new-s"];
    newNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"上传作品"
                                                      image:[unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                              selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    newNav.tabBarItem.tag = 2;
  */
    TabNoticeVC *noticeVC = [[TabNoticeVC alloc] init];
    
    UINavigationController *noticeNav = [[UINavigationController alloc] initWithRootViewController:noticeVC];
    
    unselectedImage = [UIImage imageNamed:@"tab-notify"];
    selectedImage = [UIImage imageNamed:@"tab-notify-s"];
    noticeNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"通告"
                                                      image:[unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                              selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    noticeNav.tabBarItem.tag = 2;
    
    
    [noticeNav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:TABBAR_TEXT_NOR_COLOR} forState:UIControlStateNormal];
    
    [noticeNav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:MYINFO_NAVBAR_COLOR} forState:UIControlStateSelected];
    
    
    UIViewController *cartVc = [[UIViewController alloc] init];
    
    UINavigationController *cartNav = [[UINavigationController alloc] initWithRootViewController:cartVc];
    
    unselectedImage = [UIImage imageNamed:@"tab-mine"];
    selectedImage = [UIImage imageNamed:@"tab-mine-s"];
    cartNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"购物车"
                                                      image:[unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                              selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    cartNav.tabBarItem.tag = 3;
    
    TabMineInfoVC *mineInfoVc = [[TabMineInfoVC alloc] init];
    
    UINavigationController *mineInfoNav = [[UINavigationController alloc] initWithRootViewController:mineInfoVc];
    
    unselectedImage = [UIImage imageNamed:@"tab-mine"];
    selectedImage = [UIImage imageNamed:@"tab-mine-s"];
    
    mineInfoNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的"
                                                       image:[unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                               selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    mineInfoNav.tabBarItem.tag = 4;
    
    
    [mineInfoNav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:TABBAR_TEXT_NOR_COLOR} forState:UIControlStateNormal];
    
    [mineInfoNav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:MYINFO_NAVBAR_COLOR} forState:UIControlStateSelected];
    
    
    /*
    UIViewController *mineVc = [[UIViewController alloc] init];
    
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mineVc];
    
    unselectedImage = [UIImage imageNamed:@"tab-cart"];
    selectedImage = [UIImage imageNamed:@"tab-cart-s"];
    
    mineNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我"
                                                       image:[unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                               selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    mineNav.tabBarItem.tag = 4;
    */
    
    /*
    TabNewestVC * newVc = [[TabNewestVC alloc] init];
    UINavigationController * newNav = [[UINavigationController alloc] initWithRootViewController:newVc];
    unselectedImage = [UIImage imageNamed:@"tab-new"];
    selectedImage = [UIImage imageNamed:@"tab-new-s"];
    
    newNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"最新揭晓"
                                                       image:[unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                               selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    newNav.tabBarItem.tag = 2;
    
    TabShopCartVC * cartVc = [[TabShopCartVC alloc] init];
    UINavigationController * cartNav = [[UINavigationController alloc] initWithRootViewController:cartVc];
    unselectedImage = [UIImage imageNamed:@"tab-cart"];
    selectedImage = [UIImage imageNamed:@"tab-cart-s"];
    
    cartNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"购物车"
                                                      image:[unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                              selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    cartNav.tabBarItem.tag = 3;
    
    TabMineVC * mineVc = [[TabMineVC alloc] init];
    UINavigationController * mineNav = [[UINavigationController alloc] initWithRootViewController:mineVc];
    unselectedImage = [UIImage imageNamed:@"tab-mine"];
    selectedImage = [UIImage imageNamed:@"tab-mine-s"];
    
    mineNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的云购"
                                                       image:[unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                               selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    mineNav.tabBarItem.tag = 4;
    
    */
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    //if(bShowCart)
    //    tabBarController.viewControllers = @[activityNav,courseNav,newNav,cartNav,mineNav];
    //else
        tabBarController.viewControllers = @[activityNav,courseNav,noticeNav,mineInfoNav];
    tabBarController.delegate = self;
    
    
    // customise TabBar UI Effect
    [UITabBar appearance].tintColor = nil;
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:TABBAR_TEXT_NOR_COLOR} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:MYINFO_NAVBAR_COLOR} forState:UIControlStateSelected];
    
    // customise NavigationBar UI Effect
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithRenderColor:BG_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16.],NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    
    UITabBar *tabBar = tabBarController.tabBar;
    tabBar.backgroundColor = BG_COLOR;
    
    
    tabBar.backgroundImage = [UIImage imageNamed:@"yyg_center"];
    
    return tabBarController;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /*
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadApp) name:kDidShowCart object:nil];
    */
   
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
//    [self setUmeng];
//    [self setJPush:launchOptions];
    
    [self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
    
    UIViewController *rootViewController = [self setRootVC:YES];
    [[self window] setRootViewController:rootViewController];

    
    // set  backgroundColor
    [[self window] setBackgroundColor:[UIColor whiteColor]];
    // set  makeKeyAndVisible
    [[self window] makeKeyAndVisible];
    
//    UIViewController* vcMain = [self loadFramework];
//    if (vcMain && oyUseLib)
//    {
//        [[self window] setRootViewController:vcMain];
//    }
//    else
//    {
//        UIViewController *rootViewController = [self setRootVC:NO];
//        [[self window] setRootViewController:rootViewController];
//        [self setCartNum];
//    }
    //[WXApi registerApp:@"wx90816ac92bb628a7"];
    
    
    return YES;
}

- (void)reloadApp
{
    UIViewController* vcMain = [self loadFramework];
    if (vcMain && oyUseLib)
    {
        [[self window] setRootViewController:vcMain];
    }
    else
    {
        UIViewController *rootViewController = [self setRootVC:YES];
        [[self window] setRootViewController:rootViewController];
      
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    //[[NSNotificationCenter defaultCenter] postNotificationName:kDidNotifyFromBack object:nil];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - thidr part
#pragma mark - umeng

/*
#pragma mark - JPush
- (void)setJPush:(NSDictionary*)launchOptions
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        [APService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                       UIUserNotificationTypeSound |
                                                       UIUserNotificationTypeAlert)
                                           categories:nil];
    } else {
        //categories 必须为nil
        [APService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                       UIRemoteNotificationTypeSound |
                                                       UIRemoteNotificationTypeAlert)
                                           categories:nil];
    }
#else
    //categories 必须为nil
    [APService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                   UIRemoteNotificationTypeSound |
                                                   UIRemoteNotificationTypeAlert)
                                       categories:nil];
#endif
    // Required
    [APService setupWithOption:launchOptions];
}

*/

#pragma mark - push app delegate
/*
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Required
    [APService registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    // Required
    [APService handleRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    // IOS 7 Support Required
    [APService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
    
    //[[NSNotificationCenter defaultCenter] postNotificationName:kDidNotifyApns object:[[userInfo objectForKey:@"aps"] objectForKey:@"alert"]];
}
*/

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

/*
- (BOOL)application:(UIApplication *)application handleOpenURL:(nonnull NSURL *)url
{
    return [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [WXApi handleOpenURL:url delegate:self];
}


#pragma mark WXApiDelegate
- (void)onResp:(BaseResp *)resp
{
    PulaResponseView *responseView = (PulaResponseView*)[[[NSBundle mainBundle] loadNibNamed:@"PulaResponseView" owner:self options:nil] lastObject];
    //分享成功
    if(resp.errCode == 0)
    {
        responseView.response = @"分享成功";
        responseView.imgName = @"success.png";
    }
    else
    {
        //分享失败
        responseView.response = @"分享失败";
        responseView.imgName = @"failure.png";
    }
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    __block CGRect responseViewFrame = responseView.frame;
    responseViewFrame.origin.x = screenSize.width/2 - CGRectGetWidth(responseViewFrame)/2;
    responseViewFrame.origin.y = screenSize.height/2 - CGRectGetHeight(responseViewFrame)/2;
    responseView.frame = responseViewFrame;
    responseView.alpha = 0;
    [keyWindow addSubview:responseView];
    [UIView animateWithDuration:1.5f animations:^{
        responseView.alpha = 1.0f;
    } completion:^(BOOL finished){
        responseView.alpha = 0.0f;
        [responseView removeFromSuperview];
    }];
}

*/


@end
