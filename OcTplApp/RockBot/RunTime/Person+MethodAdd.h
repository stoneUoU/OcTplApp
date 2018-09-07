//
//  Person+MethodAdd.h
//  OcTplApp
//
//  Created by test on 2018/8/30.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "Person.h"

@interface Person (MethodAdd)

@property(nonatomic,assign)BOOL boolV;

-(void)talkWithSms:(NSString *)sms;

@end
