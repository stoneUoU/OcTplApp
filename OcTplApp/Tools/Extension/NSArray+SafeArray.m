//
//  NSArray+SafeArray.m
//  Gstore
//
//  Created by test on 2018/6/8.
//  Copyright © 2018年 com.youlu. All rights reserved.
//

#import "NSArray+SafeArray.h"
#import "NSObject+HookMethod.h"
@implementation NSArray (SafeArray)
+(void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSArrayI") st_hookOrigMenthod:@selector(objectAtIndex:) NewMethod:@selector(safe_objectAtIndex:)];
    });
}
- (id)safe_objectAtIndex:(NSUInteger)index {
    // 数组越界也不会崩，但是开发的时候并不知道数组越界
    if (index > (self.count - 1)) { // 数组越界
        NSAssert(NO, @"数组越界了"); // 只有开发的时候才会造成程序崩了
        return nil;
    }else { // 没有越界
        return [self safe_objectAtIndex:index];
    }
}
@end
