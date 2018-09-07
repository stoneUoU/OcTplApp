//
//  Tools.m
//  OcTplApp
//
//  Created by test on 2018/9/4.
//  Copyright © 2018年 Stone. All rights reserved.
//

#import "Tools.h"

typedef void(^Block)(NSString *str);

@interface Tools()

@property(nonatomic,weak)Block block;

@end

@implementation Tools

- (void)doAction:(NSString *)urlStr andComplete:(Block)success{
    NSString *resStr = [NSString stringWithFormat:@"从这个地址下载数据=======%@",urlStr];
    _block = success;
    [self afterFinish:resStr];
};

- (void)afterFinish:(NSString *)finishStr{
    _block(finishStr);
}

//进程是系统资源分配和调度的一个独立单位，用来帮程序占据一定的存储空间的
//线程是CPU独立运行和独立调度的基本单位
//一个进程可以拥有多个线程，但最少要有一个主线程,一个线程只能处于一个进程
//队列则是用于保存以及管理任务的，线程负责去队列中取任务进行执行。
//同步与异步的区别：
//1.是否等待任务执行结束    2.是否开启新线程
//队列：先进先出，排在前面的任务最先执行，队列分为串行、并行、全局和主队列。队列只是负责任务的调度，而不负责任务的执行
//并行队列：在队列中的多个任务（线程） 同时执行 （不按顺序执行）
//串行队列：在队列中的多个任务（线程）排队 依次执行（按顺序执行）
//同步:会阻塞当前线程,需等上一个任务执行完毕后下个任务才能执行，只能在当前线程执行，不会开启新线程
//异步:异步添加任务到指定的队列中，它不会做任何等待，可以继续执行任务。可以在新的线程中执行任务，具备开启新线程的能力。

//分类和类扩展的区别：
//分类能添加方法，不能扩展属性和成员变量，分类的小括号中必须有名字，若分类中声明了一个属性，那么分类只会生成这个属性的set、get方法声明
//类扩展能扩充属性，也能扩充方法，属性为私有属性，没有.m文件，则扩展中的方法必须写在主类的.m文件中

//runtime方法的作用：
//1.动态交换两个方法的实现
//2.为类别添加属性(我们知道类别是不能扩展属性的，只能扩展方法，但可以运行时实现，通过为类增加属性)
//3.获取某个类的所有成员变量和成员方法
//4.动态添加对象的成员变量和成员方法
//5.实现NSCoding的自动归档和自动解档
//objc_setAssociatedObject

//内存管理:
//OC对象是放在堆内存里，非OC对象是放在栈内存里，栈内存里的东西系统会自动管理
//僵尸对象：已经被销毁的对象（不能再使用的对象）
//野指针：指向僵尸对象（不可用内存）的指针
//空指针：s没有指向存储空间的指针（里面存的是nil，也就是0)
//retain:
//-(void)setStr:(NSString *)str{
//    if(_str !=str){
//        [_str release];
//        [str retain];
//        _str = str;
//    }
//}
//copy:(字符串，不可变数组，不可变字典，闭包)   alloc  new copy mutableCopy
//-(void)setStr:(NSString *)str{
//    if(_str !=str){
//        [_str release];
//        [str copy];
//        _str = str;
//    }
//}

//block的内存是在栈中(不需要手动去管理block内存),它不会对所引用的对象进行任何操作
//对block进行了copy操作, block的内存会搬到堆里面,它会对所引用的对象做一次retain操作
//对于普通的局部变量，block只会引用它的初值，不能跟踪它的改变；block内部能够一直被__block修饰的变量，被static修饰的变量，全局变量；
//block的本质是“带有自动变量的匿名函数”，其实就是一段代码块的内存的指针
//为什么加上 __block就可以修改外部的变量了？
//Block不允许修改外部变量的值,__block所起到的作用就是只要观察到该变量被 block 所持有，就将“外部变量”在栈中的内存地址放到了堆中。进而在block内部也可以修改外部变量的值

