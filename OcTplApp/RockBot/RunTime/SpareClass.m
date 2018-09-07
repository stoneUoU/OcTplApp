//
//  SpareClass.m
//  OcTplApp
//
//  Created by test on 2018/8/30.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "SpareClass.h"

@implementation SpareClass

- (void) spareClassMethod:(NSString *)paras andStr:(NSString *)str
{
    STLog(@"_cmd: %@  =============  携带第一个参数   %@      携带第二个参数  %@", NSStringFromSelector(_cmd),paras,str);
}

@end
