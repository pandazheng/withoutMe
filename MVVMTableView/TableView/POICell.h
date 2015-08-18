//
//  POICell.h
//  wolaiSocial
//
//  Created by xiangwenwen on 15/8/17.
//  Copyright (c) 2015年 POI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface POICell : UITableViewCell

+ (Class)cellClass;

- (void)fetchModelData:(id)modelData;

@end
