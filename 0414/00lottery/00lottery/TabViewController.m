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

@interface TabViewController ()

//2.6定义一个UI控件,记录当前选中的按钮是谁
@property(nonatomic,weak)UIButton* selectedButton;


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
    myTabBar.backgroundColor=[UIColor blueColor];
    [self.view addSubview:myTabBar];
    
    //2.添加五个模块按钮
    for (int i=0; i<5; i++) {
        //2.1创建按钮
        TabBarButton *button =[TabBarButton buttonWithType:UIButtonTypeCustom];
        
        //2.8给按钮绑定tag
        button.tag=i;
        
        //2.2设置图片
        NSString *name = [NSString stringWithFormat:@"TabBar%d",i+1];
        [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        NSString *selectName = [NSString stringWithFormat:@"TabBar%dSel",i+1];
        [button setBackgroundImage:[UIImage imageNamed:selectName] forState:UIControlStateSelected];
        //2.3设置frame
        CGFloat buttonY=0;
        CGFloat buttonW=myTabBar.frame.size.width*0.2;
        CGFloat buttonH=myTabBar.frame.size.height;
        CGFloat buttonX=i*buttonW;
        button.frame=CGRectMake(buttonX,buttonY, buttonW, buttonH);
        //2.4添加到view
        [myTabBar addSubview:button];
        
        //2.5监听按钮点击
       // [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        //2.9修改按钮点击的方法,这样,一点击就会有切换控制器的反应
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
        
        //2.7进来默认选中第一个(点击了这个按钮)
        if (i==0) {
            [self buttonClick:button];
        }
    }
    

}
/**
 *  按钮的状态
 normal:普通状态
 highlighted:高亮(用户长按的时候达到这个状态)
 disable:enable = NO    ; 代码控制
 selectd : selected=YES ; 代码控制
 
 */

/**
 *  tabbar按钮点击方法
 */
-(void)buttonClick:(UIButton*)button
{
    //1.让当前按钮取消选中
    self.selectedButton.selected=NO;
    //2.让新点击的选中成为选中状态
    button.selected = YES;
    //3.新点击的按钮成为当前选中的按钮
    _selectedButton=button;
    //4.切换控制器
    self.selectedIndex=button.tag;
    
}




@end
