//
//  TabBar.m
//  OcTplApp
//
//  Created by Stone on 2018/6/23.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "TabBar.h"
#import <objc/runtime.h>
#import "UIImage+Image.h"
#import "UIView+Extension.h"

@implementation TabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //系统自带的按钮类型是UITabBarButton，找出这些类型的按钮，然后重新排布位置，空出中间的位置
    Class class = NSClassFromString(@"UITabBarButton");
    
    int btnIndex = 0;
    for (UIButton *btn in self.subviews) {//遍历tabbar的子控件
        if ([btn isKindOfClass:class]) {//如果是系统的UITabBarButton，那么就调整子控件位置，空出中间位置
            //每一个按钮的宽度==tabbar的五分之一
            btn.width = self.width / 2;
            btn.x = btn.width * btnIndex;
            btn.tag = btnIndex;
            btnIndex++;
        }
    }
}
@end
