//
//  TabBar.m
//  00lottery
//
//  Created by guiqing on 10/7/14.
//  Copyright (c) 2014 guiqing. All rights reserved.
//

#import "TabBar.h"
#import "TabBarButton.h"
@interface TabBar()
//2.6定义一个UI控件,记录当前选中的按钮是谁
@property(nonatomic,weak)UIButton* selectedButton;

@end




@implementation TabBar

-(void)addTabButtonWithName:(NSString*)name selName:(NSString *) selName
{

    //2.1创建按钮
    TabBarButton *button =[TabBarButton buttonWithType:UIButtonTypeCustom];
    
  
    //2.2设置图片

    [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];

    [button setBackgroundImage:[UIImage imageNamed:selName] forState:UIControlStateSelected];
    
    //2.4添加到view
    [self addSubview:button];
    
    //2.5监听按钮点击
    // [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    //2.9修改按钮点击的方法,这样,一点击就会有切换控制器的反应
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    
    // 默认选中第0个按钮
    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
 

}



-(void)layoutSubviews{
    [super layoutSubviews];//千万不要忘记调用父类的super
    int count = self.subviews.count;
    
    for (int i=0; i<count; i++) {
        
        TabBarButton * button = self.subviews[i];
        button.tag=i;
        //2.3设置frame
        CGFloat buttonY=0;
        CGFloat buttonW=self.frame.size.width*0.2;
        CGFloat buttonH=self.frame.size.height;
        CGFloat buttonX=i*buttonW;
        button.frame=CGRectMake(buttonX,buttonY, buttonW, buttonH);
        
        
    }

}


/**
 *  tabbar按钮点击方法
 */
-(void)buttonClick:(UIButton*)button
{
    //0.通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectButtonFrom:self.selectedButton.tag to:button.tag];
    }
    //1.让当前按钮取消选中
    self.selectedButton.selected=NO;
    //2.让新点击的选中成为选中状态
    button.selected = YES;
    //3.新点击的按钮成为当前选中的按钮
    _selectedButton=button;
    //4.切换控制器
    //self.selectedIndex=button.tag;
    
}


@end
