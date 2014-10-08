//
//  TabBarButton.m
//  00lottery
//
//  Created by guiqing on 10/7/14.
//  Copyright (c) 2014 guiqing. All rights reserved.
//

#import "TabBarButton.h"


/**
 主要是为了覆盖setHighlighted:方法,防止按住按钮做一些复杂的操作
 
 :param: idinitWithFrame <#idinitWithFrame description#>
 */
@implementation TabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
//覆盖这个方法,是为了防止按钮自己做一些多余的操作!
-(void)setHighlighted:(BOOL)highlighted{

    //注意,不用调用super ,否则相当于没有覆盖!
    
}

@end
