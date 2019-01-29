//
//  UBLeftCommonCollectionViewFlowLayout.h
//  LBOC_Student
//
//  Created by zhm on 2018/12/5.
//  Copyright © 2018 dfub.xdf.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UBLeftCommonCollectionViewFlowLayout : UICollectionViewFlowLayout

@property(nonatomic, assign)BOOL isNormal;
@property(nonatomic,assign)CGFloat fixSpaceitem;
@property(nonatomic,assign)CGFloat leftDistance;

@end


