//
//  JXCategoryBaseCell.h
//  UI系列测试
//
//  Created by jiaxin on 2018/3/15.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXJXCategoryBaseCellModel.h"

@interface JXJXCategoryBaseCell : UICollectionViewCell

@property (nonatomic, strong) JXJXCategoryBaseCellModel *cellModel;

- (void)initializeViews NS_REQUIRES_SUPER;

- (void)reloadData:(JXJXCategoryBaseCellModel *)cellModel NS_REQUIRES_SUPER;

@end
