//
//  JXCategoryComponetCell.m
//  DQGuess
//
//  Created by jiaxin on 2018/7/25.
//  Copyright © 2018年 jingbo. All rights reserved.
//

#import "JXJXCategoryIndicatorCell.h"
#import "JXJXCategoryIndicatorCellModel.h"

@interface JXJXCategoryIndicatorCell ()
@property (nonatomic, strong) UIView *separatorLine;
@end

@implementation JXJXCategoryIndicatorCell

- (void)initializeViews
{
    [super initializeViews];

    self.separatorLine = [[UIView alloc] init];
    self.separatorLine.hidden = YES;
    [self.contentView addSubview:self.separatorLine];
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    JXJXCategoryIndicatorCellModel *model = (JXJXCategoryIndicatorCellModel *)self.cellModel;
    CGFloat lineWidth = model.separatorLineSize.width;
    CGFloat lineHeight = model.separatorLineSize.height;

    self.separatorLine.frame = CGRectMake(self.bounds.size.width - lineWidth + self.cellModel.cellSpacing/2, (self.bounds.size.height - lineHeight)/2.0, lineWidth, lineHeight);
}

- (void)reloadData:(JXJXCategoryBaseCellModel *)cellModel {
    [super reloadData:cellModel];

    JXJXCategoryIndicatorCellModel *model = (JXJXCategoryIndicatorCellModel *)cellModel;
    self.separatorLine.backgroundColor = model.separatorLineColor;
    self.separatorLine.hidden = !model.sepratorLineShowEnabled;

    if (model.cellBackgroundColorGradientEnabled) {
        if (model.selected) {
            self.contentView.backgroundColor = model.cellBackgroundSelectedColor;
        }else {
            self.contentView.backgroundColor = model.cellBackgroundUnselectedColor;
        }
    }
}

@end
