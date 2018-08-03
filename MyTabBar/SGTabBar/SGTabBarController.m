//
//  SGTabBarController.m
//  MyTabBar
//
//  Created by 尚钢 on 2018/8/2.
//  Copyright © 2018年 尚钢. All rights reserved.
//

#import "SGTabBarController.h"

@interface SGTabBarController ()<SGTabBarDelegate> //实现自定义TabBar协议

@end

@implementation SGTabBarController


//selectedIndex
- (void)viewDidLoad {
         [super viewDidLoad];
         // Do any additional setup after loading the view.
    
    //创建自定义TabBar
    SGTabBar *myTabBar = [[SGTabBar alloc] init];
    myTabBar.myTabBarDelegate = self;
    //利用KVC替换默认的TabBar
    [self setValue:myTabBar forKey:@"tabBar"];

}

 -(void)viewDidLayoutSubviews
 {
     [super viewDidLayoutSubviews];
     //设置TabBar的TintColor
     self.tabBar.tintColor = [UIColor colorWithRed:89/255.0 green:217/255.0 blue:247/255.0 alpha:1.0];
 }

 - (void)didReceiveMemoryWarning {
     [super didReceiveMemoryWarning];
     // Dispose of any resources that can be recreated.

 }



 #pragma mark - MyTabBarDelegate
 -(void)addButtonClick:(SGTabBar *)tabBar
 {
     //跳到中间界面
     [self setSelectedIndex:2];

    //测试中间“+”按钮是否可以点击并处理事件
//     UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"test" message:@"Test" preferredStyle:UIAlertControllerStyleAlert];
//     UIAlertAction *action = [UIAlertAction actionWithTitle:@"test" style:UIAlertActionStyleDefault handler:nil];
//     [controller addAction:action];
//     [self presentViewController:controller animated:YES completion:nil];
 }




@end
