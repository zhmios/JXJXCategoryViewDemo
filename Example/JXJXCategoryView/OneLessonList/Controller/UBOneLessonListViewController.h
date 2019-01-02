//
//  UBOneLessonListViewController.h
//  LBOC_Student
//
//  Created by zhm on 2018/12/28.
//  Copyright © 2018 dfub.xdf.com. All rights reserved.
//

#import "LBOCBaseViewController.h"
#import "JXCategoryView.h"

@interface UBOneLessonListViewController : LBOCBaseViewController

@property (nonatomic, assign) BOOL isNeedIndicatorPositionChangeItem;

@property (nonatomic, strong) JXCategoryBaseView *categoryView;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, assign) BOOL shouldHandleScreenEdgeGesture;

- (Class)preferredCategoryViewClass;

- (NSUInteger)preferredListViewCount;

- (CGFloat)preferredCategoryViewHeight;

- (Class)preferredListViewControllerClass;

- (void)configListViewController:(UIViewController *)controller index:(NSUInteger)index;

@end

