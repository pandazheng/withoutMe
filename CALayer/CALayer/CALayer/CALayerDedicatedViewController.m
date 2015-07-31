//
//  CALayerDedicatedViewController.m
//  CALayer
//
//  Created by xiangwenwen on 15/7/30.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import "CALayerDedicatedViewController.h"
#import <QuartzCore/QuartzCore.h>

#import "RoundView.h"

@interface CALayerDedicatedViewController()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) CAShapeLayer *shape;
@property (strong, nonatomic) RoundView *rouview;

@end

@implementation CALayerDedicatedViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.rouview = [[RoundView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.rouview.startValue = 0.5;
    self.rouview.center = self.view.center;
    self.rouview.borderColor = [UIColor colorWithRed:0.502 green:0.000 blue:0.000 alpha:1.000];
    self.rouview.borderWidth = 1.f;
    [self.view addSubview:self.rouview];
    
    [self performSelector:@selector(roudAnimationTimer) withObject:nil afterDelay:3.f];
    
    self.navigationItem.title = @"专有图层";
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(175, 100)];
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path moveToPoint:CGPointMake(150, 125)];
    
    [path addLineToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(125, 225)];
    
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 5;
    layer.lineJoin = kCALineJoinRound;
    layer.lineCap = kCALineCapRound;
    layer.path = path.CGPath;
    
    [self.containerView.layer addSublayer:layer];
    
    
    UIView *conview = [[UIView alloc] initWithFrame:CGRectMake(10, 200, 200, 200)];
    [self.containerView addSubview:conview];
    
    CGRect rect = CGRectMake(50, 50, 100, 100);
    CGSize radii = CGSizeMake(20, 20);
    UIRectCorner corner = UIRectCornerTopLeft | UIRectCornerBottomLeft | UIRectCornerBottomRight;
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:radii];
    
    self.shape = [CAShapeLayer layer];
    self.shape.strokeColor = [UIColor colorWithRed:0.000 green:0.251 blue:0.502 alpha:1.000].CGColor;
    self.shape.fillColor = [UIColor clearColor].CGColor;
    self.shape.path = bezier.CGPath;
    self.shape.lineWidth = 1.f;
    self.shape.lineJoin = kCALineJoinRound;
    self.shape.lineCap = kCALineCapRound;
    
    self.shape.strokeStart = 0;
    
    self.shape.strokeEnd = 0;
    
    [conview.layer addSublayer:self.shape];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(animationTimer) userInfo:nil repeats:YES];
}

-(void)animationTimer
{
    self.shape.strokeEnd = arc4random() % 100 / 100.f;
}

-(void)roudAnimationTimer
{
    self.rouview.endValue = 1.0f;
}

@end