//kvo的底层实现原理:
//当某个类的属性对象第一次被观察时，系统会创建该类的一个派生类，在这个派生类中重写基类中被观察属性的setter 方法。派生类在被重写的 setter 方法内实现真正的通知机制
//如原类为BB，那么生成的派生类名为 NSKVONotifying_BB 每个类对象中都有一个 isa 指针指向当前类，当一个类对象的第一次被观察，那么系统会将 isa指针指向动态生成的派生类，从而在给被监控属性赋值时执行的是派生类的 setter 方法
//runtime会动态的添加（重写父类set方法）被修改属性的set方法（即setAge:），然后在set方法中，调用willChangeValueForKey/didChangeValueForKey
//[_B addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//}
//- (void)setAge:(int)age{
//    [super setAge:age];
//    [self willChangeValueForKey:@"age"];
//    [self didChangeValueForKey:@"age"];
//}

//kvc 是通过对象属性名称（Key）直接给属性值（value）编码（coding),可以通过字符串来访问对应的属性方法或成员变量
//[site setValue:@"sitename" forKey:@"name"];
//赋值实现原理:
//1、查找是否实现setter方法，如果有，优先调用setter方法完成赋值
//2、当没找到setter方法，调用accessInstanceVariablesDirectly询问。
//如果返回YES，顺序匹配变量名与 _<key>，_is<Key>,<key>,is<Key>,匹配到则设定其值
//如果返回NO,结束查找。并调用setValue：forUndefinedKey：报异常
//3、如果既没有setter也没有实例变量时，调用 setValue：forUndefinedKey：
//取值原理：
//1、查找是否实现getter方法，依次匹配`-get<Key>` 和 `-<key>` 和 `is<Key>`，如果找到，直接返回。
//需要注意的是 ：
//如果返回的是对象指针类型，则返回结果。
//如果返回的是NSNumber转换所支持的标量类型之一，则返回一个NSNumber
//否则，将返回一个NSValue
//2、当没有找到getter方法，调用accessInstanceVariablesDirectly询问
//如果返回YES， _<key>，_is<Key>,<key>,is<Key>，找到了返回对应的值
//如果返回NO，结束查找。并调用 valueForUndefinedKey: 报异常
//3、如果没找到getter方法和属性值，调用 valueForUndefinedKey: 报异常

//delegate 代理委托：“一对一”，对同一个协议，一个对象只能设置一个代理delegate，所以单例对象就不能用代理；代理更注重过程信息的传输：比如发起一个网络请求，可能想要知道此时请求是否已经开始、是否收到了数据、数据是否已经接受完成、数据接收失败

//block(闭包) block和delegate一样，一般都是“一对一”之间通信交互，相比代理block有以下特点
//1.写法更简练，不需要写protocol、函数等等
//2.block注重结果的传输：比如对于一个事件，只想知道成功或者失败，并不需要知道进行了多少或者额外的一些信息
//3.block需要注意防止循环引用


//冒泡排序:基本思想是找出最小的一个，放好；然后往前走一步，在剩下的里面找出最小的一个，放好；再往前走一步；===一直走到最后一步；
//快速排序:通过一趟排序将要排序的数据分割成独立的两部分，其中一部分的所有数据都比另外一部分的所有数据都要小，然后再按此方法对这两部分数据分别进行快速排序，整个排序过程可以递归进行，以此达到整个数据变成有序序列。

//int a = 10, b = 20;
//a = a + b;
//b = a - b;
//a = a - b;

//二分查找的优点：比较次数少、查找速度快、平均性能好
//二分查找的缺点：待查找表为有序表、插入删除困难
//就是在一个有序数组中，取数组中的中间值和要找的值进行比较，当要查找的值大于中间值，则在右边的区间继续取一个中间值和要比较的数进行比较。当找查找的值小于中间值时则反之，直至最后要查找的值和中间值相同，则说明找到该值
//必须有序，而排序本身是一件很耗时的运算；其二是增删困难，因为增删都要移动大量的结点
//因此二分查找适用于那种一经建立就很少改动、而又经常需要查找的线性表（顺序存储结构）


