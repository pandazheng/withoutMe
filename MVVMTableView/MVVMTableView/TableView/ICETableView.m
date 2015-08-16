//
//  ICETableView.m
//  MVVMTableView
//
//  Created by xiangwenwen on 15/8/12.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import "ICETableView.h"

@implementation ICETableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
//        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

-(void)registerTableViewExtend:(id)tableViewExtend
{
    self.dataSource = tableViewExtend;
    self.delegate = tableViewExtend;
}

-(void)registerTableViewCellForIdentifier:(NSArray *)cellArray
{
    for (Class cellIdentifier in cellArray) {
        [self registerClass:cellIdentifier forCellReuseIdentifier:NSStringFromClass(cellIdentifier)];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
