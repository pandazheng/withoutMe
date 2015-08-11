//
//  AppTableViewController.h
//  NSFetchedResultsController
//
//  Created by xiangwenwen on 15/8/11.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModelManager;

@interface AppTableViewController : UITableViewController

@property(strong,nonatomic) ModelManager *manager;

@end
