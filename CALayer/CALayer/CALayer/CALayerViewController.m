//
//  CALayerViewController.m
//  CALayer
//
//  Created by xiangwenwen on 15/6/19.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import "CALayerViewController.h"

@interface CALayerViewController()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@end

@implementation CALayerViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    [self createNav];
    
    //根图层
    [self calyeroneTime];
    
}

-(void)createNav
{
    self.navigationItem.title = @"CALayer图层树";
}

-(void)calyeroneTime
{
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(50.0f, 50.0, 200, 200);
    layer.backgroundColor = [UIColor colorWithRed:0.400 green:0.800 blue:1.000 alpha:1.000].CGColor;
    [self.layerView.layer addSublayer:layer];
}

-(void)didReceiveMemoryWarning
{
    
}

@end
