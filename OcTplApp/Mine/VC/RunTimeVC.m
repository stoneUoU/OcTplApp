//
//  RunTimeVC.m
//  OcTplApp
//
//  Created by Stone on 2018/7/2.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "RunTimeVC.h"
@interface RunTimeVC ()

@end

@implementation RunTimeVC

- (id)init
{
    self = [super init];
    if (self){
        _runTimeV = [[RunTimeV alloc] init]; //对MyUIView进行初始化
        _runTimeV.backgroundColor = tableVC;
        _runTimeV.delegate = self; //将SecondVC自己的实例作为委托对象
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBaseUI:@"Runtime测试" sideVal:@"" backIvName:@"back_icon.png" navC:whiteC midFontC:deepBlackC sideFontC:whiteC];
    [self setUI];
}

- (void)setUI{
    [self.view addSubview:_runTimeV];
    //添加约束
    [self setMas];
}
- (void) setMas{
    [_runTimeV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(StatusBarAndNaviBarH);
        make.left.equalTo(self.view);
        make.width.mas_equalTo(ScreenW);
        make.height.mas_equalTo(ScreenH  - StatusBarAndNaviBarH);
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:true];
    self.navigationController.navigationBarHidden = true;
}
#pragma MineVDel
- (void)toCellAct:(NSInteger)idx {
    switch (idx) {
        case 0:
        {
            UIViewController *vc = [[CTMediator sharedInstance] st_mediator_toMGJRouterVCWithParams:@{@"林磊":@"林磊"}];
            [MethodFunc pushToNextVC:self destVC:vc];
            break;
        }
        case 1:
        {
            UIViewController *vc = [[CTMediator sharedInstance] st_mediator_toCTMediatorVC];
            [MethodFunc pushToNextVC:self destVC:vc];
            break;
        }
        default:
            break;
    }
}

- (void)toFreshDs {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_runTimeV.tableV.mj_header endRefreshing];
    });
}

- (void)toLoadMs {
    STLog(@"下拉加载");
}

- (void)placeholderView:(STPlaceholderView *)placeholderView reloadButtonDidClick:(UIButton *)sender {
    switch (placeholderView.type) {
            
        case STPlaceholderViewTypeNoNetwork:     // 没网
        {
            STLog(@"没网");
        }
            break;
            
        case STPlaceholderViewTypeNoPosi: // 没有位置权限
        {
            STLog(@"没有位置权限");
        }
            break;
        case STPlaceholderViewTypeNoStore:// 没有门店信息
        {
            STLog(@"没有门店信息");
        }
            break;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
