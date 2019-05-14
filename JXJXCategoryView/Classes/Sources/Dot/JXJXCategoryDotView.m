//
//  JXCategoryDotView.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/20.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "JXJXCategoryDotView.h"

@implementation JXJXCategoryDotView

- (void)initializeData {
    [super initializeData];

    _relativePosition = JXCategoryDotRelativePosition_TopRight;
    _dotSize = CGSizeMake(10, 10);
    _dotCornerRadius = JXCategoryViewAutomaticDimension;
    _dotColor = [UIColor redColor];
}

- (Class)preferredCellClass {
    return [JXJXCategoryDotCell class];
}

- (void)refreshDataSource {
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0; i < self.titles.count; i++) {
        JXJXCategoryDotCellModel *cellModel = [[JXJXCategoryDotCellModel alloc] init];
        [tempArray addObject:cellModel];
    }
    self.dataSource = tempArray;
}

- (void)refreshCellModel:(JXJXCategoryBaseCellModel *)cellModel index:(NSInteger)index {
    [super refreshCellModel:cellModel index:index];

    JXJXCategoryDotCellModel *myCellModel = (JXJXCategoryDotCellModel *)cellModel;
    myCellModel.dotHidden = [self.dotStates[index] boolValue];
    myCellModel.relativePosition = self.relativePosition;
    myCellModel.dotSize = self.dotSize;
    myCellModel.dotColor = self.dotColor;
    if (self.dotCornerRadius == JXCategoryViewAutomaticDimension) {
        myCellModel.dotCornerRadius = self.dotSize.height/2;
    }else {
        myCellModel.dotCornerRadius = self.dotCornerRadius;
    }
}

@end
