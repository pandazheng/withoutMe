//
//  ICETableViewCell.m
//  MVVMTableView
//
//  Created by xiangwenwen on 15/8/16.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import "ICETableViewCell.h"

@implementation ICETableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
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
