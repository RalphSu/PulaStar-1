//
//  PulaBaseVC.m


#import "PulaBaseVC.h"
#import "BaseNoDataView.h"
#import "BaseLoadView.h"


@interface PulaBaseVC ()<UIGestureRecognizerDelegate>
{
    BaseNoDataView      *viewEmpty;
    BaseLoadView        *viewLoad;
}
@end

@implementation PulaBaseVC

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    NSLog(@"%@ dealloc", [self class]);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSInteger count = self.navigationController.viewControllers.count;
    self.navigationController.interactivePopGestureRecognizer.enabled = count > 1;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addCartAnimation:) name:kDidAddCart object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addCartAnimation2:) name:kDidAddCartSearch object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addCartAnimation3:) name:kDidAddCartOpt object:nil];
    
    
    viewEmpty = [[BaseNoDataView alloc] initWithFrame:self.view.bounds];
    viewLoad = [[BaseLoadView alloc] initWithFrame:self.view.bounds];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.navigationController.viewControllers.count == 1)//关闭主界面的右滑返回
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

#pragma mark - addcart


#pragma mark - Empty
- (void)showEmpty
{
    viewEmpty.frame = self.view.bounds;
    [self.view addSubview:viewEmpty];
}

- (void)showEmpty:(CGRect)frame
{
    viewEmpty.frame = frame;
    [self.view addSubview:viewEmpty];
}

- (void)hideEmpty
{
    [viewEmpty removeFromSuperview];
}
#pragma mark - load
- (void)showLoad
{
    viewLoad.frame = self.view.bounds;
    [self.view addSubview:viewLoad];
}
- (void)hideLoad
{
    [viewLoad removeFromSuperview];
}
@end
