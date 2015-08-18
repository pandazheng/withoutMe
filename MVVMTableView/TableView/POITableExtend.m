//
//  POITableExtend.m
//  wolaiSocial
//
//  Created by xiangwenwen on 15/8/17.
//  Copyright (c) 2015年 POI. All rights reserved.
//

#import "POITableExtend.h"
#import "POIModelManager.h"
#import "POICell.h"

@interface POITableExtend()

@end

@implementation POITableExtend

-(id)initWithTableView:(POITable *)tableView cellIdentifier:(Class)cellIdentifier
{
    self = [super init];
    if (self) {
        self.tableView = tableView;
        self.identifier = NSStringFromClass(cellIdentifier);
        self.manager = [[POIModelManager alloc] init];
    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.manager.length;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    @throw Override_Exception;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row < self.manager.length){
        
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    POICell *cell = [tableView dequeueReusableCellWithIdentifier:self.identifier forIndexPath:indexPath];
    if ([cell respondsToSelector:@selector(fetchModelData:)]) {
        [self.manager modelForRowAtIndexPath:indexPath completion:^(id model) {
            [cell fetchModelData:model];
        }];
    }
    return cell;
}

@end