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
    attrs[NSForegroundColorAttributeName]=[UIColor whiteColor];
    attrs[NSFontAttributeName]=[UIFont systemFontOfSize:16];
    
    //将属性数组设置
    [navBar setTitleTextAttributes:attrs];

}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed=YES;
    [super pushViewController:viewController animated:YES];

}


@end
