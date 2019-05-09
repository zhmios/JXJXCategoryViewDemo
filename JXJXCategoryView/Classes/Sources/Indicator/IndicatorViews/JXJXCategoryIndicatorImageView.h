//
//  JXCategoryIndicatorImageView.h
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/17.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "JXJXCategoryIndicatorComponentView.h"

@interface JXJXCategoryIndicatorImageView : JXJXCategoryIndicatorComponentView

@property (nonatomic, strong, readonly) UIImageView *indicatorImageView;

@property (nonatomic, assign) BOOL indicatorImageViewRollEnabled;      //默认NO

@property (nonatomic, assign) CGSize indicatorImageViewSize;    //默认：CGSizeMake(30, 20)

@end
