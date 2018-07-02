//
//  CTMediator+FreshsActions.m
//  OcTplApp
//
//  Created by test on 2018/7/2.
//  Copyright © 2018年 com.youlu. All rights reserved.
//

#import "CTMediator+FreshsActions.h"

@implementation CTMediator (FreshsActions)

- (UIViewController *)st_mediator_toMGJRouterVCWithParams:(NSDictionary *)dict {
    UIViewController *viewController = [self performTarget:@"Freshs" action:@"ToMGJRouterVC" params:dict shouldCacheTarget:NO];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        return viewController;
    } else {
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)st_mediator_toCTMediatorVC{
    UIViewController *viewController = [self performTarget:@"Freshs" action:@"ToCTMediatorVC" params:nil shouldCacheTarget:NO];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        return viewController;
    } else {
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)st_mediator_toGCDVC{
    UIViewController *viewController = [self performTarget:@"Freshs" action:@"ToGCDVC" params:nil shouldCacheTarget:NO];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        return viewController;
    } else {
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)st_mediator_toRunTimeVC{
    UIViewController *viewController = [self performTarget:@"Freshs" action:@"ToRunTimeVC" params:nil shouldCacheTarget:NO];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        return viewController;
    } else {
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)st_mediator_toStorageVC{
    UIViewController *viewController = [self performTarget:@"Freshs" action:@"ToStorageVC" params:nil shouldCacheTarget:NO];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        return viewController;
    } else {
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)st_mediator_toRunLoopVC{
    UIViewController *viewController = [self performTarget:@"Freshs" action:@"ToRunLoopVC" params:nil shouldCacheTarget:NO];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        return viewController;
    } else {
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)st_mediator_toNSOperateVC{
    UIViewController *viewController = [self performTarget:@"Freshs" action:@"ToNSOperateVC" params:nil shouldCacheTarget:NO];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        return viewController;
    } else {
        return [[UIViewController alloc] init];
    }
}
@end
