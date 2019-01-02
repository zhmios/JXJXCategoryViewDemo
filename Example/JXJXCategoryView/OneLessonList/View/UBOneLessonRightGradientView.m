//
//  UBOneLessonRightGradientView.m
//  LBOC_Student
//
//  Created by zhm on 2018/12/28.
//  Copyright © 2018 dfub.xdf.com. All rights reserved.
//

#import "UBOneLessonRightGradientView.h"

@implementation UBOneLessonRightGradientView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0].CGColor, (__bridge id)[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8].CGColor];
        gradientLayer.locations = @[@0, @1.0];
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1.0, 0);
        gradientLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self.layer addSublayer:gradientLayer];
        
    }
    return self;
}


@end
