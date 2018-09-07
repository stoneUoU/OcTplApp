//
//  TestingV.h
//  OcTplApp
//
//  Created by test on 2018/8/31.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TestingVDel<NSObject>

-(void)toExcute:(NSString *)str;

@end

typedef void(^STBlock)(NSString *str);

@interface TestingV : UIView

@property (nonatomic, strong)UIButton *btn;

@property (nonatomic, weak)id <TestingVDel> delegate;

@property (nonatomic, copy)STBlock sTBlock;

@end
