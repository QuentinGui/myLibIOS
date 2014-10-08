//
//  NavViewController.m
//  00lottery
//
//  Created by guiqing on 10/7/14.
//  Copyright (c) 2014 guiqing. All rights reserved.
//

#import "NavViewController.h"

@interface NavViewController ()

@end

@implementation NavViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+(void)initialize{

    
    //设置导航栏的样式
    UINavigationBar *navBar = [UINavigationBar appearance];
    NSString *bgName=nil;
    //屏幕适配
    if(kIOS7){//7.0以上
        bgName=@"NavBar64";            
    }else{
        bgName=@"NavBar";
    }
    
    [navBar setBackgroundImage:[UIImage imageNamed:bgName] forBarMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *attrs= [NSMutableDictionary dictionary];
    //因为原来的 UITextAtrributeCTextColor 和 UITextAttributeFont已经过时
	//NS前景色 属性名称
    attrs[NSForegroundColorAttributeName]=[UIColor whiteColor];
	//NS字体 属性名称
    attrs[NSFontAttributeName]=[UIFont systemFontOfSize:16];
    
    //将属性数组设置到标题文字属性数组
    [navBar setTitleTextAttributes:attrs];

}

//重写此方法,实现拦截弹出控制器,设置弹出时隐藏底部tabBar 
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed=YES;
    [super pushViewController:viewController animated:YES];

}


@end
