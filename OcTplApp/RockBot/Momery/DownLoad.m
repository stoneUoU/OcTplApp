//
//  DownLoad.m
//  OcTplApp
//
//  Created by test on 2018/8/31.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "DownLoad.h"

typedef void(^MyComplete)(NSString *str);

@interface DownLoad()

@property(nonatomic, copy) MyComplete myComplete;

@end

@implementation DownLoad


-(void)downLoadWithUrl:(NSString *)urlStr complete:(MyComplete)success{

    _myComplete = success;

    [self downLoadInFunc];
};

-(void)downLoadInFunc{
    NSString * str = @"从这个网址下载数据";

    _myComplete(str);
}
@end
