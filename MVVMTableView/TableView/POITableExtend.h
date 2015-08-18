//
//  POITableExtend.h
//  wolaiSocial
//
//  Created by xiangwenwen on 15/8/17.
//  Copyright (c) 2015年 POI. All rights reserved.
//

#import <Foundation/Foundation.h>

@class POITable;
@class POIModelManager;

@interface POITableExtend : NSObject<UITableViewDataSource,UITableViewDelegate>

@property(copy,nonatomic) NSString *identifier;
@property(strong,nonatomic) POITable *tableView;
@property(strong,nonatomic) POIModelManager *manager;

- (id)initWithTableView:(POITable*)tableView cellIdentifier:(Class)cellIdentifier;

@end
