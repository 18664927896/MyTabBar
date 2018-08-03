//
//  SGTabBar.m
//  TabBar
//
//  Created by 尚钢 on 2018/8/2.
//  Copyright © 2018年 尚钢. All rights reserved.
//

#import "SGTabBar.h"
#import "UIView+Extension.h"
#import "SGMiddleBtn.h"

#define AddButtonMargin 10

 @interface SGTabBar()

 @end

@implementation SGTabBar

-(instancetype)initWithFrame:(CGRect)frame
 {
     if(self = [super initWithFrame:frame]){
//        //创建中间按钮
//        SGMiddleBtn *addBtn = [[SGMiddleBtn alloc] init];
//        //设置默认背景图片
//        [addBtn setBackgroundImage:[UIImage imageNamed:@"footbar_data_nor"] forState:UIControlStateNormal];
//             //设置按下时背景图片
//        [addBtn setBackgroundImage:[UIImage imageNamed:@"footbar_data_press"] forState:UIControlStateHighlighted];
//
//         [addBtn setBackgroundImage:[UIImage imageNamed:@"footbar_data_press"] forState:UIControlStateSelected];
//        //添加响应事件
//        [addBtn addTarget:self action:@selector(addBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
//         //将按钮添加到TabBar
//         [self addSubview:addBtn];
//         addBtn.backgroundColor = [UIColor redColor];
//         [addBtn setTitle:@"中间" forState:UIControlStateNormal];
//         self.addButton = addBtn;

     }
         return self;
    
 }

 //响应中间“+”按钮点击事件
 -(void)addBtnDidClick
 {
     self.addButton.selected = YES;
     self.addLabel.textColor = [UIColor greenColor];
     if([self.myTabBarDelegate respondsToSelector:@selector(addButtonClick:)]){
         [self.myTabBarDelegate addButtonClick:self];
     }
 }

 -(void)layoutSubviews
 {
     [super layoutSubviews];

     if (self.addButton==nil) {
         //创建中间按钮
         SGMiddleBtn *addBtn = [[SGMiddleBtn alloc] initWithFrame:CGRectMake(0, 0, (self.width-20)/5, 70)];
//         //设置“+”按钮的位置
//         self.addButton.width = (self.width-20)/5;
         addBtn.centerX = self.centerX;
         addBtn.centerY = self.height/2-10;
         //设置默认背景图片
         [addBtn setImage:[UIImage imageNamed:@"icon_logo"] forState:UIControlStateNormal];
         //设置按下时背景图片
         [addBtn setImage:[UIImage imageNamed:@"logo"] forState:UIControlStateHighlighted];
         //设置选中时背景图片
         [addBtn setImage:[UIImage imageNamed:@"logo"] forState:UIControlStateSelected];
         //添加响应事件
         [addBtn addTarget:self action:@selector(addBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
         //将按钮添加到TabBar
         [self addSubview:addBtn];
         [addBtn setTitle:@"中间" forState:UIControlStateNormal];
         self.addButton = addBtn;
     }
     int btnIndex = 0;
     //系统自带的按钮类型是UITabBarButton，找出这些类型的按钮，然后重新排布位置，空出中间的位置
     Class class = NSClassFromString(@"UITabBarButton");
     for (UIView *btn in self.subviews) {//遍历TabBar的子控件
             if ([btn isKindOfClass:class]) {
                 //方法1:如果是系统的UITabBarButton，那么就调整子控件位置，空出中间位置
                 //方法2:隐藏中间位置的按钮，添加自定义按钮，此处用的是方法2，具体如何看自己使用场景
                 btnIndex++;
                 if (btnIndex==3) {
                     btn.hidden = YES;
                 }
             }
         }
 }

 //重写hitTest方法，去监听"+"按钮和“添加”标签的点击，目的是为了让凸出的部分点击也有反应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    //这一个判断是关键，不判断的话push到其他页面，点击“+”按钮的位置也是会有反应的，这样就不好了
    //self.isHidden == NO 说明当前页面是有TabBar的，那么肯定是在根控制器页面
    //在根控制器页面，那么我们就需要判断手指点击的位置是否在“+”按钮或“添加”标签上
    //是的话让“+”按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
     if (self.isHidden == NO){
             //将当前TabBar的触摸点转换坐标系，转换到“+”按钮的身上，生成一个新的点
            CGPoint newA = [self convertPoint:point toView:self.addButton];
             //将当前TabBar的触摸点转换坐标系，转换到“添加”标签的身上，生成一个新的点
             CGPoint newL = [self convertPoint:point toView:self.addLabel];
             //判断如果这个新的点是在“+”按钮身上，那么处理点击事件最合适的view就是“+”按钮
             if ( [self.addButton pointInside:newA withEvent:event]){
                     return self.addButton;
                 }
             //判断如果这个新的点是在“添加”标签身上，那么也让“+”按钮处理事件
             else if([self.addLabel pointInside:newL withEvent:event]){
                     return self.addButton;
                 }
             else{//如果点不在“+”按钮身上，直接让系统处理就可以了
                     return [super hitTest:point withEvent:event];
                 }
             }
     else{
         //TabBar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
         return [super hitTest:point withEvent:event];

     }
}


@end
