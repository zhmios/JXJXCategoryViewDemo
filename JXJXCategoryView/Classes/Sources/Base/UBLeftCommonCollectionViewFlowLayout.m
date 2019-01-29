//
//  UBLeftCommonCollectionViewFlowLayout.m
//  LBOC_Student
//
//  Created by zhm on 2018/12/5.
//  Copyright © 2018 dfub.xdf.com. All rights reserved.
//

#import "UBLeftCommonCollectionViewFlowLayout.h"

@implementation UBLeftCommonCollectionViewFlowLayout

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect

{
    
    NSArray *layoutArray = [super layoutAttributesForElementsInRect:rect];
    if (self.isNormal) {
        
        return layoutArray;
    }
    CGFloat poisitionX = 0;
    for (NSInteger i = 0; i < layoutArray.count ; i ++) {
        
        UICollectionViewLayoutAttributes *item = layoutArray[i];
        BOOL isAdjust = YES;
        if (item.frame.size.width == [UIScreen mainScreen].bounds.size.width) {
            isAdjust = NO;
        }
        CGRect originFrame = item.frame;
        CGRect adjFrame = CGRectZero;
       
        if (item.indexPath.row == 0) {
            
            adjFrame = CGRectMake(self.leftDistance, originFrame.origin.y, originFrame.size.width, originFrame.size.height);
            
            if (isAdjust) {
                item.frame = adjFrame;
            }
           
            
        }
        
        if (originFrame.origin.x != self.leftDistance && item.indexPath.row != 0) {
            
            
            if (i >= 1) {
                UICollectionViewLayoutAttributes *lastItem = layoutArray[i -1];
                
                if (item.frame.origin.x<CGRectGetMaxX(lastItem.frame)) {
                    
                    poisitionX = self.leftDistance;
                }else{
                    
                    poisitionX = CGRectGetMaxX(lastItem.frame) + self.fixSpaceitem;
                    
                }
                
                adjFrame = CGRectMake(poisitionX, originFrame.origin.y, originFrame.size.width, originFrame.size.height);
                
                if (isAdjust) {
                    item.frame = adjFrame;
                }

            }
            
            
        }
        
    }
    
    return layoutArray;
}


@end
