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
//类拓展,在此遵守协议,相当于在头文件中,和头文件的区别是:内部的属性,外部是无法访问的
@interface TabViewController ()<TabBarDelegate>

@end

@implementation TabViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    //因为要把自己的定义的内容添加到默认的tabBar上面，所以不能删除掉，否则无法显示tabBar
    //[self.tabBar removeFromSuperview];
    //定义并设置自己的TabBar
    TabBar *myTabBar = [[TabBar alloc]init]; 
    myTabBar.frame=self.tabBar.bounds;
    myTabBar.delegate=self;
    [self.tabBar addSubview:myTabBar];
    
    //添加对应个数的按钮
    for(int i=0;i<self.viewControllers.count;i++){
        NSString* name=[NSString stringWithFormat:@"TabBar%d",i+1];
        NSString* selName=[NSString stringWithFormat:@"TabBar%dSel",i+1];
        [myTabBar addTabButtonWithName:name selName:selName];
    }
}

#pragma -mark 代理方法:切换子控制器
-(void)tabBar:(TabBar *)tabBar didSelectButtonFrom:(int)from to:(int)to
{
    //通过索引设置选中的控制器
    self.selectedIndex=to;
}

@end
