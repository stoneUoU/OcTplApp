//
//  SingleIns.m
//  OcTplApp
//
//  Created by test on 2018/9/5.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "SingleIns.h"

@implementation SingleIns

static SingleIns * _shareIns = nil;

+(id)shareIns{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareIns = [[super allocWithZone:NULL] init];
    });
    return _shareIns;
}
+(id)allocWithZone:(struct _NSZone *)zone{
    return [SingleIns shareIns];
}
+(id)copyWithZone:(struct _NSZone *)zone{
    return [SingleIns shareIns];
}

@end
