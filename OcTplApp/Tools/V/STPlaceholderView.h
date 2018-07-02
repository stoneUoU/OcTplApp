//
//  STPlaceholderView.h
//  OcTplApp
//
//  Created by Stone on 2018/6/24.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 占位图的类型 */
typedef NS_ENUM(NSInteger, STPlaceholderViewType) {
    /** 没网 */
    STPlaceholderViewTypeNoNetwork = 1,
    /** 没有位置权限 */
    STPlaceholderViewTypeNoPosi,
    /** 没有门店信息 */
    STPlaceholderViewTypeNoStore,
    /** 没有订单信息 */
    STPlaceholderViewTypeNoOrder
};

#pragma mark - @protocol

@class STPlaceholderView;

@protocol STPlaceholderViewDelegate <NSObject>

/** 占位图的重新加载按钮点击时回调 */
- (void)placeholderView:(STPlaceholderView *)placeholderView
   reloadButtonDidClick:(UIButton *)sender;

@end

#pragma mark - @interface

@interface STPlaceholderView : UIView

/** 占位图类型（只读） */
@property (nonatomic, assign, readonly) STPlaceholderViewType type;
/** 占位图的代理方（只读） */
@property (nonatomic, weak, readonly) id <STPlaceholderViewDelegate> delegate;

/**
 构造方法
 
 @param frame 占位图的frame
 @param type 占位图的类型
 @param delegate 占位图的代理方
 @return 指定frame、类型和代理方的占位图
 */
- (instancetype)initWithFrame:(CGRect)frame
                         type:(STPlaceholderViewType)type
                     delegate:(id)delegate;

@end