//NSString 的时候用copy和strong的区别：NSMutableString赋值给NSString的时候，才会有不同
//@property (retain,nonatomic) NSString *rStr;
//@property (copy, nonatomic) NSString *cStr;
//NSMutableString *mStr = [NSMutableString stringWithFormat:@"abc"];
//_rStr = mStr;
//_cStr = mStr;
//[mStr appendString:@"de"];
//NSLog(@"retainStr:%@",  _rStr); abcde
//NSLog(@"copyStr:%@",    _cStr); abc



//只有对不可变对象进行copy操作是指针复制（浅复制），其它情况都是内容复制（深复制）！

//如何让自己的类用 copy 修饰符？如何重写带 copy 关键字的 setter？
//1. 需声明该类遵从 NSCopying 协议     2. 实现 NSCopying 协议的方法。
// 该协议只有一个方法:      - (id)copyWithZone:(NSZone *)zone;

//KVC(Key-Value-Coding)：键值编码 是一种通过字符串间接访问对象的方式（即给属性赋值）
//stu.name = @"张三" // 点语法给属性赋值
//[stu setValue:@"张三" forKey:@"name"]; // 通过字符串使用KVC方式给属性赋值
//stu.nameLabel.text = @"张三";
//[stu setValue:@"张三" forKey:@"nameLabel.text"]; // 跨层赋值

// 方法和选择器有何不同？selector是一个方法的名字，方法是一个组合体，包含了名字和实现。
// 你是否接触过OC中的反射机制？简单聊一下概念和使用
//1). class反射
//通过类名的字符串形式实例化对象。
//Class class = NSClassFromString(@"student");
//Student *stu = [[class alloc] init];
//将类名变为字符串。
//Class class =[Student class];
//NSString *className = NSStringFromClass(class);
//2). SEL的反射
//通过方法的字符串形式实例化方法。
//SEL selector = NSSelectorFromString(@"setName");
//[stu performSelector:selector withObject:@"Mike"];
//将方法变成字符串。
//NSStringFromSelector(@selector*(setName:));

//block的注意点
//在block内部使用外部指针且会造成循环引用情况下，需要用__weak修饰外部指针:   __weak typeof(self) weakSelf = self;
//在block内部如果调用了延时函数还使用弱指针会取不到该指针，因为已经被销毁了，需要在block内部再将弱指针重新强引用一下:   __strong typeof(self) strongSelf = weakSelf;
//如果需要在block内部改变外部栈区变量的话，需要在用__block修饰外部变量。

//GCD 和 NSOperation 都是用于实现多线程：
//GCD 基于C语言的底层API,GCD主要与block结合使用,代码简洁,执行效率较高  GCD有更高的并发和执行能力
//NSOperation 属于Objective-C类，是基于GCD更高一层的封装。复杂任务一般用NSOperation实现,可以设定操作优先级,设定操作间的依赖关系,KVO(键值对观察)，NSOperation和容易判断Operation当前的状态

//runloop:     1.保持程序的持续运行，处理app中的各种事件      2.通过runloop，有事运行，没事就休息，可以节省cpu资源，提高程序性能

//你是怎么封装一个view的:  纯代码初始化控件时一定会走这个方法:initWithFrame    通过xib初始化控件时一定会走这个方法:initWithCoder

//辗转相除法，是求最大公约数的一种方法。它的具体做法是：用较小数除较大数，再用出现的余数（第一余数）去除除数，再用出现的余数（第二余数）去除第一余数，如此反复，直到最后余数是0为止

