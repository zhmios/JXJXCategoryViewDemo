//
//  JXCategoryImageView.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/20.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "JXJXCategoryImageView.h"
#import "JXJXCategoryFactory.h"

@implementation JXJXCategoryImageView

- (void)dealloc
{
    self.loadImageCallback = nil;
}

- (void)initializeData {
    [super initializeData];

    _imageSize = CGSizeMake(20, 20);
    _imageZoomEnabled = NO;
    _imageZoomScale = 1.2;
}

- (Class)preferredCellClass {
    return [JXCategoryImageCell class];
}

- (void)refreshDataSource {
    NSMutableArray *tempArray = [NSMutableArray array];
    NSUInteger count = (self.imageNames.count > 0) ? self.imageNames.count : (self.imageURLs.count > 0 ? self.imageURLs.count : 0);
    for (int i = 0; i < count; i++) {
        JXCategoryImageCellModel *cellModel = [[JXCategoryImageCellModel alloc] init];
        [tempArray addObject:cellModel];
    }
    self.dataSource = tempArray;
}

- (void)refreshSelectedCellModel:(JXJXCategoryBaseCellModel *)selectedCellModel unselectedCellModel:(JXJXCategoryBaseCellModel *)unselectedCellModel {
    [super refreshSelectedCellModel:selectedCellModel unselectedCellModel:unselectedCellModel];

    JXCategoryImageCellModel *myUnselectedCellModel = (JXCategoryImageCellModel *)unselectedCellModel;
    myUnselectedCellModel.imageZoomScale = 1.0;

    JXCategoryImageCellModel *myselectedCellModel = (JXCategoryImageCellModel *)selectedCellModel;
    myselectedCellModel.imageZoomScale = self.imageZoomScale;
}

- (void)refreshCellModel:(JXJXCategoryBaseCellModel *)cellModel index:(NSInteger)index {
    [super refreshCellModel:cellModel index:index];

    JXCategoryImageCellModel *myCellModel = (JXCategoryImageCellModel *)cellModel;
    myCellModel.loadImageCallback = self.loadImageCallback;
    myCellModel.imageSize = self.imageSize;
    if (self.imageNames != nil) {
        myCellModel.imageName = self.imageNames[index];
    }else if (self.imageURLs != nil) {
        myCellModel.imageURL = self.imageURLs[index];
    }
    if (self.selectedImageNames != nil) {
        myCellModel.selectedImageName = self.selectedImageNames[index];
    }else if (self.selectedImageURLs != nil) {
        myCellModel.selectedImageURL = self.selectedImageURLs[index];
    }
    myCellModel.imageZoomEnabled = self.imageZoomEnabled;
    myCellModel.imageZoomScale = 1.0;
    if (index == self.selectedIndex) {
        myCellModel.imageZoomScale = self.imageZoomScale;
    }
}

- (void)refreshLeftCellModel:(JXJXCategoryBaseCellModel *)leftCellModel rightCellModel:(JXJXCategoryBaseCellModel *)rightCellModel ratio:(CGFloat)ratio {
    [super refreshLeftCellModel:leftCellModel rightCellModel:rightCellModel ratio:ratio];

    JXCategoryImageCellModel *leftModel = (JXCategoryImageCellModel *)leftCellModel;
    JXCategoryImageCellModel *rightModel = (JXCategoryImageCellModel *)rightCellModel;

    if (self.imageZoomEnabled) {
        leftModel.imageZoomScale = [JXJXCategoryFactory interpolationFrom:self.imageZoomScale to:1.0 percent:ratio];
        rightModel.imageZoomScale = [JXJXCategoryFactory interpolationFrom:1.0 to:self.imageZoomScale percent:ratio];
    }
}

- (CGFloat)preferredCellWidthAtIndex:(NSInteger)index {
    return self.imageSize.width;
}

@end
