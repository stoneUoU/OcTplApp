//
//  TestingVC.m
//  OcTplApp
//
//  Created by test on 2018/8/31.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "TestingVC.h"
#import "Stone.h"
#import "DownLoad.h"
//自己生成的对象，自己持有
//非自己生成的对象，自己也能持有
//不在需要自己持有的对象时释放
//非自己持有的对象无法释放

typedef NS_ENUM(NSInteger,STCaluMthod) {
    STCaluMthodAdd,
    STCaluMthodDesc
};


@interface TestingVC ()

@end

@implementation TestingVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        _testingV = [[TestingV alloc] init];
        _testingV.delegate =self;
        __weak typeof (self) weakSelf = self;
        _testingV.sTBlock = ^(NSString *str) {
            [weakSelf toRece:str];
        };
        _testingV.backgroundColor = [UIColor grayColor];
    }
    return self;
}

//void func1(){
//    STLog(@"执行了");
//}
//
//void func2(int a){
//    STLog(@"a=====%d",a);
//}
//
//int func3(int a,int b){
//    return a + b;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor redColor]];

//    Stone *stone = [Stone new];//[[Stone alloc] init];
//    stone.age = 12;
//    STLog(@"%lu",(unsigned long)[stone retainCount]);
//    STLog(@"%ld",(long)stone.age);
//
//    [stone release];
//
//    id mutableArr = [NSMutableArray array];
//    [mutableArr retain];
//    // 当obj不在需要持有的对象，那么，obj应该发送release消息
//    [mutableArr release];
    // 释放了对象还进行释放,会导致奔溃
    //[mutableArr release];
//    STLog(@"%lu",(unsigned long)[mutableArr retainCount]);
//    STLog(@"%@",mutableArr);

    //__weak typeof (self) weakSelf = self;

//    void (*void1)();
//    void (*void2)(int a);
//    int (*void3)(int a,int b);
//
//    void1 = func1;
//    void2 = func2;
//    void3 = func3;
//
//    void1();
//    void2(6);
//    int res = void3(10,20);
//    STLog(@"%d",res);
//
//    void (^block1)();
//    void (^block2)(int a);
//    int (^block3)(int a,int b);
//    block1 = ^(){
//        STLog(@"block1");
//    };
//    block2 = ^(int b){
//        STLog(@"block2=====%d",b);
//    };
//    block3 = ^(int a,int b){
//        return a+b;
//    };
//
//    block1();
//    block2(8);
//    int resY = block3(8,9);
//    STLog(@"%d",resY);
//
//
//
//    NSString * (^block4)(NSString * str);
//    block4 = ^(NSString * str){
//        return str;
//    };
//    NSString *str =  block4(@"oooooooooo");
//    STLog(@"%@",str);





//    int func3(int a,int b){
//        return a + b;
//    }
//    int (*void3)(int a,int b);
//    void3 = func3;
//    int res = void3(10,20);
//    STLog(@"%d",res);


//    void(^block)();
//    void(^blockWithParas)(int paras);
//    NSMutableArray * (^ResMutableArr)(NSString * str,NSString * str2);
//    block = ^(){
//        STLog(@"james");
//    };
//    blockWithParas = ^(int paras){
//        STLog(@"========%d",paras);
//    };
//    ResMutableArr = ^(NSString * str,NSString * str2){
//        return [NSMutableArray arrayWithObjects:str, str2,nil];
//    };
//    block();
//    blockWithParas(5);
//    NSMutableArray * resArr = ResMutableArr(@"我",@"林磊");
//    STLog(@"%@",resArr);

//    int val = 10;
//    void (^blk)() = ^{
//        printf("val=%d\n",val);
//    };
//    val = 2;
//    blk();

    // 定义一个block:  返回值(^Block名)(参数类型)
    //typedef void(^DictB)(NSDictionary *, BOOL);
    // 声明一个闭包
    // @property (nonatomic, copy) DictB dictB;
    //_dictB(@{@"name":@"oooooo"}, YES);
    //Sth.dictB = ^(NSDictionary *dict, BOOL b){
    //};

//    DownLoad *downLoad = [[DownLoad alloc] init];
//    [downLoad downLoadWithUrl:@"http://www.baidu.com" complete:^(NSString *str) {
//        STLog(@"%@",str);
//    }];
//
//    Tools *tools = [[Tools alloc] init];
//    [tools doAction:@"http://www.irockes.cn" andComplete:^(NSString *str) {
//        STLog(@"%@",str);
//    }];
//
//    __block int val = 10;
//    void (^blk)(void) = ^{
//        printf("val=%d\n",val);
//    };
//    val = 2;
//    blk();




//    [self setUI];
//    [self testBlock:@"8888888"];















    
}

//- (void)testBlock:(NSString *)stru{
//    __block NSString *str = @"999";
//    dispatch_async(dispatch_get_main_queue(), ^{
//        STLog(@"%@",str);
//    });
//    str = @"888";
//}

- (void)setUI {
    [self.view addSubview:_testingV];
    [self setMas];
}
-(void)setMas{
    [_testingV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(StatusBarH);
        make.left.equalTo(self.view);
        make.width.mas_equalTo(ScreenW);
        make.height.mas_equalTo(ScreenH - StatusBarH);
    }];
}
-(void)toRece:(NSString *)str{
    STLog(@"%@",str);
}

# pragma TestingVDel
-(void)toExcute:(NSString *)str{
    STLog(@"%@",str);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
