//
//  CALayerGeometryViewController.m
//  CALayer
//
//  Created by xiangwenwen on 15/7/6.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import "CALayerGeometryViewController.h"

@interface CALayerGeometryViewController()

@property(strong,nonatomic) UIView *geometryView;
@property(strong,nonatomic) CALayer *layer;

@end

@implementation CALayerGeometryViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self createview];
}
-(void)createview
{
    self.navigationItem.title = @"图层几何学";
    self.geometryView = [[UIView alloc] initWithFrame:CGRectMake(10, 74, 200, 200)];
    self.geometryView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.geometryView];
    
    self.layer = [CALayer layer];
    self.layer.frame = CGRectMake(50, 50, 100, 100);
    self.layer.backgroundColor = [UIColor colorWithRed:0.000 green:0.502 blue:0.502 alpha:1.000].CGColor;
    self.layer.borderWidth = 1;
    self.layer.anchorPoint = CGPointMake(1, 1);
    self.layer.borderColor = [UIColor blackColor].CGColor;
    [self.geometryView.layer addSublayer:self.layer];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    point = [self.geometryView.layer convertPoint:point fromLayer:self.view.layer];
    if ([self.geometryView.layer containsPoint:point]) {
        //convert point to blueLayer’s coordinates
        point = [self.layer convertPoint:point fromLayer:self.geometryView.layer];
        if ([self.layer containsPoint:point]) {
            [[[UIAlertView alloc] initWithTitle:@"Inside layer"
                                        message:nil
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil] show];
        } else {
            [[[UIAlertView alloc] initWithTitle:@"Inside view"
                                        message:nil
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil] show];
        }
    }
}

-(void)didReceiveMemoryWarning
{
    
}

@end
