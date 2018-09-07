//
//  TestVC.m
//  OcTplApp
//
//  Created by test on 2018/8/30.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "TestVC.h"
#import "Person+AttrAdd.h"
//#import "Person+MethodAdd.h"
#import <objc/message.h>
#import "HelloClass.h"
//#import "Person+change_m.h"
//#import "Person.h"
#import "UIButton+achrive_m.h"

@interface BB : NSObject
@property(nonatomic,assign) int age;
@end
@implementation BB
@end


typedef NS_ENUM(NSInteger, UICalu) {
    UICaluAdd,//默认从0开始
    UICaluDesc,
    UICaluMulti,
    UICaluDivide,
};


@interface TestVC (){
//    Person * _stone;
//    HelloClass * _helloClass;
}
@property (strong, nonatomic)   UIButton  *testBtn;  /**< 打印Btn */
@property (strong, nonatomic)   BB  *B;  /** B **/
@end

@implementation TestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];

//    _stone = [[Person alloc] init];
//    _stone.age = 12;
//
//
//    [_stone talkWithSms:@"我是林磊"];
//    STLog(@"%ld",_stone.age);

    //[stone toPlay:@"厦门" andIdx:@"鼓浪屿"];

    //if ([_stone respondsToSelector:@selector(toPlay:andIdx:)]){
        //这个方法是单线程的，也就是说只有当前调用此方法的函数执行完毕后，selector方法才会被调用
        //performSelectorOnMainThread:SEL withObject:obj waitUntilDone:BOOL];   waitUntilDone:YES  不等待  NO 等待
        //[stone performSelector:@selector(toCallMethod:) withObject:[NSArray arrayWithObjects:@"北京", @"故宫", nil] afterDelay:0];
        //[stone performSelector:@selector(toPlay:andIdx:) withObject:@"厦门" withObject:@"厦门大学"];
        //如何在 performSelector: withObject:afterDelay 的Object里传入多个参数
        //[self performSelector:@selector(callFooWithArray:) withObject:[NSArray arrayWithObjects:@88, @12, nil] afterDelay:0];

        //[stone performSelector:@selector(toPlay:andIdx:) withObject:@"厦门" withObject:@"厦门大学"];
    //}
    //STLog(@"*********");
//    objc_msgSend(stone, @selector(toPlay:andIdx:),@"厦门",@"环岛路");
//    objc_msgSend(stone,@selector(toCallMethod:),[NSArray arrayWithObjects:@"北京", @"长城", nil]);
    //[NSThread detachNewThreadSelector:@selector(testExcute) toTarget:self withObject:nil];
//    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(testExcute) object:nil];
//    [thread start];
//    objc_msgSend(_stone, @selector(toDo:),@"厦门",@"环岛路");
//
//    objc_msgSend([Person class], @selector(toFunc:),@"toFunc",@"厦门",10);
//
//
//    [self toCalu:3];

    //objc_msgSend([Person class], @selector(toFunc:),@"toFunc",@"厦门",10);

    //_helloClass = objc_msgSend([HelloClass class],@selector(returnInstance));

//    objc_msgSend(_helloClass, @selector(testV:),@"参数++++++");  //动态方法解析resolveInstanceMethod resolveClassMethod
//    objc_msgSend(_helloClass, @selector(helloV));

    //objc_msgSend(_helloClass, @selector(spareClassMethod:andStr:),@"参数s",@"Stone");//备用接收者forwordingTargetForSelector

    //objc_msgSend(_helloClass, @selector(forwardInvocationMethod));//完整转发 forwardInvocation

    //objc_msgSend(_helloClass, @selector());

    Person *stone = [[Person alloc] init];
    stone.age = 12;
    [stone toUoU:@""];
    //[Person toCall:@"888888888"];
//    //方法交换:
//    [stone toPlay:@"99999999" andIdx:@"99999999"];
//    objc_msgSend(stone, @selector(toDo:),@"厦门",@"环岛路");

    _B=[[BB alloc] init];

    _testBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _testBtn.frame = CGRectMake((UIScreen.mainScreen.bounds.size.width-120)/2, 450, 120, 60);
    _testBtn.backgroundColor = [UIColor redColor];
    _testBtn.st_acceptEventInterval = 2.0;
    [_testBtn setTitle:@"KVO测试" forState:UIControlStateNormal];
    [_testBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_testBtn addTarget:self action:@selector(toChangeVals:) forControlEvents:UIControlEventTouchUpInside];
    //[_testBtn toSetVals:@"00000000000"];
    [self.view addSubview:_testBtn];
    [_B addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];

    
}
-(void)toChangeVals:(UIButton *)sender{
    _B.age = 21;
}
/* 2.只要object的keyPath属性发生变化，就会调用此回调方法，进行相应的处理：UI更新：*/
//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
//                       change:(NSDictionary<NSString *,id> *)change context:(void *)context{
//    // 判断是否为_B的属性“age”:
//    if([keyPath isEqualToString:@"age"] && object == _B) {
//        // 响应变化处理：UI更新（label文本改变）
//        STLog(@"%@",[NSString stringWithFormat:@"当前的num值为：%@",
//                     [change valueForKey:@"new"]]);
//        //change的使用：上文注册时，枚举为2个，因此可以提取change字典中的新、旧值的这两个方法
//        STLog(@"\\noldnum:%@ newnum:%@",[change valueForKey:@"old"],
//              [change valueForKey:@"new"]);
//    }
//}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    STLog(@"%@",keyPath);
    STLog(@"%@",object == _B?@"YES":@"NO");
}
-(void)dealloc{
    //[super dealloc];
    /* 3.移除KVO */
    [_B removeObserver:self forKeyPath:@"age" context:nil];
}
-(void)toCalu:(NSInteger )M{
    switch (M) {
        case UICaluAdd:
            STLog(@"加");
            break;
        case UICaluDesc:
            STLog(@"减");
            break;
        case UICaluMulti:
            STLog(@"乘");
            break;
        case UICaluDivide:
            STLog(@"除");
            break;
    }
}
//-(void)testExcute{
//    STLog(@"%@",[NSThread currentThread]);
//    dispatch_async(dispatch_get_main_queue(), ^{
//        STLog(@"%@",[NSThread currentThread]);
//        [_stone performSelector:@selector(toCallMethod:) withObject:[NSArray arrayWithObjects:@"北京", @"故宫", nil] afterDelay:0];
//    });
//}

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
