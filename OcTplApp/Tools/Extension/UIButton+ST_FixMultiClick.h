//
//  UIButton+ST_FixMultiClick.h
//  Gstore
//
//  Created by test on 2018/5/29.
//  Copyright © 2018年 com.youlu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ST_FixMultiClick)

@property (nonatomic, assign) NSTimeInterval st_acceptEventInterval; // 重复点击的间隔

@property (nonatomic, assign) NSTimeInterval st_acceptEventTime;

- (void)st_MatchClickArea:(CGSize)size;

@end
