//
//  RoundView.m
//  CALayer
//
//  Created by xiangwenwen on 15/7/31.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import "RoundView.h"

@interface RoundView()

@property(strong,nonatomic) CAShapeLayer *shapeLayer;

@end

@implementation RoundView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.shapeLayer = [CAShapeLayer layer];
        self.frame = self.bounds;
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
        self.shapeLayer.path = path.CGPath;
        self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
        self.shapeLayer.lineWidth = 1.f;
        self.shapeLayer.strokeColor = [UIColor colorWithRed:0.000 green:0.502 blue:0.502 alpha:1.000].CGColor;
        [self.layer addSublayer:self.shapeLayer];
    }
    return self;
}

-(void)setFillColor:(UIColor *)fillColor
{
    _fillColor = fillColor;
    self.shapeLayer.fillColor = fillColor.CGColor;
}

-(void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    self.shapeLayer.lineWidth = borderWidth;
}

-(void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    self.shapeLayer.strokeColor = borderColor.CGColor;
}

-(void)setStartValue:(CGFloat)startValue
{
    _startValue = startValue;
    self.shapeLayer.strokeStart = startValue;
}

-(void)setEndValue:(CGFloat)endValue
{
    _endValue = endValue;
    self.shapeLayer.strokeEnd = endValue;
}

@end