//如何实行cell的动态的行高        如果希望每条数据显示自身的行高，必须设置两个属性，1.预估行高，2.自定义行高。
//                            设置预估行高 tableView.estimatedRowHeight = 200。
//                            设置定义行高 tableView.estimatedRowHeight = UITableViewAutomaticDimension。
//                            如果要让自定义行高有效，必须让容器视图有一个自下而上的约束。

/// 定义一个闭包
//public typealias Callbackfunc = (_ selectIndex: String)->()
//var selIndex: Callbackfunc?
//if (selIndex != nil) {
//    selIndex!("8")
//}
//alertV.selIndex = {
//    (_ selectIndex: String) -> Void in
//    switch clickIndex {
//    case "0":
//        print("从图库里选择")
//    default:
//        break
//    }
//}
/// 定义一代理
//protocol MusicVDel:class{
//   func toSet(musicV:MusicV);
//}
//weak var musicVDel : MusicVDel?
//self.musicVDel?.toSet(musicVDel: self)

//Swift 有五个级别的访问控制权限，从高到底依次为 Open, Public, Internal, File-private, Private
//Open,具备最高的访问权限,其修饰的类和方法可以在任意Module中被访问和重写
//Public,它修饰的对象可以在任意 Module中被访问，但不能重写
//Internal,是默认的权限,它表示只能在当前定义的 Module 中访问和重写，它可以被一个 Module 中的多个文件访问，但不可以被其他的 Module 中被访问
//File-private,其被修饰的对象只能在当前文件中被使用
//Private 它的对象只能在定义的作用域内使用。离开了这个作用域，即使是同一个文件中的其他作用域，也无法访问。

//MVP:Model-View-Presenter:解除view与model的耦合，使得view或model有更强的复用性(Presenter：作为model和view的中间人，从model层获取数据之后传给view，使得View和model没有耦合)

//UICollectionView自定义layout如何实现:
//自定义一个layout实际上很简单，你只需要创建一个继承与UICollectionViewLayout的子类即可，然后重写一部分方法，在这些方法里去实现你想要的布局方式 常用方法:prepareLayout  collectionViewContentSize

//Storyboard:定位错误困难，多人开发写作若有冲突难以维护，性能瓶颈有局限性

//并行是指两个或者多个事件在同一时刻发生；而并发是指两个或多个事件在同一时间间隔发生

//OC在定义属性时有nonatomic和atomic两种选择
//atomic：原子属性，为setter方法加锁（默认就是atomic）,线程安全，需要消耗大量的资源
//nonatomic：非原子属性，不会为setter方法加锁
//atomic加锁原理
//@property (assign, atomic) int age;
//- (void)setAge:(int)age
//{
//    @synchronized(self) {
//        _age = age;
//    }
//}
//atomic可并不能保证线程安全。如果线程 A 调了 getter，与此同时线程 B 、线程 C 都调了 setter——那最后线程 A get 到的值
//3种都有可能：可能是 B、C set 之前原始的值，也可能是 B set 的值，也可能是 C set 的值。同时，最终这个属性的值，可能是 B set 的值，也有可能是 C set 的值。

//iOS动画:   CoreAnimation   CABasicAnimation——基本动画    CAKeyframeAnimation——关键帧动画   CAAnimationGroup——动画组   转场动画——CATransition
//UIView动画与核心动画的区别：
//核心动画只作用在CALayer上面，UIView是没有办法使用核心动画的
//核心动画看到的都是假象，并没有修改UIView的真实位置
//什么时候使用UIView动画？
//需要与用户进行交互的时候使用UIView动画，如果不需要与用户进行交互，两者都可以使用。
//什么时候使用核心动画？
//根据路径做动画，要使用核心动画（帧动画）
//做转场动画时，也要使用核心动画

//runtime如何通过selector找到对应的IMP地址？（分别考虑类方法和实例方法）
//每一个类对象中都一个方法列表,方法列表中记录着方法的名称,方法实现,以及参数类型,其实selector本质就是方法名称,通过这个方法名称就可以在方法列表中找到对应的方法实现.

