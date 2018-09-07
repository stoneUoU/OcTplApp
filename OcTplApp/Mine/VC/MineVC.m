//
//  MineVC.m
//  OcTplApp
//
//  Created by Stone on 2018/6/23.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "MineVC.h"
@interface MineVC ()

@end

@implementation MineVC

- (id)init
{
    self = [super init];
    if (self){
        _mineV = [[MineV alloc] init]; //对MyUIView进行初始化
        _mineV.backgroundColor = tableVC;
        _mineV.delegate = self; //将SecondVC自己的实例作为委托对象
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUI];
    _mineV.dataMs = [NSMutableArray arrayWithObjects:@"MGJRouter测试",@"CTMediator测试",@"GCD",@"Runtime",@"内存管理",@"RunLoop基础知识",@"NSOperation",@"发送xml请求", nil];
//    [_mineV.tableV reloadData];
}

- (void)setUI{
    [self.view addSubview:_mineV];
    //添加约束
    [self setMas];
}
- (void) setMas{
    [_mineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.width.mas_equalTo(ScreenW);
        make.height.mas_equalTo(ScreenH  - TabBarH);
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
            //[MBProgressHUD showAutoMessage:@"林磊"];
            //[MBProgressHUD showInfo:@"Succ" ToView:self.view];
            //[MBProgressHUD showError:@"Succ" ToView:self.view];
            break;
        }
        case 1:
        {
            UIViewController *vc = [[CTMediator sharedInstance] st_mediator_toCTMediatorVC];
            [MethodFunc pushToNextVC:self destVC:vc];
            break;
        }
        case 2:
        {
            UIViewController *vc = [[CTMediator sharedInstance] st_mediator_toGCDVC];
            [MethodFunc pushToNextVC:self destVC:vc];
            break;
        }
        case 3:
        {
            UIViewController *vc = [[CTMediator sharedInstance] st_mediator_toRunTimeVC];
            [MethodFunc pushToNextVC:self destVC:vc];
            break;
        }
        case 4:
        {
            UIViewController *vc = [[CTMediator sharedInstance] st_mediator_toStorageVC];
            [MethodFunc pushToNextVC:self destVC:vc];
            break;
        }
        case 5:
        {
            UIViewController *vc = [[CTMediator sharedInstance] st_mediator_toRunLoopVC];
            [MethodFunc pushToNextVC:self destVC:vc];
            break;
        }
        case 6:
        {
            UIViewController *vc = [[CTMediator sharedInstance] st_mediator_toNSOperateVC];
            [MethodFunc pushToNextVC:self destVC:vc];
            break;
        }
        case 7:
        {
            [self setNetTools];
            break;
        }
        default:
            break;
    }
}
-(void)setNetTools{
    //NSString *paras = @"<?xml version=\"1.0\" encoding=\"utf-8\"?><alipay><is_success>T</is_success><request><param name=\"_input_charset\">utf-8</param><param name=\"service\">single_trade_query</param><param name=\"partner\">2088121424678319</param><param name=\"out_trade_no\">H161021114440198N</param></request><response><trade><body>订单：T16102111443568</body><buyer_email>1176760525@qq.com</buyer_email><buyer_id>2088402231747066</buyer_id><discount>0.00</discount><flag_trade_locked>0</flag_trade_locked><gmt_create>2016-10-21 11:45:06</gmt_create><gmt_last_modified_time>2016-10-21 11:45:16</gmt_last_modified_time><gmt_payment>2016-10-21 11:45:17</gmt_payment><is_total_fee_adjust>F</is_total_fee_adjust><operator_role>B</operator_role><out_trade_no>H161021114440198N</out_trade_no><payment_type>1</payment_type><price>0.01</price><quantity>1</quantity><seller_email>pay@gstarcad.com</seller_email><seller_id>2088121424678319</seller_id><subject>的生活费...</subject><time_out>2017-01-20 11:45:17</time_out><time_out_type>finishFPAction</time_out_type><to_buyer_fee>0.00</to_buyer_fee><to_seller_fee>0.01</to_seller_fee><total_fee>0.01</total_fee><trade_no>2016102121001004060245497067</trade_no><trade_status>TRADE_SUCCESS</trade_status><use_coupon>F</use_coupon></trade></response><sign>25217c932f49868371a301e3151201a2</sign><sign_type>MD5</sign_type></alipay>";
    NSDictionary *paras = @{@"type":@"xml",@"xml":@"<?xml version=\"1.0\" encoding=\"utf-8\"?><data><user_name>I am Stone's loveCat</user_name><pass_word>888888</pass_word></data>"};
    [NetWorkManager requestXMLWithType:HttpRequestTypeGet withUrlString:@"/testXML" withParaments:paras Authos:@"" withSuccessBlock:^(NSDictionary *feedBacks) {
        STLog(@"%@",feedBacks);
    } withFailureBlock:^(NSError *error) {
        STLog(@"%@",error)
    }];
//    NSString *paras = @"<?xml version=\"1.0\" encoding=\"utf-8\"?><root><user_name>I am Stone's loveCat</user_name><pass_word>888888</pass_word></root>";
//    [NetWorkManager requestXMLWithType:HttpRequestTypePost withUrlString:@"/testXML" withParaments:paras Authos:@"" withSuccessBlock:^(NSDictionary *feedBacks) {
//        STLog(@"%@",feedBacks);
//    } withFailureBlock:^(NSError *error) {
//        STLog(@"%@",error)
//    }];

//    NSDictionary *paras = @{@"type":@"json",@"user_name":@"I am Stone's loveCat",@"pass_word":@"888888"};
//    [NetWorkManager requestWithType:HttpRequestTypeGet withUrlString:@"/testXML" withParaments:paras Authos:@"" withSuccessBlock:^(NSDictionary *feedBacks) {
//        STLog(@"%@",feedBacks);
//    } withFailureBlock:^(NSError *error) {
//        STLog(@"%@",error)
//    }];

//    NSDictionary *paras = @{@"type":@"json",@"user_name":@"I am Stone's loveCat",@"pass_word":@"888888"};
//    [NetWorkManager requestWithType:HttpRequestTypePost withUrlString:@"/testXML" withParaments:paras Authos:@"" withSuccessBlock:^(NSDictionary *feedBacks) {
//        STLog(@"%@",feedBacks);
//    } withFailureBlock:^(NSError *error) {
//        STLog(@"%@",error)
//    }];
}
- (void)toFreshDs {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_mineV.tableV.mj_header endRefreshing];
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

