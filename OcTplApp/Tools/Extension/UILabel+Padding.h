//
//  UILabel+Padding.h
//  Gstore
//
//  Created by test on 2018/5/29.
//  Copyright © 2018年 com.youlu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomLabel : UILabel

@property (nonatomic, assign) IBInspectable CGFloat leftEdge;
@property (nonatomic, assign) IBInspectable CGFloat rightEdge;
@property (nonatomic, assign) IBInspectable CGFloat topEdge;
@property (nonatomic, assign) IBInspectable CGFloat bottomEdge;
@property (nonatomic, assign) UIEdgeInsets edgeInsets;

@end
