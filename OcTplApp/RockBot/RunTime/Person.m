//
//  Person.m
//  OcTplApp
//
//  Created by test on 2018/8/30.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)toPlay:(NSString *)str andIdx:(NSString *)idx{
    STLog(@"去哪个城市玩------------%@============%@",str,idx);
}
- (void) toCallMethod: (NSArray *) inArr
{
    [self toPlay: [inArr objectAtIndex:0] andIdx: [inArr objectAtIndex:1]];
}

+ (void)toCall:(NSString *)str{
    STLog(@"ooooooooooo");
};

-(void)toUoU:(NSString *)str{
    STLog(@"func toUoU");
};
@end
