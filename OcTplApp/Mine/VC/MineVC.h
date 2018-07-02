//
//  MineVC.h
//  OcTplApp
//
//  Created by Stone on 2018/6/23.
//  Copyright © 2018年 Stone. All rights reserved.

#import <UIKit/UIKit.h>
#import "MineV.h"
@interface MineVC : UIViewController<MineVDel,STPlaceholderViewDelegate>
//视图
@property (nonatomic,strong) MineV *mineV;
//定义一个没有数据时的View
@property (nonatomic,strong)STPlaceholderView *placeholderV;

@end
