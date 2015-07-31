//
//  RoundView.h
//  CALayer
//
//  Created by xiangwenwen on 15/7/31.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoundView : UIView

@property(assign,nonatomic) CGFloat startValue; //初始值(0-1)
@property(assign,nonatomic) CGFloat endValue; //结束值
@property(assign,nonatomic) CGFloat borderWidth; //边框线
@property(strong,nonatomic) UIColor *fillColor; //填充区域
@property(strong,nonatomic) UIColor *borderColor; // 边框颜色

@end
