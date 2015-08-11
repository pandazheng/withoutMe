//
//  AppTableViewCell.m
//  NSFetchedResultsController
//
//  Created by xiangwenwen on 15/8/11.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import "AppTableViewCell.h"
#import "Event.h"

@implementation AppTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setDataSource:(Event *)dataSource
{
    _dataSource = dataSource;
    self.textLabel.text = _dataSource.sectionMinute;
}

@end
