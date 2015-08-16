//
//  ICETableViewExtend.h
//  MVVMTableView
//
//  Created by xiangwenwen on 15/8/16.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ICETableViewExtendDelegate <NSObject>

@end

@class ICEModelManager;

@interface ICETableViewExtend : NSObject<UITableViewDataSource,UITableViewDelegate>

@property(weak,nonatomic) id<ICETableViewExtendDelegate> delegate;
@property(strong,nonatomic) ICEModelManager *manager;

@end
