//
//  NSTimerVC.m
//  OcTplApp
//
//  Created by Stone on 2018/6/25.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "NSTimerVC.h"

@interface NSTimerVC ()
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation NSTimerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBaseUI:@"NSTimer测试" sideVal:@"" backIvName:@"back_icon.png" navC:whiteC midFontC:deepBlackC sideFontC:whiteC];
    self.view.backgroundColor = greenC;
    [self setTimer];
}


- (void)setTimer{
//    _timer = [NSTimer timerWithTimeInterval:1.0 target:[STWeakProxy proxyWithTarget:self] selector:@selector(timerDesc) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    //[NSTimer scheduledTimerWithTimeInterval:1.0 target:[STWeakProxy proxyWithTarget:self] selector:@selector(timerDesc) userInfo:nil repeats:YES];
//    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 block:^(NSTimer * _Nonnull timer) {
//        STLog(@"oooooooo");
//    } repeats:YES];
    //__weak typeof (self)weakSelf = self;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        STLog(@"00000");
//    });
//    [self performSelector:@selector(timerDesc) withObject:nil afterDelay:3.0];
    
}

-(void)timerDesc{
    STLog(@"888888");
}
-(void)dealloc{
    STLog(@"你就像烟火的美丽，那么美丽");
    [_timer invalidate];
    _timer = nil;
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
