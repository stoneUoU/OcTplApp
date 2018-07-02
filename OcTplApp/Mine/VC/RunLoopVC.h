//
//  RunLoopVC.h
//  OcTplApp
//
//  Created by Stone on 2018/7/2.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RunLoopV.h"
@interface RunLoopVC : BaseVC<RunLoopVDel,STPlaceholderViewDelegate>
//视图
@property (nonatomic,strong) RunLoopV *runLoopV;
@end
