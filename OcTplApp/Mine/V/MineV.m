//
//  MineV.m
//  OcTplApp
//
//  Created by Stone on 2018/6/23.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "MineV.h"

@implementation MineV
- (id)init
{
    self = [super init];
    if(self){
        _dataMs = [NSArray arrayWithObjects:@"MGJRouter测试",@"CTMediator测试",@"GCD",@"Runtime",@"内存管理",@"RunLoop基础知识",@"NSOperation", nil];
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    [self setUpUI];
}
- (void)setUpUI{
    
    _statusNaviV = [STVFactory createVWithFrame:CGRectZero color:whiteC];
    [self addSubview:_statusNaviV];
    
    _logoIMV = [[UIImageView alloc] init];
    _logoIMV.image = [UIImage imageNamed:@"home_pic_guaguagou"];
    [_statusNaviV addSubview:_logoIMV];
    
    _titleBtn = [STVFactory createLabelWithFrame:CGRectZero text:@"选择门店" color:deepBlackC font:[UIFont systemFontOfSize:18] textAlignment:NSTextAlignmentCenter];
    [_statusNaviV addSubview:_titleBtn];
    
    //注册cell的名称
    _tableV = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableV.delegate = self;
    _tableV.dataSource = self;
    _tableV.estimatedRowHeight = 120;
    _tableV.estimatedSectionHeaderHeight = 100;
    _tableV.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableV.showsVerticalScrollIndicator = NO;
    //给tableV注册Cells
    [_tableV registerClass:[UITableViewCell class] forCellReuseIdentifier: @"uITableViewCell"];
    //添加下拉刷新头
    _tableV.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(toFreshDs)];
    //添加上拉加载尾
    _tableV.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(toLoadMs)];
    // 马上进入刷新状态
    [self addSubview:_tableV];
    
    //添加约束
    [self setMas];
}
- (void) setMas{
    [_statusNaviV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(StatusBarAndNaviBarH);
    }];
    [_titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(StatusBarH);
        make.centerX.equalTo(_statusNaviV);
        make.height.mas_equalTo(NaviBarH);
    }];
    [_logoIMV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(StatusBarH + 9);
        make.left.mas_equalTo(spaceM);
    }];
    [_tableV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_statusNaviV.mas_bottom);
        make.left.equalTo(self);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.width.mas_equalTo(ScreenW);
    }];
}

// MARK: - UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_dataMs count];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerV = [[UIView alloc] init];
    return headerV;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return  0.000001;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerV = [[UIView alloc] init];
    return footerV;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return  0.000001;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    uITableViewCell"];
    if (!Cell){
        Cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"uITableViewCell"];
    }
    Cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    Cell.textLabel.text = _dataMs[indexPath.row];
    return Cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [_delegate toCellAct:indexPath.row];
}
- (void)toFreshDs{
    [_delegate toFreshDs];
}

- (void)toLoadMs{
    [_delegate toLoadMs];
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end

