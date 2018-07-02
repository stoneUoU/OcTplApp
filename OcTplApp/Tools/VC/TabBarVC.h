//
//  TabBarVC.h
//  OcTplApp
//
//  Created by Stone on 2018/6/23.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBar.h"
@interface TabBarVC : UITabBarController<UITabBarControllerDelegate>
//自定义导航栏
+(TabBarVC *)sharedVC;

@end
