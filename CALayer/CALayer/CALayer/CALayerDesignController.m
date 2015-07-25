//
//  CALayerDesignController.m
//  CALayer
//
//  Created by xiangwenwen on 15/7/25.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import "CALayerDesignController.h"

@interface CALayerDesignController()

@property(strong,nonatomic) UIView *containsView;

@end

@implementation CALayerDesignController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = @"视觉效果";
    self.containsView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    [self.view addSubview:self.containsView];
    
    CALayer *calayer = [CALayer layer];
    calayer.frame = CGRectMake(50, 50, 100, 100);
    calayer.backgroundColor = [UIColor cyanColor].CGColor;
    calayer.borderWidth = 2;
    calayer.borderColor = [UIColor colorWithRed:0.502 green:0.251 blue:0.000 alpha:1.000].CGColor;
    calayer.cornerRadius = 20;
    calayer.shadowColor = [UIColor colorWithWhite:0.498 alpha:1.000].CGColor;
    calayer.shadowOpacity = 0.6;
    calayer.shadowOffset = CGSizeMake(0, 3);
    calayer.opacity = 0.6;
    
    [self.containsView.layer addSublayer:calayer];
    
}

@end
