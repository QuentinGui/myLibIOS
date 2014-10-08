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

    //创建自定义的按钮
    TabBarButton *button =[TabBarButton buttonWithType:UIButtonTypeCustom];
    //设置图片
    [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selName] forState:UIControlStateSelected];
    //添加到TabBar上 
    [self addSubview:button];
   //按钮点击的方法改为 UIControlEventTouchDown 
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    
    // 默认选中第0个按钮
    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
 

}


//layoutSubviews是给子控件设置尺寸的最佳位置,这里利用 子控件.frame 拿到的frame才是最真实的frame
-(void)layoutSubviews{
    [super layoutSubviews];//千万不要忘记调用父类的super
    int count = self.subviews.count;
    for (int i=0; i<count; i++) {
        TabBarButton * button = self.subviews[i];
        button.tag=i;
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
    //通知代理那个按钮被点击了,要在 _selectedButton = button之前进行赋值
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
