//
//  Tools.h
//  OcTplApp
//
//  Created by test on 2018/9/4.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tools : NSObject

- (void)doAction:(NSString *)urlStr andComplete:(void(^)(NSString *str))success;

@end
