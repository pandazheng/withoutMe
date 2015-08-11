//
//  ModelManager.h
//  NSFetchedResultsController
//
//  Created by xiangwenwen on 15/8/11.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSFetchedResultsController;

@interface ModelManager : NSObject

@property(strong,nonatomic) NSFetchedResultsController *fetchResult;

- (void) saveDate;

@end
