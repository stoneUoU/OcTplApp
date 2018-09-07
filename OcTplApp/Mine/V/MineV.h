//
//  MineV.h
//  OcTplApp
//
//  Created by Stone on 2018/6/23.
//  Copyright © 2018年 Stone. All rights reserved.
//
#import <UIKit/UIKit.h>
@protocol MineVDel
//这里只需要声明方法
-(void)toCellAct:(NSInteger)idx;
- (void)toFreshDs; //下拉刷新
- (void)toLoadMs; //上拉加载
@end
@interface MineV : UIView<UITableViewDelegate,UITableViewDataSource>{
}
@property (nonatomic ,weak)id<MineVDel> delegate; //定义一个属性，可以用来进行get set操作

@property (nonatomic ,strong)UIImageView *logoIMV;

@property (nonatomic ,strong)UIView *statusNaviV;

@property (nonatomic ,strong)UILabel *titleBtn;

@property (nonatomic ,strong)UITableView *tableV;

//用来存数据
@property(nonatomic ,strong) NSMutableArray* dataMs;

@end
