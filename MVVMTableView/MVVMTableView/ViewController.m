//
//  ViewController.m
//  MVVMTableView
//
//  Created by xiangwenwen on 15/8/12.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import <Masonry/Masonry.h>

#import "ViewController.h"
#import "MVVMTableView.h"
#import "MVVMTableViewDataSource.h"

@interface ViewController ()

@property (strong,nonatomic) MVVMTableView           *tableView;
@property (strong,nonatomic) MVVMTableViewDataSource *tableViewDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initWithTableView];
    [self initWithDataSource];
}

- (void)initWithTableView
{
    self.tableView = [[MVVMTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)initWithDataSource
{
    self.tableViewDelegate = [[MVVMTableViewDataSource alloc] init];
    [self.tableView regisDelegate:self.tableViewDelegate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
