//
//  NSObject+HookMethod.h
//  Gstore
//
//  Created by test on 2018/6/8.
//  Copyright © 2018年 com.youlu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (HookMethod)
+ (BOOL)st_hookOrigMenthod:(SEL)origSel NewMethod:(SEL)altSel;
@end
