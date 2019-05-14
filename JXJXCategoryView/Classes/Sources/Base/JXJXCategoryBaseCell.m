//
//  JXCategoryBaseCell.m
//  UI系列测试
//
//  Created by jiaxin on 2018/3/15.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "JXJXCategoryBaseCell.h"

@interface JXJXCategoryBaseCell ()
@end

@implementation JXJXCategoryBaseCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeViews];
    }
    return self;
}

- (void)initializeViews
{

}

- (void)reloadData:(JXCategoryBaseCellModel *)cellModel {
    self.cellModel = cellModel;
    
}

@end
