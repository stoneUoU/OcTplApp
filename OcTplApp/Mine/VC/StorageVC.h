//
//  StorageVC.h
//  OcTplApp
//
//  Created by Stone on 2018/7/2.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StorageV.h"
@interface StorageVC : BaseVC<StorageVDel,STPlaceholderViewDelegate>
//视图
@property (nonatomic,strong) StorageV *storageV;
@end
