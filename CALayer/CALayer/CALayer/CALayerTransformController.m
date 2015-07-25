//
//  CALayerTransformController.m
//  CALayer
//
//  Created by xiangwenwen on 15/7/25.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import "CALayerTransformController.h"

@interface CALayerTransformController()

@property(strong,nonatomic) UIView *containsView;

@end

@implementation CALayerTransformController

CGAffineTransform CGAffineTransformMakeShear(CGFloat x, CGFloat y)
{
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform.c = -x;
    transform.b = y;
    return transform;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = @"变换";
    self.containsView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    [self.view addSubview:self.containsView];
    
    CALayer *calayer = [CALayer layer];
    calayer.frame = CGRectMake(50, 50, 100, 100);
    calayer.backgroundColor = [UIColor colorWithRed:1.000 green:0.400 blue:0.400 alpha:1.000].CGColor;
    calayer.borderWidth = 2;
    calayer.borderColor = [UIColor colorWithRed:0.000 green:0.502 blue:0.251 alpha:1.000].CGColor;
    calayer.cornerRadius = 20;
    calayer.shadowColor = [UIColor colorWithWhite:0.498 alpha:1.000].CGColor;
    calayer.shadowOpacity = 0.6;
    calayer.shadowOffset = CGSizeMake(0, 3);
    calayer.opacity = 0.6;
    
    // pi 做为弧度单位，一个pi为180 M_PI_4也就是四分之一，45度
    
//    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
//    calayer.affineTransform = transform;
    
    // 缩小一半，再旋转30度，向右平移200
    
//    CGAffineTransform transform = CGAffineTransformIdentity;
//    transform = CGAffineTransformScale(transform, 0.5, 0.5);
//    transform = CGAffineTransformRotate(transform, M_PI/180.0*30.0);
//    transform = CGAffineTransformTranslate(transform, 200, 0);
//    calayer.affineTransform = transform;
    
    //斜切变换
    
//    calayer.affineTransform = CGAffineTransformMakeShear(1, 0);
    
    // 绕Y轴旋转图层
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1/500.0;
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
    calayer.transform = transform;
    
    [self.containsView.layer addSublayer:calayer];
}

@end
