//
//  UIView+Extension.h
//  00-新浪微博
//
//  Created by sys on 14-10-23.
//  Copyright (c) 2014年 itcast.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

//注意分类里面的@property不会生产对应的下划线属性（_x,_y....）;
//所以要没有对应的gatter，setter方法，需要手动实现

@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;

@property (nonatomic,assign) CGFloat width;

@property (nonatomic,assign) CGFloat height;

@property (nonatomic,assign) CGSize size;

@property (nonatomic,assign) CGPoint origin;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property CGFloat top;
@property CGFloat left;
@property CGFloat bottom;
@property CGFloat right;


@end
