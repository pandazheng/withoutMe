//
//  CALayerHiddeAnimationViewController.m
//  CALayer
//
//  Created by xiangwenwen on 15/8/1.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import "CALayerHiddeAnimationViewController.h"

@interface CALayerHiddeAnimationViewController()

@property(strong,nonatomic) UIView *containsView;

@end

@implementation CALayerHiddeAnimationViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationItem.title = @"显示动画";
    
    self.containsView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
    self.containsView.backgroundColor = [UIColor colorWithRed:0.000 green:0.502 blue:0.502 alpha:1.000];
    [self.view addSubview:self.containsView];
    
    __weak CALayerHiddeAnimationViewController *weakSelf = self;
    
    [UIView animateWithDuration:5.0 animations:^{
        CABasicAnimation *animation = [CABasicAnimation animation];
        animation.keyPath = @"backgroundColor";
        animation.toValue = (__bridge id)[UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:1.000].CGColor;
        [weakSelf.containsView.layer addAnimation:animation forKey:@"goRight"];
    }];
    
    
    
}

@end
