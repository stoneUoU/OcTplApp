//
//  TestingV.m
//  OcTplApp
//
//  Created by test on 2018/8/31.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "TestingV.h"

@implementation TestingV

- (void)drawRect:(CGRect)rect {
    [self setUI];
}
-(void) setUI{
    _btn = [[UIButton alloc] initWithFrame:CGRectZero];
    _btn.backgroundColor = [UIColor greenColor];
    [_btn setTitle:@"oooooooo" forState:UIControlStateNormal];
    [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[_btn addTarget:self action:@selector(tearDown:) forControlEvents:UIControlEventTouchUpInside];
    [_btn setUserInteractionEnabled:YES];
    UITapGestureRecognizer *resGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toTest:)];
    [_btn addGestureRecognizer:resGes];
    [self addSubview:_btn];
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.height.mas_equalTo(72);
        make.width.mas_equalTo(ScreenW);
    }];
}
-(void)tearDown:(UIButton *)btn{
    if([_delegate respondsToSelector:@selector(toExcute:)]){
        [_delegate toExcute:@"我是代理"];
    }

    if(_sTBlock != NULL){
        _sTBlock(@"我是闭包");
    }
}


-(void)toTest:(UIGestureRecognizer *)ges{
    if([_delegate respondsToSelector:@selector(toExcute:)]){
        [_delegate toExcute:@"我是代理====="];
    }

    if(_sTBlock != NULL){
        _sTBlock(@"我是闭包");
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
