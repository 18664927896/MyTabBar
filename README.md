# MyTabBar
自定义一个中间凸出的UITabBarController

# 使用方法：
     //1:初始化一个tabBar控制器
     SGTabBarController *tb=[[SGTabBarController alloc]init];
     tb.delegate = self;
     //创建自定义TabBar
     //2:创建子控制器
     UIViewController *c1=[[UIViewController alloc]init];
     c1.view.backgroundColor=[UIColor grayColor];

     c1.tabBarItem.title=@"首页";
     c1.tabBarItem.image=[UIImage imageNamed:@"footbar_data_nor"];
    
    UIViewController *c2=[[UIViewController alloc]init];
    c2.view.backgroundColor=[UIColor greenColor];
    c2.tabBarItem.title=@"店铺";
    c2.tabBarItem.image=[UIImage imageNamed:@"footbar_data_nor"];
    
    UIViewController *c3=[[UIViewController alloc]init];
    c3.view.backgroundColor=[UIColor yellowColor];
    c3.tabBarItem.title=@"统计";
    c3.tabBarItem.image=[UIImage imageNamed:@"footbar_data_nor"];
    
    UIViewController *c4=[[UIViewController alloc]init];
    c4.view.backgroundColor=[UIColor redColor];
    c4.tabBarItem.title=@"消息";
    c4.tabBarItem.image=[UIImage imageNamed:@"footbar_data_nor"];
    
    UIViewController *c5=[[UIViewController alloc]init];
    c5.view.backgroundColor=[UIColor orangeColor];
    c5.tabBarItem.title=@"我的";
    c5.tabBarItem.image=[UIImage imageNamed:@"footbar_data_nor"];
    tb.viewControllers=@[c1,c2,c3,c4,c5];
    self.window.rootViewController = tb;
   
 # 自定义UITabBar：SGTabBar
 ## 原理1：循环遍历子视图用隐藏中间按钮用SGMiddleBtn替换
     int btnIndex = 0;
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
 ## 原理2:使用hitTest:withEvent:方法让凸出的部分也能点击
   //重写hitTest方法，去监听"+"按钮和“添加”标签的点击，目的是为了让凸出的部分点击也有反应<br/>
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {<br/>
    //这一个判断是关键，不判断的话push到其他页面，点击“+”按钮的位置也是会有反应的，这样就不好了<br/>
    //self.isHidden == NO 说明当前页面是有TabBar的，那么肯定是在根控制器页面<br/>
    //在根控制器页面，那么我们就需要判断手指点击的位置是否在“+”按钮或“添加”标签上<br/>
    //是的话让“+”按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了<br/>
     if (self.isHidden == NO){<br/>
             //将当前TabBar的触摸点转换坐标系，转换到“+”按钮的身上，生成一个新的点<br/>
            CGPoint newA = [self convertPoint:point toView:self.addButton];<br/>
             //将当前TabBar的触摸点转换坐标系，转换到“添加”标签的身上，生成一个新的点<br/>
             CGPoint newL = [self convertPoint:point toView:self.addLabel];<br/>
             //判断如果这个新的点是在“+”按钮身上，那么处理点击事件最合适的view就是“+”按钮<br/>
             if ( [self.addButton pointInside:newA withEvent:event]){<br/>
                     return self.addButton;<br/>
                 }<br/>
             //判断如果这个新的点是在“添加”标签身上，那么也让“+”按钮处理事件<br/>
             else if([self.addLabel pointInside:newL withEvent:event]){<br/>
                     return self.addButton;<br/>
                 }<br/>
             else{//如果点不在“+”按钮身上，直接让系统处理就可以了<br/>
                     return [super hitTest:point withEvent:event];<br/>
                 }<br/>
             }<br/>
     else{<br/>
         //TabBar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了<br/>
         return [super hitTest:point withEvent:event];<br/>
     }<br/>
}
  
  # 自定义UITabBarController：SGTabBarController
  
  ## 1:关键代码:用kvc原理替换原有tabBar
  
  - (void)viewDidLoad {<br/>
         [super viewDidLoad];<br/>
         // Do any additional setup after loading the view.<br/>
    //创建自定义TabBar<br/>
    SGTabBar *myTabBar = [[SGTabBar alloc] init];<br/>
    myTabBar.myTabBarDelegate = self;<br/>
    //利用KVC替换默认的TabBar<br/>
    [self setValue:myTabBar forKey:@"tabBar"];<br/>
}

  ## 2:实现MyTabBarDelegate代理方法

 #pragma mark - MyTabBarDelegate
 -(void)addButtonClick:(SGTabBar *)tabBar<br/>
 {<br/>
     //跳到中间界面（这里也可以做其它操作，我这里直接跳到中间界面）<br/>
     [self setSelectedIndex:2];<br/>
 }<br/>
 
 
 # SGMiddleBtn
 这是一个自定义的按钮，比较简单就不描述了
  
    
    
