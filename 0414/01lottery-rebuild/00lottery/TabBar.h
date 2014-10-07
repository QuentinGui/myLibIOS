//
//  TabBar.h
//  00lottery
//
//  Created by guiqing on 10/7/14.
//  Copyright (c) 2014 guiqing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  TabBar;
@protocol TabBarDelegate <NSObject>

@optional
-(void)tabBar:(TabBar*)tabBar didSelectButtonFrom:(int)from to:(int)to;

@end


@interface TabBar : UIView

//代理属性要放在这里,否则,别的类是无法访问的
@property(nonatomic,weak) id<TabBarDelegate> delegate;

@end
