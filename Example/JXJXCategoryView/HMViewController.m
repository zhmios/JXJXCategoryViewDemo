//
//  HMViewController.m
//  JXJXCategoryView
//
//  Created by zhmios on 12/28/2018.
//  Copyright (c) 2018 zhmios. All rights reserved.
//

#import "HMViewController.h"
#import "JXJXCategoryView.h"
#import "UBOneLessonItemViewController.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define UIColorHEXA(hex,a) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:a]
#define iPhoneX (CGSizeEqualToSize([[UIScreen mainScreen] bounds].size, CGSizeMake(375, 812))||CGSizeEqualToSize([[UIScreen mainScreen] bounds].size, CGSizeMake(812,375))||CGSizeEqualToSize([[UIScreen mainScreen] bounds].size, CGSizeMake(414, 896))||CGSizeEqualToSize([[UIScreen mainScreen] bounds].size, CGSizeMake(896,414)))



@interface HMViewController ()<JXCategoryViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) JXJXCategoryBaseView *categoryView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) JXJXCategoryIndicatorLineView *lineView;
@property (nonatomic, assign) CGFloat navigationBarHeight;
@property (nonatomic, strong) NSMutableArray *titles;

@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
    self.scrollView.bounces = YES;
    [self.view addSubview:self.categoryView];

    JXJXCategoryTitleView *titleCategoryView = (JXJXCategoryTitleView *)self.categoryView;

    titleCategoryView.titleColorGradientEnabled = YES;
    titleCategoryView.titleLabelZoomEnabled = YES;
    titleCategoryView.titleLabelZoomScale = 1.20;
    titleCategoryView.titleColor = UIColorHEXA(0x7e7e85, 1.0);
    titleCategoryView.titleSelectedColor = UIColorHEXA(0x090821,1.0);
    titleCategoryView.titleFont = [UIFont systemFontOfSize:14];
    titleCategoryView.titleSelectedFont  = [UIFont systemFontOfSize:14];
    titleCategoryView.cellSpacing = 25;
    
    JXJXCategoryIndicatorLineView *lineView = [[JXJXCategoryIndicatorLineView alloc] init];
    lineView.indicatorLineWidth = JXCategoryViewAutomaticDimension;
    lineView.indicatorLineViewColor = UIColorHEXA(0xffd100, 1.0);
    lineView.lineWidthFactor = 1.20;
    lineView.lineExtWidth = 6;
    titleCategoryView.indicators = @[lineView];
    self.lineView = lineView;
    self.titles = [[NSMutableArray alloc] init];
    [self.titles addObjectsFromArray:@[@"全部",@"高中数学"]];
    
    for (int i = 0; i < self.titles.count; i ++) {
        
        UBOneLessonItemViewController *listVC = [[[self preferredListViewControllerClass] alloc] init];
      
        [self addChildViewController:listVC];
        listVC.view.frame = CGRectMake(i*width, 0, width, height);
        [self.scrollView addSubview:listVC.view];
    }
    self.scrollView.contentSize = CGSizeMake(width*self.titles.count, height);
    JXJXCategoryTitleView *myCategoryView = (JXJXCategoryTitleView *)self.categoryView;
    myCategoryView.titles = self.titles;
    [myCategoryView reloadData];
    
}

- (JXJXCategoryBaseView *)categoryView {
    if (_categoryView == nil) {
        
        _categoryView = [[JXJXCategoryLeftTitleView alloc] initWithLeftStyle:25 cellSpacing:25];
    }
    return _categoryView;
}

- (Class)preferredCategoryViewClass {
    return [JXJXCategoryLeftTitleView class];
}
- (Class)preferredListViewControllerClass {
    
    return [UBOneLessonItemViewController class];
}

- (CGFloat)preferredCategoryViewHeight {
    return 45;
}

-(CGFloat)navigationBarHeight{
    return 50;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
