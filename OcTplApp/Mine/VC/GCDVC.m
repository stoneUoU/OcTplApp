//
//  GCDVC.m
//  OcTplApp
//
//  Created by Stone on 2018/6/24.
//  Copyright © 2018年 Stone. All rights reserved.
//
#import "GCDVC.h"
@interface GCDVC ()

@end

@implementation GCDVC

- (id)init
{
    self = [super init];
    if (self){
        _gCDV = [[GCDV alloc] init]; //对MyUIView进行初始化
        _gCDV.backgroundColor = tableVC;
        _gCDV.delegate = self; //将SecondVC自己的实例作为委托对象
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBaseUI:@"GCD测试" sideVal:@"" backIvName:@"back_icon.png" navC:whiteC midFontC:deepBlackC sideFontC:whiteC];
    [self setUI];
    
}

- (void)setUI{
    [self.view addSubview:_gCDV];
    //添加约束
    [self setMas];
}
- (void) setMas{
    [_gCDV mas_makeConstraints:^(MASConstraintMaker *make) {
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
        [_gCDV.tableV.mj_header endRefreshing];
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

//#import "GCDVC.h"
//
//@interface GCDVC ()
//
//@end
//
//@implementation GCDVC
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    [self setBaseUI:@"GCD测试" sideVal:@"" backIvName:@"back_icon.png" navC:whiteC midFontC:deepBlackC sideFontC:whiteC];
//    self.view.backgroundColor = greenC;
//
//    [self test];
//}
//- (void)syncMain{
//    //获取主队列
//    dispatch_queue_t queue = dispatch_get_main_queue();
//
//    NSLog(@"---start---");
//    //使用同步函数封装三个任务
//    sleep(2);
//    dispatch_async(queue, ^{
//        NSLog(@"任务1---%@", [NSThread currentThread]);
//    });
//    NSLog(@"---end---");
//}
//
//-(void)test{
//    dispatch_queue_t serialQueue = dispatch_queue_create("com.dullgrass.serialQueue", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(serialQueue, ^{
//        NSLog(@"会执行的代码");
//        dispatch_async(serialQueue, ^{
//            sleep(2);
//            NSLog(@"代码不执行");
//        });
//        STLog(@"end");
//    });
//}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//
////调用NSObject
////[self performSelector:@selector(run) withObject:nil afterDelay:2.0];
////
//////GCD延迟
////dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
////    NSLog(@"run-----");
////});
////
//////定时器延迟，重复为NO
////[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:NO];
//
//
//@end
