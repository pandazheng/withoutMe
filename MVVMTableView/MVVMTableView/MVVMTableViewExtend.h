//
//  MVVMTableViewExtend.h
//  MVVMTableView
//
//  Created by xiangwenwen on 15/8/16.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import "ICETableViewExtend.h"

typedef void(^startblock)(void);

@interface MVVMTableViewExtend : ICETableViewExtend

-(void)startWithBlock:(startblock)startblock;

@end
