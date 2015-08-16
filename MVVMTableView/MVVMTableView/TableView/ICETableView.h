//
//  ICETableView.h
//  MVVMTableView
//
//  Created by xiangwenwen on 15/8/12.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ICETableView : UITableView

- (void)registerTableViewExtend:(id)tableViewExtend;

- (void)registerTableViewCellForIdentifier:(NSArray *)cellArray;

@end
