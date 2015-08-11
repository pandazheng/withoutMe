//
//  ViewController.m
//  NSFetchedResultsController
//
//  Created by xiangwenwen on 15/8/11.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import "ViewController.h"
#import "AppTableViewController.h"
#import "ModelManager.h"

@interface ViewController ()

@property(strong,nonatomic) ModelManager *manager;

@end

@implementation ViewController

- (IBAction)pushTableView:(UIButton *)sender {
    
}


- (IBAction)fetchDataSourceToCoreData:(UIButton *)sender {
    [self.manager saveDate];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AppTableViewController *table = (AppTableViewController *)segue.destinationViewController;
    table.manager = self.manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.manager = [[ModelManager alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
