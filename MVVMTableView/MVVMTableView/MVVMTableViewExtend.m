//
//  MVVMTableViewExtend.m
//  MVVMTableView
//
//  Created by xiangwenwen on 15/8/16.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import "MVVMTableViewExtend.h"
#import "MVVMTableViewCell.h"
#import "ICEModelManager.h"

@implementation MVVMTableViewExtend

-(void)startWithBlock:(startblock)startblock
{
    NSArray *arr =  @[@"icepy",@"wen"];
    __weak MVVMTableViewExtend *weakSelf = self;
    [arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [weakSelf.manager modelForRowAtInsert:obj];
    }];
    startblock();
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.manager.length;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MVVMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MVVMTableViewCell class]) forIndexPath:indexPath];
    cell.name = [self.manager modelForRowAtIndexPath:indexPath];
    return cell;
}

@end
