//
//  UBOneLessonListViewController.m
//  LBOC_Student
//
//  Created by zhm on 2018/12/28.
//  Copyright © 2018 dfub.xdf.com. All rights reserved.
//

#import "UBOneLessonListViewController.h"
#import "UBOneLessonRightGradientView.h"
#import "UBOneLessonItemViewController.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define UIColorHEX(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0]

#define UIColorHEXA(hex,a) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:a]

//#import "UINavigationController+FDFullscreenPopGesture.h"

@interface UBOneLessonListViewController ()<JXCategoryViewDelegate, UIScrollViewDelegate>
@property(nonatomic,strong)UBOneLessonRightGradientView *gradientView;
@property(nonatomic,strong)NSMutableArray *titiles;
@property(nonatomic,assign)CGFloat navigationBarHeight;

@end

@implementation UBOneLessonListViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _shouldHandleScreenEdgeGesture = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBarHeight = 88;
    [self assignUI];
    [self makeDataSource];

   
}

- (UBOneLessonRightGradientView *)gradientView{
    
    if (!_gradientView) {
         CGFloat categoryViewHeight = [self preferredCategoryViewHeight];
        _gradientView = [[UBOneLessonRightGradientView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 60, self.navigationBarHeight, 60, categoryViewHeight)];
    }
    return _gradientView;
}
- (NSMutableArray *)titiles{
    
    if (!_titiles) {
        _titiles = [[NSMutableArray alloc] init];
    }
    return _titiles;
}

- (void)assignUI{
    self.view.backgroundColor = [UIColor whiteColor];
//    self.navigationTitle = @"冲刺提分一对一";
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//   self.scrollView.panGestureRecognizer.delegate = self;
    CGFloat categoryViewHeight = [self preferredCategoryViewHeight];
    CGFloat width = SCREEN_WIDTH;
    CGFloat height =SCREEN_HEIGHT - self.navigationBarHeight - categoryViewHeight;
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,self.navigationBarHeight + categoryViewHeight, width, height)];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = YES;
    [self.view addSubview:self.scrollView];
    
    if (@available(iOS 11.0, *)) {
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.categoryView.frame = CGRectMake(0, self.navigationBarHeight, SCREEN_WIDTH, categoryViewHeight);
    self.categoryView.delegate = self;
    self.categoryView.contentScrollView = self.scrollView;
    [self.view addSubview:self.categoryView];
    [self.view addSubview:self.gradientView];
   
    JXCategoryTitleView *titleCategoryView = (JXCategoryTitleView *)self.categoryView;
    self.isNeedIndicatorPositionChangeItem = YES;
    titleCategoryView.titleColorGradientEnabled = YES;
    titleCategoryView.titleLabelZoomEnabled = YES;
    titleCategoryView.titleLabelZoomScale = 1.28;
    titleCategoryView.titleColor = UIColorHEXA(0x7e7e85, 1.0);
    titleCategoryView.titleSelectedColor = UIColorHEX(0x090821);
    titleCategoryView.titleFont = [UIFont boldSystemFontOfSize:14];
    titleCategoryView.titleSelectedFont  = [UIFont boldSystemFontOfSize:14];
    titleCategoryView.cellSpacing = 25;
    titleCategoryView.isShowSelectedAnimation = YES;
    
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorLineWidth = JXCategoryViewAutomaticDimension;
    lineView.lineWidthFactor = 1.28;
    lineView.lineExtWidth = 6;
    lineView.indicatorLineViewColor = UIColorHEXA(0xffd100, 1.0);
    titleCategoryView.indicators = @[lineView];

}

- (void)makeDataSource{
    
    double delayInSeconds = 0.0;
//    [self showProgressInitializeDataWithView:self.view];
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        [self hideProgressView:self.view];
        [self reloadServerData];
       
        
        
    });

}

- (void)reloadServerData{
    [self.titiles removeAllObjects];
    [self.titiles addObjectsFromArray:@[@"全部", @"初二英语", @"初二数学", @"初三语文",@"初三物理",@"初三化学",@"高一语文",@"高一地理"]];
    
    CGFloat width = SCREEN_WIDTH;
    CGFloat categoryViewHeight = [self preferredCategoryViewHeight];
    CGFloat height =SCREEN_HEIGHT - self.navigationBarHeight - categoryViewHeight;
    
    for (int i = 0; i < self.titiles.count; i ++) {
        
        UBOneLessonItemViewController *listVC = [[[self preferredListViewControllerClass] alloc] init];
        listVC.view.backgroundColor = [UIColor colorWithRed:(arc4random() % 255) / 255.0 green:(arc4random() % 255) / 255.0 blue:(arc4random() % 255) / 255.0 alpha:1.0];
        [self configListViewController:listVC index:i];
        [self addChildViewController:listVC];
        listVC.view.frame = CGRectMake(i*width, 0, width, height);
        [self.scrollView addSubview:listVC.view];
    }
    self.scrollView.contentSize = CGSizeMake(width*self.titiles.count, height);
    JXCategoryTitleView *myCategoryView = (JXCategoryTitleView *)self.categoryView;
    myCategoryView.titles = self.titiles;
    [myCategoryView reloadData];
    
}


- (Class)preferredCategoryViewClass {
    return [JXCategoryTitleView class];
}

- (CGFloat)preferredCategoryViewHeight {
    return 50;
}

- (Class)preferredListViewControllerClass {
    
    return [UBOneLessonItemViewController class];
}

- (void)configListViewController:(UIViewController *)controller index:(NSUInteger)index {
    
}

- (JXCategoryBaseView *)categoryView {
    if (_categoryView == nil) {
        _categoryView = [[[self preferredCategoryViewClass] alloc] init];
    }
    return _categoryView;
}

- (void)rightItemClicked {
    JXCategoryIndicatorView *componentView = (JXCategoryIndicatorView *)self.categoryView;
    for (JXCategoryIndicatorComponentView *view in componentView.indicators) {
        if (view.componentPosition == JXCategoryComponentPosition_Top) {
            view.componentPosition = JXCategoryComponentPosition_Bottom;
        }else {
            view.componentPosition = JXCategoryComponentPosition_Top;
        }
    }
    [componentView reloadData];
}

#pragma mark - JXCategoryViewDelegate

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    //侧滑手势处理
    if (_shouldHandleScreenEdgeGesture) {
        self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
    }
    
}


@end
