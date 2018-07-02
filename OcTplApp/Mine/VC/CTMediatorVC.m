//
//  CTMediatorVC.m
//  OcTplApp
//
//  Created by Stone on 2018/7/2.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "CTMediatorVC.h"

@interface CTMediatorVC ()

@end

@implementation CTMediatorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBaseUI:@"CTMediator测试" sideVal:@"" backIvName:@"back_icon.png" navC:whiteC midFontC:deepBlackC sideFontC:whiteC];
    self.view.backgroundColor = whiteC;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
