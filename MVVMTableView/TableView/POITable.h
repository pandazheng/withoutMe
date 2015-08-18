//
//  POITable.h
//  wolaiSocial
//
//  Created by xiangwenwen on 15/8/17.
//  Copyright (c) 2015年 POI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface POITable : UITableView

@property(assign,nonatomic) BOOL loading;

- (void)registerCellClassUsingCellIdentifier:(NSArray *)cellClassArray;

- (void)registerForTableViewAtExtend:(id)tableViewExtend;

@end
