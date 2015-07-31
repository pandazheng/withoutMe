//
//  ViewController.m
//  CALayer
//
//  Created by xiangwenwen on 15/6/19.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import "ViewController.h"
#import "pushCALayer.h"

#import "CALayerViewController.h"
#import "CALayerLodgeViewController.h"
#import "CALayerGeometryViewController.h"
#import "CALayerDesignController.h"
#import "CALayerTransformController.h"
#import "CALayerTransform3DController.h"
#import "CALayerDedicatedViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *CALayerTable;
@property (strong, nonatomic) NSArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dataSource = @[@"CALayer图层树",@"寄宿图",@"图层几何学",@"视觉效果",@"变换",@"3D变换",@"专用图层"];
    self.CALayerTable.dataSource = self;
    self.CALayerTable.delegate = self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    pushCALayer *cell = [tableView dequeueReusableCellWithIdentifier:@"pushCALayerCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[pushCALayer alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"pushCALayerCell"];
    }
    cell.contentText = self.dataSource[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *pushType = self.dataSource[indexPath.row];
    if ([pushType isEqualToString:@"CALayer图层树"]) {
        CALayerViewController *CAL = [self.storyboard instantiateViewControllerWithIdentifier:@"CALayerViewController"];
        [self.navigationController pushViewController:CAL animated:YES];
    }
    
    if ([pushType isEqualToString:@"寄宿图"]) {
        CALayerLodgeViewController *lodge = [self.storyboard instantiateViewControllerWithIdentifier:@"CALayerLodgeViewController"];
        [self.navigationController pushViewController:lodge animated:YES];
    }
    
    if ([pushType isEqualToString:@"图层几何学"]) {
        CALayerGeometryViewController *geometry = [self.storyboard instantiateViewControllerWithIdentifier:@"CALayerGeometry"];
        [self.navigationController pushViewController:geometry animated:YES];
    }
    
    if ([pushType isEqualToString:@"变换"]) {
        CALayerTransformController *transform = [self.storyboard instantiateViewControllerWithIdentifier:@"CALayerTransform"];
        [self.navigationController pushViewController:transform animated:YES];
    }
    
    if ([pushType isEqualToString:@"视觉效果"]) {
        CALayerDesignController *design = [self.storyboard instantiateViewControllerWithIdentifier:@"CALayerDesign"];
        [self.navigationController pushViewController:design animated:YES];
    }
    
    if ([pushType isEqualToString:@"3D变换"]) {
        CALayerTransform3DController *tfd = [self.storyboard instantiateViewControllerWithIdentifier:@"CALayerTransform3D"];
        [self.navigationController pushViewController:tfd animated:YES];
    }
    
    if ([pushType isEqualToString:@"专用图层"]) {
        CALayerDedicatedViewController *deicate = [self.storyboard instantiateViewControllerWithIdentifier:@"CALayerDedicatedView"];
        [self.navigationController pushViewController:deicate animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
