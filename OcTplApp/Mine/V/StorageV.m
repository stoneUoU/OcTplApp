//
//  StorageV.m
//  OcTplApp
//
//  Created by Stone on 2018/7/2.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "StorageV.h"
@implementation StorageV
- (id)init
{
    self = [super init];
    if(self){
        _dataMs = [NSArray arrayWithObjects:@"属性关键字",@"AutoRelease",nil];
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    [self setUpUI];
}
- (void)setUpUI{
    
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
    [_tableV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self);
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
