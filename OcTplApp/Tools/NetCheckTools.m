//
//  NetCheckTools.m
//  OcTplApp
//
//  Created by Stone on 2018/7/2.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "NetCheckTools.h"

@implementation NetCheckTools
+ (instancetype)sharedIns {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
- (instancetype)init {
    if ((self = [super init])) {
        // 设置超时时间，afn默认是60s
        self.requestSerializer.timeoutInterval = 30;
        // 响应格式添加text/plain
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
        
        // 监听网络状态,每当网络状态发生变化就会调用此block
        __weak typeof(self) weakSelf = self;
        [self.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusNotReachable:     // 无连线
                    STLog(@"AFNetworkReachability Not Reachable");
                    weakSelf.isNetUseful = NO;
                    break;
                case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                    STLog(@"AFNetworkReachability Reachable via WWAN");
                    weakSelf.isNetUseful = YES;
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi: // WiFi
                    STLog(@"AFNetworkReachability Reachable via WiFi");
                    weakSelf.isNetUseful = YES;
                    break;
                case AFNetworkReachabilityStatusUnknown:          // 未知网络
                default:
                    STLog(@"AFNetworkReachability Unknown");
                    weakSelf.isNetUseful = YES;
                    break;
            }
        }];
        // 开始监听
        [self.reachabilityManager startMonitoring];
    }
    return self;
}
@end

