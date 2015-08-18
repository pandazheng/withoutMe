//
//  POITableRefreshExtend.m
//  wolaiSocial
//
//  Created by xiangwenwen on 15/8/17.
//  Copyright (c) 2015年 POI. All rights reserved.
//

#import "POITableRefreshExtend.h"
#import "POIModelManager.h"
#import "POITable.h"

@implementation POITableRefreshExtend

-(NSUInteger)page
{
    if (!_page) {
        _page = 0;
    }
    return _page;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20;
}

-(void)startDefaultRefresh:(id)modelValue completion:(void (^)(void))completion
{
    __weak POITableRefreshExtend *weakSelf = self;
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.tableView.loading = YES;
        weakSelf.page += 1;
        [weakSelf.manager modelForRowAtInsert:^id(NSManagedObjectContext *context) {
            return modelValue;
        }comple:^{
            [weakSelf.tableView reloadData];
            [weakSelf.tableView.header endRefreshing];
            weakSelf.tableView.loading = NO;
            NSLog(@"%zd",weakSelf.page);
        }];
    }];
    [self.tableView.header beginRefreshing];
}
@end
