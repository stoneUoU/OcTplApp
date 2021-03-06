//
//  TabBarVC.m
//  OcTplApp
//
//  Created by Stone on 2018/6/23.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "TabBarVC.h"
#import "MineVC.h"
#import "HomeVC.h"
//#import "SmsLoginVC.h"
#import "UIImage+Image.h"

@implementation TabBarVC
//定义一个静态变量，实现登录后的跳转界面
static TabBarVC *tabVC = nil;
+(TabBarVC *)sharedVC{
    @synchronized(self){
        if(tabVC == nil){
            tabVC = [[self alloc] init];
        }
    }
    return tabVC;
}

#pragma mark - 第一次使用当前类的时候对设置UITabBarItem的主题
+ (void)initialize
{
    if (@available(iOS 9.0, *)) {
        UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
        
        NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
        dictNormal[NSForegroundColorAttributeName] = [UIColor grayColor];
        dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:11];
        
        NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
        dictSelected[NSForegroundColorAttributeName] = redC;
        dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:11];
        
        [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
        [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
    } else {
        // Fallback on earlier versions
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpAllChildVc];
    
    
    //注意，shouldSelectViewController此方法得设置这个代理
    self.delegate = self;
    
    //创建自己的tabbar，然后用kvc将自己的tabbar和系统的tabBar替换下
    TabBar *tabbar = [[TabBar alloc] init];
    tabbar.delegate = self;
    //kvc实质是修改了系统的_tabBar
    [self setValue:tabbar forKeyPath:@"tabBar"];
}

#pragma mark - ------------------------------------------------------------------
#pragma mark - 初始化tabBar上除了中间按钮之外所有的按钮

- (void)setUpAllChildVc
{
    
    HomeVC *homeV = [[HomeVC alloc] init];
    [self setUpOneChildVcWithVc:homeV Image:@"mine_icon_store_onclick" selectedImage:@"mine_icon_store_click" title:@"主页"];
    
    MineVC *mineV = [[MineVC alloc] init];
    [self setUpOneChildVcWithVc:mineV Image:@"mine_icon_mine_onclick" selectedImage:@"mine_icon_mine_click" title:@"我的"];
}

#pragma mark - 初始化设置tabBar上面单个按钮的方法

/**
 *  @author li bo, 16/05/10
 *
 *  设置单个tabBarButton
 *
 *  @param Vc            每一个按钮对应的控制器
 *  @param image         每一个按钮对应的普通状态下图片
 *  @param selectedImage 每一个按钮对应的选中状态下的图片
 *  @param title         每一个按钮对应的标题
 */
- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:Vc];
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    Vc.tabBarItem.image = myImage;
    
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    Vc.tabBarItem.selectedImage = mySelectedImage;
    
    Vc.tabBarItem.title = title;
    
    [self addChildViewController:nav];
    
}
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    //return YES;
    if ([[NSString stringWithFormat:@"%@",viewController.tabBarItem.title]  isEqualToString: @"我的"]){
        //取是否登录
        if (![[NSString stringWithFormat:@"%@",[UICKeyChainStore keyChainStore][@"orLogin"]]  isEqual: @"true"]){
            //Mark 弹出登录视图：进app直接点我的tab登录:status_code:2
//            SmsLoginVC * smsLoginV = [[SmsLoginVC alloc] init];
//            smsLoginV.pass_Vals = @{@"status_code":@"2"};
//            [MethodFunc presentToNaviVC:self destVC:smsLoginV animate:YES];
            return YES;
        }else{
            return YES;
        }
    }else{
        return YES;
    }
}
- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
}
@end
