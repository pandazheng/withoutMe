//
//  MVVMTableViewDataSource.m
//  MVVMTableView
//
//  Created by xiangwenwen on 15/8/12.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import "MVVMTableViewDataSource.h"

@implementation MVVMTableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",NSStringFromClass([self class]));
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    cell.textLabel.text = @"123";
    return cell;
}

@end
