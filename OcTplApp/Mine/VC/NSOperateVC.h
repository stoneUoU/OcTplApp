//
//  NSOperateVC.h
//  OcTplApp
//
//  Created by Stone on 2018/7/2.
//  Copyright © 2018年 Stone. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "NSOperateV.h"
@interface NSOperateVC : BaseVC<NSOperateVDel,STPlaceholderViewDelegate>
//视图
@property (nonatomic,strong) NSOperateV *nSOperateV;
@end
