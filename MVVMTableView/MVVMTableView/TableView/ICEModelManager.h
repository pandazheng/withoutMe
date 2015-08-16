//
//  ICEModelManager.h
//  MVVMTableView
//
//  Created by xiangwenwen on 15/8/16.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICEModelManager : NSObject

@property(strong,nonatomic,readonly) NSMutableArray *modeldata;
@property(assign,nonatomic,readonly) NSUInteger length;

- (id)modelForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)modelForRowAtInsert:(id)waitingInsertForModel;

@end
