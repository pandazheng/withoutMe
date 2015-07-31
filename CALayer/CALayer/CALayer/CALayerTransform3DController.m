//
//  CALayerTransform3DController.m
//  CALayer
//
//  Created by xiangwenwen on 15/7/27.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import "CALayerTransform3DController.h"

@interface CALayerTransform3DController()

@property(strong,nonatomic) UIView *containsView;

@end

@implementation CALayerTransform3DController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationItem.title = @"3D变换";
    
    self.containsView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    [self.view addSubview:self.containsView];
    
    CALayer *calayer = [CALayer layer];
    calayer.frame = CGRectMake(50, 50, 100, 100);
    
    [self.containsView.layer addSublayer:calayer];
}

@end
