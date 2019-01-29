//
//  JXCategoryLeftTitleView.h
//  FBSnapshotTestCase
//
//  Created by zhm on 2019/1/29.
//

#import "JXCategoryTitleView.h"

@interface JXCategoryLeftTitleView : JXCategoryTitleView

/**
 标题会靠左显示
 @param leftSpace 是距离左侧的距离，如果不传的话，默认20
 @param cellSpacing 与属性设置的保持一致
 */
- (instancetype)initWithLeftStyle:(CGFloat)leftSpace cellSpacing:(CGFloat)cellSpacing;



@end


