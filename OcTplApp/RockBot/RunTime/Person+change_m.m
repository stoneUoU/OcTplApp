//
//  Person+change_m.m
//  OcTplApp
//
//  Created by test on 2018/8/30.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "Person+change_m.h"

@implementation Person (change_m)

+ (void)load{
    Method m1 = class_getInstanceMethod(self,@selector(toPlay: andIdx:));
    Method m2 = class_getInstanceMethod(self,@selector(toPlay: andMs:));
    method_exchangeImplementations(m1, m2);


    Method m3 = class_getClassMethod(objc_getMetaClass("Person"),@selector(toCall:));
    Method m4 = class_getInstanceMethod(objc_getMetaClass("Person"),@selector(toCallSth:));
    method_exchangeImplementations(m3, m4);
}

-(void)toPlay:(NSString *)str andMs:(NSString *)ms{
    STLog(@"我是林磊丫");
}

+(void)toCallSth:(NSString *)str{
    STLog(@"%@",str);
}

+(void)toUoU:(NSString *)str{
    STLog(@"func toMoM");
};
@end
