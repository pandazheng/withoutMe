//
//  AppTableViewCell.h
//  NSFetchedResultsController
//
//  Created by xiangwenwen on 15/8/11.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Event;

@interface AppTableViewCell : UITableViewCell

@property(strong,nonatomic) Event *dataSource;

@end
