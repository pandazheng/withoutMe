//
//  ICETableViewExtend.m
//  MVVMTableView
//
//  Created by xiangwenwen on 15/8/16.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import "ICETableViewExtend.h"
#import "ICEModelManager.h"

@implementation ICETableViewExtend

-(ICEModelManager *)manager
{
    if (!_manager) {
        _manager = [[ICEModelManager alloc] init];
    }
    return _manager;
}

@end
