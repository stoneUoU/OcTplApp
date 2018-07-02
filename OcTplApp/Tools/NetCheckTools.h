//
//  NetCheckTools.h
//  OcTplApp
//
//  Created by Stone on 2018/7/2.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface NetCheckTools : AFHTTPSessionManager
/** 设置全局变量的属性. */
@property (nonatomic, assign)BOOL isNetUseful;

+ (instancetype)sharedIns;
@end
