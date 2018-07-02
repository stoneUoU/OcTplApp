//
//  Target_Freshs.h
//  OcTplApp
//
//  Created by test on 2018/7/2.
//  Copyright © 2018年 com.youlu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface Target_Freshs : NSObject

- (UIViewController *)Action_ToMGJRouterVC:(NSDictionary *)params;

- (UIViewController *)Action_ToCTMediatorVC:(NSDictionary *)params;

- (UIViewController *)Action_ToGCDVC:(NSDictionary *)params;

- (UIViewController *)Action_ToRunTimeVC:(NSDictionary *)params;

- (UIViewController *)Action_ToStorageVC:(NSDictionary *)params;

- (UIViewController *)Action_ToRunLoopVC:(NSDictionary *)params;

- (UIViewController *)Action_ToNSOperateVC:(NSDictionary *)params;

@end

