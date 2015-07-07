//
//  CALayerLodgeViewController.m
//  CALayer
//
//  Created by xiangwenwen on 15/6/19.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import "CALayerLodgeViewController.h"

@interface CALayerLodgeViewController()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (strong, nonatomic) CALayer *lodgeLayerView;
@property (strong, nonatomic) UIView *containsView;
@property (strong, nonatomic) CALayer *secondLayerView;

@end

@implementation CALayerLodgeViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.containsView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    self.containsView.backgroundColor = [UIColor whiteColor];
    self.layerView.backgroundColor = [UIColor colorWithRed:0.000 green:0.502 blue:0.502 alpha:1.000];
    [self.layerView addSubview:self.containsView];
    self.lodgeLayerView = [CALayer layer];
    self.lodgeLayerView.frame = CGRectMake(0,0 ,200, 200);
    self.secondLayerView = [CALayer layer];
    self.secondLayerView.frame = CGRectMake(205, 0, 100, 100);
    [self.containsView.layer addSublayer:self.lodgeLayerView];
    [self.containsView.layer addSublayer:self.secondLayerView];
    //使用contents属性可以给图层的寄宿图赋值
    [self usedContents];
    
    //如果图片太胖，可以用contentsGravity 解决的就是决定内容在图层的边界中怎么对齐
    [self usedContentsGravity];
    
    //运行图片精灵
    [self usedContentsRect];
}

-(void)usedContents
{
    UIImage *image = [UIImage imageNamed:@"mockingbird.png"];
    self.lodgeLayerView.contents = (__bridge id) image.CGImage;
    self.secondLayerView.contents = (__bridge id) image.CGImage;
}

-(void)usedContentsGravity
{
    self.lodgeLayerView.contentsGravity = kCAGravityResizeAspect;
}

-(void)usedContentsScale
{
    //contentsScale 一般用来设置高清屏幕，如果已经设置了contentsGravity，这个属性一般不起作用，因为你已经决定了你的寄宿图在图层中与边界的对齐方式
    self.lodgeLayerView.contentsScale = 2.0;
}

-(void)usedMaskToBounds
{
    //如果内容已经超出了图层的边界，可以使用maskToBounds 设置为YES
    self.lodgeLayerView.masksToBounds = YES;
    
//    self.layerView.clipsToBounds = YES;  // UIView 可以设置clipsToBounds属性为YES
}

-(void)usedContentsRect
{
    //运行在图层的边框里显示寄宿图的一个子域，一张图，可以分割成几个部分，这个属性可以实现图片精灵
    self.lodgeLayerView.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
    self.secondLayerView.contentsRect = CGRectMake(0.5, 0, 0.5, 0.5);
}

-(void)usedContentsCenter
{
    self.lodgeLayerView.contentsCenter = CGRectMake(0.25,0.25,0.5, 0.5);
}


-(void)didReceiveMemoryWarning{
    
}

@end
