//
//  TestingVC.h
//  OcTplApp
//
//  Created by test on 2018/8/31.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestingV.h"

#import "Tools.h"


@interface TestingVC : UIViewController<TestingVDel>

@property(nonatomic,strong)TestingV *testingV;

@end
