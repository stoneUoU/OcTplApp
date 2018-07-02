//
//  CTMediator+FreshsActions.h
//  OcTplApp
//
//  Created by test on 2018/7/2.
//  Copyright © 2018年 com.youlu. All rights reserved.
//

#import "CTMediator.h"
#import <UIKit/UIKit.h>

@interface CTMediator (FreshsActions)

- (UIViewController *)st_mediator_toMGJRouterVCWithParams:(NSDictionary *)dict;

- (UIViewController *)st_mediator_toCTMediatorVC;

- (UIViewController *)st_mediator_toGCDVC;

- (UIViewController *)st_mediator_toRunTimeVC;

- (UIViewController *)st_mediator_toStorageVC;

- (UIViewController *)st_mediator_toRunLoopVC;

- (UIViewController *)st_mediator_toNSOperateVC;

@end

