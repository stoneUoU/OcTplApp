//
//  STWeakProxy.h
//  OcTplApp
//
//  Created by Stone on 2018/6/25.
//  Copyright © 2018年 Stone. All rights reserved.
//
// 利用NSProxy解决ViewController不走dealloc的BUG，导致NSTimer内存泄漏

#import <Foundation/Foundation.h>

@interface STWeakProxy : NSProxy

@property (nullable, nonatomic, weak, readonly) id target;
/**
 Creates a new weak proxy for target.
 
 @param target Target object.
 
 @return A new proxy object.
 */
- (instancetype)initWithTarget:(id)target;

/**
 Creates a new weak proxy for target.
 
 @param target Target object.
 
 @return A new proxy object.
 */
+ (instancetype)proxyWithTarget:(id)target;

@end
