//
//  DownLoad.h
//  OcTplApp
//
//  Created by test on 2018/8/31.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownLoad : NSObject

-(void)downLoadWithUrl:(NSString *)urlStr complete:(void (^)(NSString * str))success;

@end
