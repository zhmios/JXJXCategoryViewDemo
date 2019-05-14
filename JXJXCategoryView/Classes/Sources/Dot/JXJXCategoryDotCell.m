//
//  JXCategoryDotCell.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/20.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "JXJXCategoryDotCell.h"
#import "JXJXCategoryDotCellModel.h"

@interface JXJXCategoryDotCell ()
@property (nonatomic, strong) CALayer *dotLayer;
@end

@implementation JXJXCategoryDotCell

- (void)initializeViews {
    [super initializeViews];

    _dotLayer = [CALayer layer];
    [self.contentView.layer addSublayer:self.dotLayer];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    [CATransaction begin];
    [CATransaction setDisableActions:YES];

    JXJXCategoryDotCellModel *myCellModel = (JXJXCategoryDotCellModel *)self.cellModel;
    self.dotLayer.bounds = CGRectMake(0, 0, myCellModel.dotSize.width, myCellModel.dotSize.height);
    switch (myCellModel.relativePosition) {
        case JXCategoryDotRelativePosition_TopLeft:
        {
            self.dotLayer.position = CGPointMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMinY(self.titleLabel.frame));
        }
            break;
        case JXCategoryDotRelativePosition_TopRight:
        {
            self.dotLayer.position = CGPointMake(CGRectGetMaxX(self.titleLabel.frame), CGRectGetMinY(self.titleLabel.frame));
        }
            break;
        case JXCategoryDotRelativePosition_BottomLeft:
        {
            self.dotLayer.position = CGPointMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.titleLabel.frame));
        }
            break;
        case JXCategoryDotRelativePosition_BottomRight:
        {
            self.dotLayer.position = CGPointMake(CGRectGetMaxX(self.titleLabel.frame), CGRectGetMaxY(self.titleLabel.frame));
        }
            break;

        default:
            break;
    }
    self.dotLayer.position = CGPointMake(CGRectGetMaxX(self.titleLabel.frame), CGRectGetMinY(self.titleLabel.frame));

    [CATransaction commit];
}

- (void)reloadData:(JXJXCategoryBaseCellModel *)cellModel {
    [super reloadData:cellModel];

    JXJXCategoryDotCellModel *myCellModel = (JXJXCategoryDotCellModel *)cellModel;
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.dotLayer.hidden = !myCellModel.dotHidden;
    self.dotLayer.backgroundColor = myCellModel.dotColor.CGColor;
    self.dotLayer.cornerRadius = myCellModel.dotCornerRadius;
    [CATransaction commit];

    [self setNeedsLayout];
    [self layoutIfNeeded];
}

@end
