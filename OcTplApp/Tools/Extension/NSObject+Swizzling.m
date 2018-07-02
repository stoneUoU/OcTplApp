//
//  NSObject+Swizzling.m
//  Gstore
//
//  Created by test on 2018/6/8.
//  Copyright © 2018年 com.youlu. All rights reserved.
//

#import "NSObject+Swizzling.h"

@implementation NSObject (Swizzling)

+ (void)swizzleSelector:(SEL)originalSelector withSwizzledSelector:(SEL)swizzledSelector
{
    Class class = [self class];

    Method originalMethod = class_getInstanceMethod(class, originalSelector);

    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);

    // 若已经存在，则添加会失败

    BOOL didAddMethod = class_addMethod(class,originalSelector,

                                        method_getImplementation(swizzledMethod),

                                        method_getTypeEncoding(swizzledMethod));

    // 若原来的方法并不存在，则添加即可

    if (didAddMethod) {

        class_replaceMethod(class,swizzledSelector,

                            method_getImplementation(originalMethod),

                            method_getTypeEncoding(originalMethod));

    } else {

        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
@end
