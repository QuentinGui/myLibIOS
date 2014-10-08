//
//  TabViewController.m
//  00lottery
//
//  Created by guiqing on 10/7/14.
//  Copyright (c) 2014 guiqing. All rights reserved.
//

#import "TabViewController.h"
#import "TabBar.h"
#import "TabBarButton.h"

@interface TabViewController ()<TabBarDelegate>

@end

@implementation TabViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
 
    //1.想要设置tabbar controller的view为我们自己的,但是发现是只读的.
    //1.1 删除原来的,不删除也可以,但是可能会出问题
    [self.tabBar removeFromSuperview];
    //1.2 定义并设置自己的
    TabBar *myTabBar = [[TabBar alloc]init];
    myTabBar.frame=self.tabBar.frame;
    myTabBar.delegate=self;
    myTabBar.backgroundColor=[UIColor blueColor];
    [self.view addSubview:myTabBar];
}

#pragma -mark 代理方法:切换子控制器

-(void)tabBar:(TabBar *)tabBar didSelectButtonFrom:(int)from to:(int)to
{
    
    self.selectedIndex=to;

}

@end
