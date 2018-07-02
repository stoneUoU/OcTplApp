//
//  NSObject+Swizzling.h
//  Gstore
//
//  Created by test on 2018/6/8.
//  Copyright © 2018年 com.youlu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzling)
+ (void)swizzleSelector:(SEL)originalSelector withSwizzledSelector:(SEL)swizzledSelector;
@end
