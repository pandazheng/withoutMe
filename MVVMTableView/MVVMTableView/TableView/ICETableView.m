//
//  ICETableView.m
//  MVVMTableView
//
//  Created by xiangwenwen on 15/8/12.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import "ICETableView.h"

@implementation ICETableView


/**
 *  <#Description#>
 *
 *  @param delegate <#delegate description#>
 */
-(void)regisDelegate:(id)delegate
{
    self.dataSource = delegate;
    self.delegate   = delegate;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
