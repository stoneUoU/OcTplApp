//
//  StorageV.h
//  OcTplApp
//
//  Created by Stone on 2018/7/2.
//  Copyright © 2018年 Stone. All rights reserved.
//
#import <UIKit/UIKit.h>
@protocol StorageVDel
//这里只需要声明方法
-(void)toCellAct:(NSInteger)idx;
- (void)toFreshDs; //下拉刷新
- (void)toLoadMs; //上拉加载
@end
@interface StorageV : UIView<UITableViewDelegate,UITableViewDataSource>{
}
@property (nonatomic ,weak)id<StorageVDel> delegate; //定义一个属性，可以用来进行get set操作

@property (nonatomic ,strong)UITableView *tableV;

@property (nonatomic,copy)NSArray * dataMs;

@end
