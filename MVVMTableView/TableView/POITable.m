//
//  POITable.m
//  wolaiSocial
//
//  Created by xiangwenwen on 15/8/17.
//  Copyright (c) 2015年 POI. All rights reserved.
//

#import "POITable.h"

@interface POITable()

@property(strong,nonatomic) UIActivityIndicatorView *activity;

@end

@implementation POITable


-(void)setLoading:(BOOL)loading
{
    _loading = loading;
    if (loading) {
        [self.activity startAnimating];
    }else{
        [self.activity stopAnimating];
    }
}

- (void)initActivityIndicator
{
    self.activity = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    self.activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.activity startAnimating];
    [self insertSubview:self.activity atIndex:0];
    self.activity.center = CGPointMake([UIApplication sharedApplication].keyWindow.center.x, 200);
}

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.separatorColor = [UIColor colorWithRed:0.000 green:0.502 blue:0.502 alpha:1.000];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self initActivityIndicator];
    }
    return self;
}

-(void)registerCellClassUsingCellIdentifier:(NSArray *)cellClassArray
{
    for (Class identifier in cellClassArray) {
        [self registerClass:identifier forCellReuseIdentifier:NSStringFromClass(identifier)];
    }
}

-(void)registerForTableViewAtExtend:(id)tableViewExtend
{
    self.dataSource = tableViewExtend;
    self.delegate = tableViewExtend;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
@end