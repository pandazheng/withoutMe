//
//  ICEModelManager.m
//  MVVMTableView
//
//  Created by xiangwenwen on 15/8/16.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICEModelManager.h"

@interface ICEModelManager()

@property(strong,nonatomic) NSMutableArray *model;

@end

@implementation ICEModelManager

-(NSMutableArray *)model
{
    if (!_model) {
        _model = [[NSMutableArray alloc] init];
    }
    return _model;
}

-(NSMutableArray *)modeldata
{
    return self.model;
}

-(NSUInteger)length
{
    return self.model.count;
}

-(id)modelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.model objectAtIndex:indexPath.row];
}

-(void)modelForRowAtInsert:(id)waitingInsertForModel
{
    [self.model addObject:waitingInsertForModel];
}

@end