//objc中的类方法和实例方法有什么本质区别和联系？
//类方法：
//类方法是属于类对象的
//类方法只能通过类对象调用
//类方法中的self是类对象
//类方法可以调用其他的类方法
//类方法中不能访问成员变量
//类方法中不能直接调用对象方法
//实例方法：
//
//实例方法是属于实例对象的
//实例方法只能通过实例对象调用
//实例方法中的self是实例对象
//实例方法中可以访问成员变量
//实例方法中直接调用实例方法
//实例方法中也可以调用类方法(通过类名)

//runloop的mode作用主要是用来指定事件在运行循环中的优先级的

//事件传递与响应的完整过程:
//在产生一个事件时,系统会将该事件加入到一个由UIApplication管理的事件队列中,
//UIApplication会从事件队列中取出最前面的事件,将它传递给先发送事件给应用程序的主窗口.
//主窗口会调用hitTest方法寻找最适合的视图控件,找到后就会调用视图控件的touches方法来做具体的事情.
//当调用touches方法,它的默认做法, 就会将事件顺着响应者链条往上传递，
//传递给上一个响应者,接着就会调用上一个响应者的touches方法



//ios组件化通常:url-block、protocol-class、target-action
//作用:项目经过组件化的拆分，解耦合，增强代码复用性，易管理性


//url-block: 把组件的url和block对应，放在内存中，通过url找到对应的block来实现
//registerURLPattern toHander     openURL  (蘑菇街MGJRouter)
//不足: 1.在内存中维护url-block的表，组件多了会有内存问题   2.url的参数传递受到限制，只能传递常规的字符串参数，无法传递非常规参数  3.组件的分散调用

//protocol: 定义服务接口，组件通过实现该接口来提供接口定义的服务，把protocol和class做一个映射，同时在内存中保存一张映射表，在使用时，就通过protocol找到对应的class来获取需要的服务
//registerClass forProtocol   classForProtocol  (蘑菇街MGJRouter)   解决了无法传递非常规参数问题
//不足: 1.内存中维护映射表，组件多了会有内存问题   2.组件的分散调用

//target-action:给组件封装一层target对象来对外提供服务，不会对原来组件造成入侵；然后，通过实现中间件的category来提供服务给调用者，这样使用者只需要依赖中间件，而组件则不需要依赖中间件 (CTMediator  casa大神编写)

//组件化实施的方式:
//组件化利用git的源代码管理工具来实施，建立一个项目工程私有化仓库，把各个组件的podspec上传到私有仓库，在需要用到组件时，直接从仓库里面取。
//1.封装公共库和基础UI库(将三方库和自己封装的UI库，我们可以把这些库封装成组件)
//2.独立业务模块化(独立的模块封装成组件)
//3.服务接口最小化

//ios  UIWebView 或 WKWebView 和js交互
//1.拦截url（适用于UIWebView和WKWebView）
//oc调用js:调用UIWebView的stringByEvaluatingJavaScriptFromString:方法，或者WKWebView的 evaluateJavaScript:completionHandler:
//js调用oc:实现UIWebView代理的shouldStartLoadWithRequest:navigationType:方法

//JavaScriptCore（只适用于UIWebView）

//oc调用js: JSContext  evaluateScript
//js调用oc:
//.h文件中声明一个代理并遵循JSExport，代理内的方法和js定义的方法名一致。
//.m文件中实现代理中对应的方法，可以在方法内处理事件或通知代理。

//WKScriptMessageHandler:

//WebViewJavascriptBridge:
//[WebViewJavascriptBridge enableLogging];
//_bridge = [WebViewJavascriptBridge bridgeForWebView:webView];
//[_bridge setWebViewDelegate:self];
//js调用oc:  registerHandler handler
//oc调用js:  _bridge callHandler:
- (void)setTarget{
    void(^block)(NSString *str);

    block = ^(NSString *str){
        STLog(@"%@",str);
    };

    block(@"999999999999");
}
@end
