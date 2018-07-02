//
//  Macros.h
//  OcTplApp
//
//  Created by Stone on 2018/6/23.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import <Foundation/Foundation.h>
//自定义Log输入日志+显示行号
#ifdef DEBUG
#define STLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define STLog(...)
#endif

//设计师设计以iphone6为原型：
#define iphoneSixW 375
//以6/6s为准宽度缩小系数
#define StScaleW   [UIScreen mainScreen].bounds.size.width/375.0
//高度缩小系数
#define StScaleH  [UIScreen mainScreen].bounds.size.height/667.0

// UIScreen.
#define  ScreenInfo   [UIScreen mainScreen].bounds.size
// UIScreen width.
#define  ScreenW   [UIScreen mainScreen].bounds.size.width
// UIScreen height.
#define  ScreenH  [UIScreen mainScreen].bounds.size.height
#define  spaceM 15
// iPhone X
#define  isX (ScreenW == 375.f && ScreenH == 812.f ? YES : NO)
// iPhone SE
#define  isSE (ScreenW == 320.f && ScreenH == 568.f ? YES : NO)
// Status bar height.
#define  StatusBarH     (isX ? 44.f : 20.f)
// Navigation bar height.
#define  NaviBarH  44.f
// Tabbar height.
#define  TabBarH   (isX ? (49.f+34.f) : 49.f)
// Tabbar safe bottom margin.
#define  TabbarSafeBottomM        (isX ? 34.f : 0.f)
// Status bar & navigation bar height.
#define  StatusBarAndNaviBarH  (isX ? 88.f : 64.f)
#define ViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})
////请求地址：生产环境
//#define GstoreURL  @"https://app.shop.znrmny.com/"
//#define picUrl @"https://pic.shop.znrmny.com/static/ggshop/v3"
//#define webVIP @"https://webview.cht.znrmny.com/"
////定义BaseURL后面的一戳
//#define followRoute @"api/ggshop/member/v3/"

//请求地址：测试环境
#define GstoreURL  @""
#define GstoreURL  @""
#define picUrl @""
#define followRoute @""
//定义登录失效的状态码
#define OutCodeZero  @"1001"
#define OutCodeOne  @"1002"
//请求超时时间
#define timeoutTime 6.0
//没网时的提示
#define missNetTips @"网络开小差啦，请检查网络"
//登录失效的提示
#define missSsidTips @"登录失效，请重新登录"
//设置弹窗位置
#define Pos StToastShowTypeCenter
//定义颜色（随机）
#define STColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define STRandomC STColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))
//页面风格定制颜色：
#define styleColor  [UIColor color_HexStr:@"f4511e"]
#define deepBlackC [UIColor color_HexStr:@"212121"]   //字体颜色
#define midBlackC [UIColor color_HexStr:@"a8a8a8"]   //字体颜色
#define cutOffLineC [UIColor colorWithRed:199/255.0 green:199/255.0 blue:204/255.0 alpha:0.7]//UIColor.RGBA(199, 199, 204,0.70)  //分割线颜色
#define tableVC  [UIColor color_HexStr:@"edecf2"]
#define whiteC [UIColor whiteColor]
#define redC [UIColor redColor]
#define greenC [UIColor greenColor]
#define blueC [UIColor blueColor]
#define WeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;//弱引用
#define defineAuths @"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6IjE1NzE3OTE0NTA1IiwiYWNjb3VudF9pZCI6IjExIn0.t17OALyVnuAAqdHLAQdESsEJ454Qa5PBSiCxc-bjuto"

