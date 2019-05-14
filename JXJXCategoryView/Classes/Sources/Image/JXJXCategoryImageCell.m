//
//  JXCategoryImageCell.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/20.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "JXJXCategoryImageCell.h"
#import "JXJXCategoryImageCellModel.h"

@implementation JXJXCategoryImageCell

- (void)initializeViews {
    [super initializeViews];

    _imageView = [[UIImageView alloc] init];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:_imageView];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    JXJXCategoryImageCellModel *myCellModel = (JXJXCategoryImageCellModel *)self.cellModel;
    self.imageView.bounds = CGRectMake(0, 0, myCellModel.imageSize.width, myCellModel.imageSize.height);
    self.imageView.center = self.contentView.center;
}

- (void)reloadData:(JXJXCategoryBaseCellModel *)cellModel {
    [super reloadData:cellModel];

    JXJXCategoryImageCellModel *myCellModel = (JXJXCategoryImageCellModel *)cellModel;
    if (myCellModel.imageName != nil) {
        self.imageView.image = [UIImage imageNamed:myCellModel.imageName];
    }else if (myCellModel.imageURL != nil) {
        if (myCellModel.loadImageCallback != nil) {
            myCellModel.loadImageCallback(self.imageView);
        }
    }
    if (myCellModel.selected) {
        if (myCellModel.selectedImageName != nil) {
            self.imageView.image = [UIImage imageNamed:myCellModel.selectedImageName];
        }else if (myCellModel.selectedImageURL != nil) {
            if (myCellModel.loadImageCallback != nil) {
                myCellModel.loadImageCallback(self.imageView);
            }
        }
    }

    if (myCellModel.imageZoomEnabled) {
        self.imageView.transform = CGAffineTransformMakeScale(myCellModel.imageZoomScale, myCellModel.imageZoomScale);
    }else {
        self.imageView.transform = CGAffineTransformIdentity;
    }
}

@end