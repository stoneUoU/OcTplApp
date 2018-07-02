//
//  GCDVC.h
//  OcTplApp
//
//  Created by Stone on 2018/6/24.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCDV.h"
@interface GCDVC : BaseVC<GCDVDel,STPlaceholderViewDelegate>
//视图
@property (nonatomic,strong) GCDV *gCDV;
@end
