//
//  Target_Freshs.m
//  OcTplApp
//
//  Created by test on 2018/7/2.
//  Copyright © 2018年 com.youlu. All rights reserved.
//

#import "Target_Freshs.h"
#import "MGJRouterVC.h"
#import "CTMediatorVC.h"
#import "RunTimeVC.h"
#import "GCDVC.h"
#import "StorageVc.h"
#import "RunLoopVC.h"
#import "NSOperateVC.h"
@implementation Target_Freshs

- (UIViewController *)Action_ToMGJRouterVC:(NSDictionary *)params {
    MGJRouterVC *mGJRouterV = [[MGJRouterVC alloc] init];
    if (params) {
        mGJRouterV.pass_vals = params;
    }
    return mGJRouterV;
}
- (UIViewController *)Action_ToCTMediatorVC:(NSDictionary *)params {
    CTMediatorVC *cTMediatorV = [[CTMediatorVC alloc] init];
    return cTMediatorV;
}

- (UIViewController *)Action_ToGCDVC:(NSDictionary *)params {
    GCDVC *gCDV = [[GCDVC alloc] init];
    return gCDV;
}

- (UIViewController *)Action_ToRunTimeVC:(NSDictionary *)params {
    RunTimeVC *runTimeV = [[RunTimeVC alloc] init];
    return runTimeV;
}

- (UIViewController *)Action_ToStorageVC:(NSDictionary *)params{
    StorageVC *storageV = [[StorageVC alloc] init];
    return storageV;
};

- (UIViewController *)Action_ToRunLoopVC:(NSDictionary *)params{
    RunLoopVC *runLoopV = [[RunLoopVC alloc] init];
    return runLoopV;
};

- (UIViewController *)Action_ToNSOperateVC:(NSDictionary *)params{
    NSOperateVC *nSOperateV = [[NSOperateVC alloc] init];
    return nSOperateV;
};
@end
