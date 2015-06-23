//
//  pushCALayer.m
//  CALayer
//
//  Created by xiangwenwen on 15/6/19.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import "pushCALayer.h"

@interface pushCALayer()

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;


@end

@implementation pushCALayer

-(void)setContentText:(NSString *)contentText
{
    _contentText = contentText;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.contentLabel.text = contentText;
}

@end
