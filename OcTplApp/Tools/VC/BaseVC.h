//
//  BaseVC.h
//  OcTplApp
//
//  Created by Stone on 2018/6/24.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STPlaceholderView.h"
@interface BaseVC : UIViewController<UIGestureRecognizerDelegate,STPlaceholderViewDelegate>
@property (nonatomic ,strong)UIView *statusV;

@property (nonatomic ,strong)UIView *navBarV;

@property (nonatomic ,strong)UILabel *midFontL;
@property (nonatomic ,strong)UIButton *backBtn;
@property (nonatomic ,strong)UIButton *sideBtn;
@property (nonatomic ,strong)UIView *cutOffV;
@property(nonatomic, copy) NSString *Auths;
//定义一个没有数据时的View
@property (nonatomic,strong)STPlaceholderView *placeholderV;

//创建导航栏
- (void)setBaseUI:(NSString *) midVal sideVal:(NSString *)sideVal backIvName:(NSString *)backIvName navC:(UIColor *)navC midFontC:(UIColor *)midFontC sideFontC:(UIColor *)sideFontC;

//定义方法
-(void) toBack;

//定义方法
-(void) toSide;
@end
