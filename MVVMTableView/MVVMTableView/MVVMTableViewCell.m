//
//  MVVMTableViewCell.m
//  MVVMTableView
//
//  Created by xiangwenwen on 15/8/16.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import "MVVMTableViewCell.h"

@implementation MVVMTableViewCell


-(void)setName:(NSString *)name
{
    _name = name;
    self.textLabel.text = name;
}


//- (void)awakeFromNib {
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
