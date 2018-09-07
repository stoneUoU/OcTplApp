//
//  Foo.h
//  OcTplApp
//
//  Created by test on 2018/9/6.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Foo : NSObject

-(void)toFooWithStr:(NSString *)str andComplete:(void(^)(NSString *str))succ;

@end
