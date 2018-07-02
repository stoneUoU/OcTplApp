//
//  NSObject+HookMethod.m
//  Gstore
//
//  Created by test on 2018/6/8.
//  Copyright © 2018年 com.youlu. All rights reserved.
//

#import "NSObject+HookMethod.h"
#import <objc/message.h>
@implementation NSObject (HookMethod)
+ (BOOL)st_hookOrigMenthod:(SEL)origSel NewMethod:(SEL)altSel {
    Class class = self;
    Method origMethod = class_getClassMethod(class, origSel);
    Method altMethod = class_getClassMethod(class, altSel);
    if (!origMethod || !altMethod) {
        return NO;
    }
    Class metaClass = object_getClass(class);// <------修改
    BOOL didAddMethod = class_addMethod(metaClass,origSel,
                                        method_getImplementation(altMethod),
                                        method_getTypeEncoding(altMethod));

    if (didAddMethod) {
        class_replaceMethod(metaClass,altSel,
                            method_getImplementation(origMethod),
                            method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations(origMethod, altMethod);
    }
    return YES;
}
@end

