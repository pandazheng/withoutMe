//
//  POITableRefreshExtend.h
//  wolaiSocial
//
//  Created by xiangwenwen on 15/8/17.
//  Copyright (c) 2015年 POI. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <MJRefresh/MJRefresh.h>
#import "POITableExtend.h"

@interface POITableRefreshExtend : POITableExtend

@property(assign,nonatomic) NSUInteger page;

- (void)startDefaultRefresh:(id)modelValue completion:(void(^)(void))completion;

@end
