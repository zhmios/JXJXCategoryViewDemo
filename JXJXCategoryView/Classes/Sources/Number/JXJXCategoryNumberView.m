//
//  JXCategoryNumberView.m
//  DQGuess
//
//  Created by jiaxin on 2018/4/9.
//  Copyright © 2018年 jingbo. All rights reserved.
//

#import "JXJXCategoryNumberView.h"

@implementation JXJXCategoryNumberView

- (void)initializeData {
    [super initializeData];

    self.cellSpacing = 25;
}

- (Class)preferredCellClass {
    return [JXJXCategoryNumberCell class];
}

- (void)refreshDataSource {
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0; i < self.titles.count; i++) {
        JXJXCategoryNumberCellModel *cellModel = [[JXJXCategoryNumberCellModel alloc] init];
        [tempArray addObject:cellModel];
    }
    self.dataSource = tempArray;
}

- (void)refreshCellModel:(JXJXCategoryBaseCellModel *)cellModel index:(NSInteger)index {
    [super refreshCellModel:cellModel index:index];

    JXJXCategoryNumberCellModel *myCellModel = (JXJXCategoryNumberCellModel *)cellModel;
    myCellModel.count = [self.counts[index] integerValue];
}

@end
