//
//  SGTabBar.h
//  TabBar
//
//  Created by 尚钢 on 2018/8/2.
//  Copyright © 2018年 尚钢. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SGTabBar;

//MyTabBar的代理必须实现addButtonClick，以响应中间“+”按钮的点击事件
 @protocol SGTabBarDelegate <NSObject>

 -(void)addButtonClick:(SGTabBar *)tabBar;
 @end

 @interface SGTabBar : UITabBar

//指向中间按钮
@property (nonatomic,weak) UIButton *addButton;
//指向“中间”标签
@property (nonatomic,weak) UILabel *addLabel;

 //指向MyTabBar的代理
 @property (nonatomic,weak) id<SGTabBarDelegate> myTabBarDelegate;

 @end
